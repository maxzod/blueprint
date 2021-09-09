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

class TypeDoesNotMatch extends BluePrintException {
  final Type expected;
  TypeDoesNotMatch({required String key, Object? value, required this.expected})
      : super(
          key: key,
          value: value,
          msg: 'field $key is a ${value.runtimeType} expected to be $expected',
        );
}

class LengthDoesNotMatch extends BluePrintException {
  LengthDoesNotMatch({required String key, Object? value, required int vLength, required int expected})
      : super(
          key: key,
          value: value,
          msg: 'map $key keys lenght is $vLength expected to be $expected',
        );
}
