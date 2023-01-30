// Copyright (c) 2022, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';
import 'package:collection/collection.dart';
import 'package:path/path.dart' as path;

import 'support/span_parser.dart';

void main() {
  final projectRoot = path.normalize(
    path.join(path.basename(Platform.script.toFilePath()), '..'),
  );
  final testFileDirectory =
      Directory(path.join(projectRoot, 'test', 'test_files'));
  final goldenDirectory = Directory(path.join(projectRoot, 'test', 'goldens'));
  final grammarFile = File(path.join(projectRoot, 'grammars/dart.json'));
  final grammar = Grammar.fromJson(jsonDecode(grammarFile.readAsStringSync()));
  final updateGoldens = Platform.environment.containsKey('UPDATE_GOLDENS');

  group('golden', () {
    final testFiles = testFileDirectory
        .listSync()
        .whereType<File>()
        .where((file) => path.extension(file.path) == '.dart')
        .where((file) =>
            path.withoutExtension(path.basename(file.path)) != 'support');

    for (final testFile in testFiles) {
      final goldenFile = File(path.join(
        goldenDirectory.path,
        '${path.basename(testFile.path)}.golden',
      ));
      test(path.basename(testFile.path), () {
        if (!goldenFile.existsSync() && !updateGoldens) {
          fail('Missing golden file: ${goldenFile.path}');
        }

        final content = testFile.readAsStringSync();
        final spans = SpanParser.parse(grammar, content);
        final actual = _buildGoldenText(content, spans);

        if (updateGoldens) {
          goldenFile.writeAsStringSync(actual);
        } else {
          final expected = goldenFile.readAsStringSync();
          expect(_normalize(actual), _normalize(expected));
        }
      });
    }
  });
}

String _buildGoldenText(String content, List<ScopeSpan> spans) {
  final buffer = StringBuffer();
  final spansByLine = groupBy(spans, (ScopeSpan s) => s.line - 1);

  final lines = content.trim().split('\n');
  for (var i = 0; i < lines.length; i++) {
    final line = lines[i];
    // We need the line length to wrap. If this isn't the last line, account for
    // the \n we split by.
    final newlineLength = (i == lines.length - 1) ? 0 : 1;
    final lineLengthWithNewline = line.length + newlineLength;

    buffer.writeln('>$line');
    final lineSpans = spansByLine[i];
    if (lineSpans != null) {
      for (final span in lineSpans) {
        final col = span.column - 1;
        var length = span.length;

        // Spans may roll over onto the next line, so truncate them and insert
        // the remainder into the next.
        if (col + length > lineLengthWithNewline) {
          final thisLineLength = line.length - col;
          final offsetToStartOfNextLine = lineLengthWithNewline - col;
          length = thisLineLength;
          spansByLine[i + 1] ??= [];
          // Insert the wrapped span before other spans on the next line so the
          // order is preserved.
          spansByLine[i + 1]!.insert(
            0,
            ScopeSpan(
              scopes: span.scopes,
              startLocation: ScopeStackLocation(
                position: span.start + offsetToStartOfNextLine,
                line: span.line + 1,
                column: 0,
              ),
              endLocation: span.endLocation,
            ),
          );
        } else if (col + length > line.length) {
          // Truncate any spans that include the trailing newline.
          length = line.length - col;
        }

        // If this span just covers the trailing newline, skip it
        // as it doesn't produce any useful output.
        if (col == line.length) {
          continue;
        }

        buffer.write('#');
        buffer.write(' ' * col);
        buffer.write('^' * length);
        buffer.write(' ');
        buffer.writeln(span.scopes.join(' '));
      }
    }
  }

  return buffer.toString();
}

/// Normalises newlines in code for comparing.
String _normalize(String code) => code.replaceAll('\r', '');
