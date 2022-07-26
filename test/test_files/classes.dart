// Copyright 2022 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

class Class1 {}

abstract class Class2 implements Class1 {
  String get a;
  set a(String value);
}

class Class3 extends Class2 with MyMixin {
  @override
  String get a => '';

  @override
  set a(String value) {}

  void method() {}
}

class Class4<T extends Class2> implements Class1 {}

class MyClass {
  void method1() {}
  void Method2() {}
  void get() {}
  void set() {}

  String? _foo;
  String? get foo => _foo;
  set foo(String? value) => _foo = value;
}

mixin MyMixin {}

mixin MyMixin2 on Class1 {}

extension on String {}

extension StringExtension on String {}
