class NewWithoutType {
  const new();
  const new named();
}

class NewWithType {
  const NewWithType.named();
  const NewWithType.new();

  String factory() => 'method';
}

class FactoryWithoutType {
  FactoryWithoutType._();
  factory() => FactoryWithoutType._();
  factory named() => FactoryWithoutType._();

  void factory() => 'method';
}

class FactoryWithExternal {
  external factory();
  external factory named();

  external void factory();
}

class FactoryWithType {
  FactoryWithType._();
  factory FactoryWithType() => FactoryWithType._();
  factory FactoryWithType.named() => FactoryWithType._();

  String factory() => 'method';
}

class PrimaryWithoutName(final int a) {
  this {}
}

class PrimaryWithName.named(final int a) {
  this {}
}

void f() {
  var _ = NewWithType.new();
  var _ = NewWithType.named();
  var _ = new NewWithType.new();
  var _ = new NewWithType.named();
  var _ = const NewWithType.new();
  var _ = const NewWithType.named();
  var _ = NewWithType.new;
  var _ = NewWithType.named;
  var _ = FactoryWithType.named().factory();
}
