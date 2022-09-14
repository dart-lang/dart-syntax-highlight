// Copyright 2022 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

(int aaa, int, {String? ccc})? ddd;

(int aaa, int bbb) foo((String aaaa, String? bbbb) ccc) {
  final ddd = (1, 2, eee: '');
  return (1, 2);
}

class R {
  (int aaa, int, {String? ccc})? get ddd => null;
  final eee = (1, 2, eee: '');
}
