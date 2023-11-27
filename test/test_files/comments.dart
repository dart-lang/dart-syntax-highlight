// Copyright 2022 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Multiline dartdoc comment.
///
/// ```
/// doc
/// ```
///
/// ...
var a;

/// ``
var noInlineCode;

/// `Stream<int>`
var inlineCode;

/// ` `
var inlineCodeJustWhitespace;

/*
 * Old-style dartdoc
 *
 * ...
 */
var b;

/* Inline block comment */
var c;

/**
 * Nested block
 *
 * /**
 *  * Nested block
 *  */
 */
var d;

/**
 * Nested
 *
 * /* Inline */
 */
var e;

/* Nested /* Inline */ */
var f;

// Simple comment
var g;

/// Dartdoc with reference to [a].
/// And a link to [example.org](http://example.org/).
var h;

class A<dynamic /* comment */ > {
  void b<dynamic /* comment */ >() {}
  Future<dynamic /* comment */ > c() {}
}
