augment library 'augmented.dart';

augment class MyClass {
  augment void myMethod() {
    augmented();
  }

  String get myGetter => augmented;
  set mySetter(String value) { augmented = value; }
}

augment void myFunction() {
  augmented();
}
