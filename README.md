# Solutions in this repo

[![Dart](https://github.com/dart-lang/dart-syntax-highlight/actions/workflows/dart.yml/badge.svg)](https://github.com/dart-lang/dart-syntax-highlight/actions/workflows/dart.yml)

## grammars/dart.json

The primary [TextMate](https://macromates.com/manual/en/language_grammars) language grammar for Dart. This grammar is used by most editors and websites to provide syntax highlighting for Dart code.

It includes support for modern Dart features, including:
* **Dart 3.x**: Patterns (`switch` expressions, `if-case`), Records, Class Modifiers (`sealed`, `base`, `interface`, `final`), and Extension Types.
* **Macros & Augmentations**: Support for `macro`, `augment`, and `augmented`.

### Used by:

* **Editors**:
  * [Dart-Code](https://github.com/Dart-Code/Dart-Code) extension for VS Code.
  * VS Code's [built-in Dart](https://github.com/microsoft/vscode/tree/main/extensions/dart) basic language support.
* **Websites & Documentation**:
  * [GitHub](https://github.com) via [Linguist](https://github.com/github-linguist/linguist).
  * [dart.dev](https://dart.dev) and [docs.flutter.dev](https://docs.flutter.dev) via [Shiki](https://shiki.style).
  * [Dart & Flutter DevTools](https://github.com/flutter/devtools).
* **Packages**:
  * [`package:syntax_highlight`](https://pub.dev/packages/syntax_highlight) - A Flutter package for syntax highlighting using this grammar.

### Updating the Grammar

When updating the grammar, consider raising issues (or PRs) to update the following files which may not have automated updates from this repository:

* [Dart-Code/Dart-Code/syntaxes/dart.json](https://github.com/Dart-Code/Dart-Code/blob/master/syntaxes/dart.json)
* [flutter/devtools/packages/devtools_app/assets/dart_syntax.json](https://github.com/flutter/devtools/blob/master/packages/devtools_app/assets/dart_syntax.json)

# Other solutions

These projects use different highlighting engines and maintain their own Dart grammars.

## Tree-sitter

[Tree-sitter](https://tree-sitter.github.io/tree-sitter/) is an incremental parsing system. There is no official tree-sitter grammar for Dart, but there are active community implementations:

* [UserNobody14/tree-sitter-dart](https://github.com/UserNobody14/tree-sitter-dart)
* [nielsenko/tree-sitter-dart](https://github.com/nielsenko/tree-sitter-dart)

## highlight.js

[highlight.js](https://highlightjs.org/) is a JavaScript-based syntax highlighter.

* [Dart-specific implementation](https://github.com/highlightjs/highlight.js/blob/main/src/languages/dart.js)
* Used by:
  * [DartDoc](https://github.com/dart-lang/dartdoc)
  * [pub.dev](https://github.com/dart-lang/pub-dev/)

## CodeMirror

[CodeMirror](https://codemirror.net/) is a web-based code editor.

* [CodeMirror 5 Dart mode](https://github.com/codemirror/codemirror5/tree/master/mode/dart) (Used by [DartPad](https://dartpad.dev)).
* CodeMirror 6 supports Dart via [`@codemirror/legacy-modes`](https://github.com/codemirror/legacy-modes).

## PrismJS

[Prism](https://prismjs.com/) is a lightweight, extensible syntax highlighter.

* [Dart-specific implementation](https://github.com/PrismJS/prism/blob/master/components/prism-dart.js)
