// Copyright 2022 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

void simplePrint() {
  print('hello world');
}

noReturnValue() {
  print('hello world');
}

void returns() {
  return;
}

Future<void> asyncPrint() async {
  await Future.delayed(const Duration(seconds: 1));
  print('hello world');
}

Map<T1, List<T2>> nestedGenerics<T1, T2 extends String>() {
  return {};
}

Iterable<String> syncYield() sync* {
  yield '';
}

Iterable<String> syncYieldStar() sync* {
  yield* syncYield();
}

Stream<String> asyncYield() async* {
  await Future.delayed(const Duration(seconds: 1));
  yield '';
}

Stream<String> asyncYieldStar() async* {
  await Future.delayed(const Duration(seconds: 1));
  yield* asyncYield();
}
