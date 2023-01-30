// Copyright (c) 2023, the Dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Classes and variables here are not part of the golden tests, they are here
// to avoid polluting test files with definitions that can be used by test files
// to avoid polluting them with code unrelated to the syntax being tested.

import 'dart:math' as math;

abstract class Shape {
  double calculateArea();
  double get size => calculateArea();
}

class Square extends Shape {
  final double length;
  Square(this.length);

  double calculateArea() => length * length;
}

class Circle extends Shape {
  final double radius;
  Circle(this.radius);

  double calculateArea() => math.pi * radius * radius;
}

var testShape = Circle(123);

enum Color { red, yellow, blue, green }

Color testColor = Color.red;

var testRecord = (1, 2);
var testList = [1, 2, 3];
var testMap = {'first': 1, 'second': 2};

const space = 32;
const zero = 48;
const nine = 57;

String? maybeString = '';
Object testObject = Object();

class Rect {
  final double width, height;

  Rect(this.width, this.height);
}
