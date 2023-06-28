// Copyright (c) 2023, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

inline class MyInt {
  final int it;
  MyInt(this.it);
  void foo() { print('MyInt.foo'); }
}

final inline = 1;

int get inline => 1;
set inline(int value) {}

void inline() {
  var inline = 1;
}
