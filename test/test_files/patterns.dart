// Copyright (c) 2023, the Dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math' as math;

import 'support.dart';

// Samples taken from
// https://github.com/dart-lang/language/blob/master/accepted/future-releases/0546-patterns/feature-specification.md

void destructuring() {
  var (lat, long) = testRecord;
  var [a, b, c] = testList;
  var {'first': first, 'second': second} = testMap;
}

double algebraicDataTypes(Shape shape) =>
  switch (shape) {
    Square(length: var l) => l * l,
    Circle(radius: var r) => math.pi * r * r
  };

void logicalOr() {
  var isPrimary = switch (testColor) {
    Color.red || Color.yellow || Color.blue => true,
    _ => false
  };

  switch (testShape) {
    case Square(size: var s) || Circle(size: var s) when s > 0:
      print('Non-empty symmetric shape');
    case Square() || Circle():
      print('Empty symmetric shape');
    default:
      print('Asymmetric shape');
  }

  switch (testList) {
    case ['a' || 'b', var c]:
  }
}

String logicalAnd_relational(int char) {
  return switch (char) {
    < space => 'control',
    == space => 'space',
    > space && < zero => 'punctuation',
    >= zero && <= nine => 'digit'
  };
}

void castPattern() {
  var (i as int, j as int) = testRecord;
}

void nullCheckPattern_nullAssertPattern() {
  switch (maybeString) {
    case var s?:
  }

  var (x!, y!) = testRecord;

  switch (testList) {
    case ['user', var name!]:
  }
}

void variablePattern() {
  switch ((1, 2, 3)) {
    case (var a, final b, _):
  }
  switch ((1, 2, 3)) {
    case (int a, String b, String _):
  }
}

void listPatterns() {
  var [_, two, _] = testList;
  var [a, b, ...rest, c, d] = [1, 2, 3, 4, 5, 6, 7];
}

void mapPatterns() {
  var {'field1': String field1, ... } = { 'field1': 'value1', 'field2': 'value2' };
}

void recordPatterns() {
  // Variable:
  var (untyped: untyped, typed: int typed) = testRecord;
  var (:untyped, :int typed) = testRecord;

  switch (testObject) {
    case (untyped: var untyped, typed: int typed):
    case (:var untyped, :int typed):
  }

  // Null-check and null-assert:
  switch (testObject) {
    case (checked: var checked?, asserted: var asserted!):
    case (:var checked?, :var asserted!):
  }

  // Cast:
  var (field: field as int) = testRecord;
  var (:field as int) = testRecord;
}

void objectPatterns(Object obj) {
  switch (obj) {
    case Rect(width: var w, height: var h):
    default:
  }
  switch (obj) {
    case Rect(:var width, :var height):
    default:
  }
}
