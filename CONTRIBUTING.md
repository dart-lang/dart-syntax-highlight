# How to Contribute

For license agreement and CLA information, contribution workflow information, code reviews, code style, and community guidelines, please see <https://github.com/dart-lang/.github/blob/main/CONTRIBUTING.md>.


# Adding Tests for Changes

In the `test/test_files` folder are a set of `.dart` files that are parsed using the grammar. Text representations of the results are stored in `test/goldens` and verified by tests. If your changes to the grammar affect the output you will need to regenerate the golden files and commit them to pass the bots.

If the existing test files do not already include sample code that covers the changes you are making, you should add new examples first. Regenerating and committing the new examples and updated golden files _before_ making grammar changes will make your changes easier to review, since the PR will then contain a snapshot of both before and after:

1. Add new sample code to `test/test_files` if required
1. Regenerate golden files
1. Commit changes to your branch
1. Make grammar changes
1. Regenerate golden files
1. Commit changes to your branch

## Regenerating Goldens

To regenerate the golden files, run:

```
UPDATE_GOLDENS=true dart test
```
