part of 'match.dart';

/// * the blueprint schema
typedef MapBluePrint = Map<String, BluePrintField>;

///* the base type for the fields
///* private so no one cant extend it this will be un accebtable
abstract class BluePrintField {
  const BluePrintField();

  void match(String key, Object? value);
}

class BluePrintFieldT<T> extends BluePrintField {
  const BluePrintFieldT();

  /// * validate the type
  /// ! throw `BluePrintException` in case of failure
  @override
  void match(String key, Object? value) => _offType<T>(key, value);
}

/// * Blue Print Field Wrapper => BPFW
/// * to make the of exetinon cleaner
class BPFWrapper implements BluePrintField {
  final void Function(String key, Object? value) matchWrapper;

  BPFWrapper(this.matchWrapper);

  @override
  void match(String key, Object? value) => matchWrapper(key, value);
}

/// * validate the `value` is `T`
/// ! throw `BluePrintException` in case of failure
void _offType<T>(String key, Object? value) {
  if (value is! T) {
    throw TypeDoesNotMatch(key: key, value: value, expected: T);
  }
}
