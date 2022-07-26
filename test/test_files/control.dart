// Copyright 2022 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

void err() {
  try {
    throw '';
  } on ArgumentError {
    rethrow;
  } catch (e) {
    print('e');
  }
}

void loops() {
  while (1 > 2) {
    if (3 > 4) {
      continue;
    } else {
      break;
    }
    return;
  }

  do {
    print('');
  } while (1 > 2);
}

void switches() {
  Object? i = 1;
  switch (i as int) {
    case 1:
      break;
    default:
      return;
  }
}

void conditions() {
  if (1 > 2) {
  } else if (3 > 4) {
  } else {}
}
