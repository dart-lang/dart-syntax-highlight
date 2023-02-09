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
  final grammar = _loadGrammar();
  final updateGoldens = Platform.environment.containsKey('UPDATE_GOLDENS');

  group('golden', () {
    for (final testFile in _testFiles) {
      final goldenFile = _getTheGoldenOfTestFile(testFile);

      test(testFile.fileName, () {
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


extension on File {
  String get fileName => path.basename(this.path);
}

extension on String {
  List<String> get lines => this.trim().split('\n');
}



/// Returns the root of this project
String get _projectRoot {
  final scriptPath = Platform.script.toFilePath();
  final scriptName = path.basename(scriptPath);
  final scriptDirectory = path.join(scriptName, '..');
  final projectRoot = path.normalize(scriptDirectory);
  return projectRoot;
}

/// Returns the path to the Golden file of the given Test file.
String _goldenFilePath(File testFile) {
  final testFileName = testFile.fileName;
  final goldenFileName = '$testFileName.golden';
  final goldenPath = path.join(_goldensDirectory.path, goldenFileName);
  return goldenPath;
}

/// Path to the grammar file
final _grammarFilePath = path.join(_projectRoot, 'grammars', 'dart.json');



/// Directory of Test Files
final _testFileDirectory =
    Directory(path.join(_projectRoot, 'test', 'test_files'));

/// Directory of the Goldens
final _goldensDirectory = Directory(path.join(_projectRoot, 'test', 'goldens'));

/// The grammar file
final _grammarFile = File(_grammarFilePath);

/// Returns the test files within the test directory
Iterable<File> get _testFiles => _testFileDirectory
    .listSync()
    .whereType<File>()
    .where((file) => path.extension(file.path) == '.dart');

/// Returns the Golden file of the Test file.
File _getTheGoldenOfTestFile(File testFile) => File(_goldenFilePath(testFile));



/// The Grammar
Grammar _loadGrammar() {
  final grammarString = _grammarFile.readAsStringSync();
  final grammarWithFixedLookaheads = grammarString.replaceAll("(?>!", "(?!");
  final decodedGrammar = jsonDecode(grammarWithFixedLookaheads);
  final grammar = Grammar.fromJson(decodedGrammar);
  return grammar;
}



/// Builds the goldens
String _buildGoldenText(String content, List<ScopeSpan> spans) {
  final buffer = StringBuffer();
  final spansByLine = groupBy(spans, (ScopeSpan s) => s.line - 1);
  final lines = content.lines;

  for (var lineIndex = 0; lineIndex < lines.length; lineIndex++) {
    final line = lines[lineIndex];

    // We need the line length to wrap. If this isn't the last line, account for
    // the \n we split by.
    final newlineLength = (lineIndex == lines.length - 1) ? 0 : 1;
    final lineLengthWithNewline = line.length + newlineLength;

    buffer.writeln('>$line');
    final lineSpans = spansByLine[lineIndex];
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
          spansByLine[lineIndex + 1] ??= [];

          // Insert the wrapped span before other spans on the next line so the
          // order is preserved.
          spansByLine[lineIndex + 1]!.insert(
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

/// Normalizes newlines in code for comparing.
String _normalize(String code) => code.replaceAll('\r', '');
