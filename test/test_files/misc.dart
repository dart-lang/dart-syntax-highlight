// Copyright 2022 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library foo;

external int get externalInt;

typedef StringAlias = String;
typedef void FunctionAlias1(String a, String b);
typedef FunctionAlias2 = void Function(String a, String b);

void misc(int a, {required int b}) {
  assert(true);
  assert(1 == 1, 'fail');

  var a = new String.fromCharCode(1);
  const b = int.fromEnvironment('');
  final c = '';
  late final d = '';
  print(d is String);
  print(d is! String);
}

class Covariance<T> {
  void covariance(covariant List<T> items) {}
}
