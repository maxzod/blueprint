part of 'match.dart';

extension MapArgsExt on _BluePrintFieldT<Map> {
  _BPFWrapper withArgs(MapBluePrint bluePrint) => _BPFWrapper(
        (key, value) {
          /// * insure is Map
          if (value is! Map) {
            throw TypeDoesNotMatch(key: key, value: value, expected: Map);
          }

          /// * check keys values
          try {
            for (final childKey in bluePrint.keys) {
              bluePrint[childKey]!.match('[$childKey]', value[childKey]);
            }
          } on TypeDoesNotMatch catch (e) {
            /// since the first map has empty key
            if (key.isEmpty) rethrow;

            /// * append the parent key if exist
            throw TypeDoesNotMatch(
                key: key + e.key, value: e.value, expected: e.expected);
          }
        },
      );
}

extension MapOrNullArgsExt on _BluePrintFieldT<Map?> {
  _BPFWrapper withArgs(MapBluePrint bluePrint) => _BPFWrapper(
        (key, value) {
          /// * insure is Map
          final isMap = value is Map;
          final isNull = value == null;
          if (!isMap && !isNull) {
            /// it is not a `Map`
            /// and it is not `Null`
            throw TypeDoesNotMatch(key: key, value: value, expected: Map);
          }

          /// it is null so no need to validate inside it
          if (isNull) return;

          /// * the value is map
          value as Map;

          /// * check keys values
          try {
            for (final childKey in bluePrint.keys) {
              bluePrint[childKey]!.match('[$childKey]', value[childKey]);
            }
          } on TypeDoesNotMatch catch (e) {
            /// since the root `map` has empty key
            if (key.isEmpty) rethrow;

            /// * append the parent key if exist
            throw TypeDoesNotMatch(
                key: key + e.key, value: e.value, expected: e.expected);
          }
        },
      );
}
