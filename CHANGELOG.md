## 1.2.6 (2024-01-25)

- Don't highlight methods named `get`/`set` with type parameters as keywords.

## 1.2.5 (2023-11-27)

- Don't mark empty double backticks as inline code.

## 1.2.4 (2023-11-26)

- Include the opening `$` of a simple identifier string interpolation
  inside the `string.interpolated.expression.dart` scope.

## 1.2.3 (2023-09-11)

- Removed support for `inline class` keyword and added support for `extension type`.

## 1.2.2 (2023-06-28)

- Added support for `inline class`.

## 1.2.1 (2023-05-04)

- Fixed highlighting of comments inside type arguments.

## 1.2.0 (2023-01-30)

- Added support for class modifiers.
- Added support for some patterns.
- Identifiers preceeding `=>` are no longer coloured as functions/methods if they do not have parens.

## 1.1.1 (2022-12-13)

- Fixed highlighting of names that match some reserved words/classes with a `$` prefix/suffix.

## 1.1.0 (2022-12-07)

- Improved handling of nested type parameters/arguments.
- Improved handling of class declarations with both type arguments and `extends`.
- Fixed handling of `get` and `set` as function names.

## 1.0.0 (2022-07-26)

- Added an initial version number to the `grammars/dart.json` to help compare versions for projects using a copy of this file.
