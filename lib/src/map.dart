part of 'match.dart';

/// * to enable deeper types in the map
extension MapArgsExt on BluePrintFieldT<Map> {
  BPFWrapper of(MapBluePrint bluePrint) => BPFWrapper(
        (key, value) {
          /// * insure is Map
          _offType<Map>(key, value);

          /// * Map inner data
          _validateMapContent(key, value as Map, bluePrint);
        },
      );
}

/// * to enable deeper types in the map with null
extension MapOrNullArgsExt on BluePrintFieldT<Map?> {
  BPFWrapper of(MapBluePrint bluePrint) => BPFWrapper(
        (key, value) {
          /// * insure is Map?
          _offType<Map?>(key, value);

          /// * it is null so no need to validate inside it
          if (value == null) return;

          /// * Map inner data
          _validateMapContent(key, value as Map, bluePrint);
        },
      );
}

/// validate the inner map content
void _validateMapContent(String key, Map value, MapBluePrint bpf) {
  /// * check keys values
  try {
    for (final childKey in bpf.keys) {
      bpf[childKey]!.match('[$childKey]', value[childKey]);
    }
  } on TypeDoesNotMatch catch (e) {
    /// since the root `Map` has empty key
    if (key.isEmpty) rethrow;

    /// * append the parent key if exist
    throw TypeDoesNotMatch(
        key: key + e.key, value: e.value, expected: e.expected);
  }
}
