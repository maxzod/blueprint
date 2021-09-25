/// exception base class
/// exception base class
class BluePrintException implements Exception {
  final String key;
  final Object? value;
  final String msg;

  BluePrintException({
    required this.key,
    this.value,
    required this.msg,
  });

  @override
  String toString() => msg;
}

/// * thrown when a feield does not match the request type
class TypeDoesNotMatch extends BluePrintException {
  final Type expected;
  TypeDoesNotMatch({required String key, Object? value, required this.expected})
      : super(
          key: key,
          value: value,
          msg: 'field $key is a ${value.runtimeType} expected to be $expected',
        );
}
