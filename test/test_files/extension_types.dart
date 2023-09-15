// Copyright (c) 2023, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

extension type MyInt(int it) {
  void foo() { print(it.isEven); }
}

final extension = 1;
int get extension => 1;
set extension(int value) {}
void extension() {
  var extension = 1;
}

final type = 1;
int get type => 1;
set type(int value) {}
void type() {
  var type = 1;
}
