# Solutions in this repo

![](https://github.com/dart-lang/dart-syntax-highlight/workflows/Dart/badge.svg)

## grammars/dart.json

A [TextMate](https://macromates.com/manual/en/language_grammars) language grammar for Dart.

Used by:

* The [Dart-Code](https://github.com/Dart-Code/Dart-Code) Dart extension for VS Code.
* VS Code's [built-in Dart](https://github.com/microsoft/vscode/tree/main/extensions/dart) basic language support.
* [Dart & Flutter DevTools](https://github.com/flutter/devtools).
* [GitHub](https://github.com) via [Linguist](https://github.com/github/linguist).
* [dart.dev](https://dart.dev) via [Shiki](https://shiki.style).

When updating the grammar, consider raising issues (or PRs) to update the
following files which do not have automated updates from this grammar:

* [Dart-Code/Dart-Code/syntaxes/dart.json](https://github.com/Dart-Code/Dart-Code/blob/master/syntaxes/dart.json)
* [flutter/devtools/packages/devtools_app/assets/dart_syntax.json](https://github.com/flutter/devtools/blob/master/packages/devtools_app/assets/dart_syntax.json)

# Other solutions

## highlight.js

[highlight.js](https://highlightjs.org/) is web based syntax highlighter that
can syntax highlight `<code>` references on a web page.

* [Dart-specific code](https://github.com/highlightjs/highlight.js/blob/main/src/languages/dart.js)
* Used by:
  * [DartDoc](https://github.com/dart-lang/dartdoc)
    * See https://github.com/dart-lang/dartdoc/tree/main/lib/resources
  * [pub.dev](https://github.com/dart-lang/pub-dev/)
    * See https://github.com/dart-lang/pub-dev/tree/master/third_party/highlight

## CodeMirror

[CodeMirror](https://codemirror.net/) is a web-based editing component
with Dart highlighting support.

* CodeMirror 5 [Dart mode implementation](https://github.com/codemirror/codemirror5/tree/master/mode/dart)
* Used by:
  * DartPad
