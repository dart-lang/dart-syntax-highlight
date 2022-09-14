// Copyright 2022 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

(int, int)? aaa;
(int aaa, int bbb)? bbb;
(int aaa, int, {String? ccc})? ccc;
(int, (int, (int, String)))? ddd;

(int aaa, int bbb) func((String aaaa, String? bbbb) ccc) {
  final ddd = (1, 2, eee: '');
  return (1, 2);
}

class R {
  (int aaa, int, {String? ccc})? get getter => null;
  final variable = (1, 2, eee: '');
}
