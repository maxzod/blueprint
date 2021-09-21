part of 'match.dart';

typedef MapBluePrint = Map<String, _BluePrintFieldT>;

class _BluePrintFieldT<T> {
  const _BluePrintFieldT();

  void match(String key, Object? value) => _offType<T>(key, value);
}

/// Blue Print Field Wrapper => BPFW
class _BPFWrapper<T> implements _BluePrintFieldT<T> {
  final void Function(String key, Object? value) matchWrapper;

  _BPFWrapper(this.matchWrapper);
  @override
  void match(String key, Object? value) => matchWrapper(key, value);
}

void _offType<T>(String key, Object? value) {
  if (value is! T) {
    throw TypeDoesNotMatch(key: key, value: value, expected: T);
  }
}
