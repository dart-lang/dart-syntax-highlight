## 1.4.0 (2024-10-30)

- Removed use of 'while' in the grammar to avoid some differences in implementations between GitHub and VS Code
- Improved handling of unclosed code blocks in dartdoc comments

## 1.3.0 (2024-07-31)

- Added support for digit separators (`_`).

## 1.2.9 (2024-04-24)

- Added support for `macro`, `augment library`, `import augment`, `augment`, `augmented`.

## 1.2.8 (2024-04-08)

- Improve handling of braces inside string interpolation so `}` in expressions are not considered the end of the interpolation.
- Change nested expression scopes from `string.interpolated.expression.dart` to `meta.embedded.expression.dart`.

## 1.2.7 (2024-02-08)

- Updated the scope for `return` keywords from `keyword.control.dart` to `keyword.control.return.dart`.

## 1.2.6 (2024-01-25)

- Don't highlight methods named `get`/`set` with type parameters as keywords.

## 1.2.5 (2023-11-27)

- Don't mark empty double backticks as inline code.

## 1.2.4 (2023-11-26)

- Include the opening `$` of a simple identifier string interpolation
  inside the `string.interpolated.expression.dart` scope.

## 1.2.3 (2023-09-11)

- Removed support for `inline class` keyword and
  added support for `extension type`.

## 1.2.2 (2023-06-28)

- Added support for `inline class`.

## 1.2.1 (2023-05-04)

- Fixed highlighting of comments inside type arguments.

## 1.2.0 (2023-01-30)

- Added support for class modifiers.
- Added support for some patterns.
- Identifiers preceding `=>` are no longer coloured as
  functions/methods if they do not have parens.

## 1.1.1 (2022-12-13)

- Fixed highlighting of names that match some
  reserved words/classes with a `$` prefix/suffix.

## 1.1.0 (2022-12-07)

- Improved handling of nested type parameters/arguments.
- Improved handling of class declarations with
  both type arguments and `extends`.
- Fixed handling of `get` and `set` as function names.

## 1.0.0 (2022-07-26)

- Added an initial version number to the `grammars/dart.json` to help
  compare versions for projects using a copy of this file.
