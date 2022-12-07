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

mixin MyMixin2<T> on Class1 {}

extension on String {}

extension StringExtension on String {}

extension StringListExtension on List<String> {}

extension<T extends String> on T {}

class my_lowercase_class {
  my_lowercase_class? foo() => null;
  List<my_lowercase_class>? bar() => null;
}

class A1<T> {}

class A2<T> extends A1<T> {}

class A3<T> implements A1<T> {}

class A4<T> with MyMixin2<T> {}
