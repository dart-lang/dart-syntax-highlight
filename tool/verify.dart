// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:io';

void main() {
  // Validate the grammars/dart.json file.
  final grammarFile = File('grammars/dart.json');

  try {
    jsonDecode(grammarFile.readAsStringSync());
    print('${grammarFile.path} ok.');
    exit(0);
  } catch (e) {
    print('Error parsing ${grammarFile.path}: $e');
    exit(1);
  }
}
