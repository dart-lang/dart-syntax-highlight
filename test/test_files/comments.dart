// Copyright 2022 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Multiline dartdoc comment with triple backticks.
///
/// ```
/// code
/// ```
///
/// ...
var doc1;

/// Multiline dartdoc comment with unclosed triple backticks.
///
/// ```
/// code
var doc2;

/// Multiline dartdoc comment with unclosed backticks.
///
/// `code
var doc3;

/// Multiline dartdoc comment with indented code.
///
///     code1
///     code2
///
///     code3
///
/// ...
var doc4;

/** Block dartdoc comment with triple backticks.
 *
 * ```
 * code
 * ```
 *
 * ...
 */
var blockDoc1;

/** Block dartdoc comment with unclosed triple backticks.
 *
 * ```
 * code
 */
var blockDoc2;

/** Block dartdoc comment with unclosed backticks.
 *
 * `code
 */
var blockDoc3;

/** Block dartdoc comment with indented code.
 *
 *     code1
 *     code2
 *
 *     code3
 *
 * ...
 */
var blockDoc4;

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
 *   /**
 *    * bbb
 *    */
 */
var d2;

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

class A<T /* comment */ > {
  void b<T /* comment */ >() {}
  Future<T /* comment */ > c() {}
}
