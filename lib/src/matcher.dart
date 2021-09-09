//* nonfunction-type-aliases
import 'exceptions.dart';

typedef MapBluePrint = Map<String, BluePrintFeild>;

abstract class BluePrintFeild {
  void match(String key, Object? value);
}

class _BluePrintFeildT<T> implements BluePrintFeild {
  @override
  void match(String key, Object? value) {
    if (value is! T) throw TypeDoesNotMatch(key: key, value: value, expected: T);
  }
}

class StringF extends _BluePrintFeildT<String> {}

class IntF extends _BluePrintFeildT<int> {}

class DoubleF extends _BluePrintFeildT<double> {}

class NumF extends _BluePrintFeildT<num> {}

class BoolF extends _BluePrintFeildT<num> {}

class MapF extends BluePrintFeild {
  final MapBluePrint? mapBluePrint;

  MapF([this.mapBluePrint]);

  @override
  void match(String key, Object? value) {
    if (value is! Map) throw TypeDoesNotMatch(key: key, expected: Map);
    if (mapBluePrint != null) {
      if (mapBluePrint!.keys.length != value.keys.length) {
        throw LengthDoesNotMatch(expected: mapBluePrint!.length, key: key, vLength: value.length, value: value);
      }
      try {
        for (final childKey in mapBluePrint!.keys) {
          mapBluePrint![childKey]!.match('[$childKey]', value[childKey]);
        }
      } on TypeDoesNotMatch catch (e) {
        if (key.isEmpty) rethrow;
        throw TypeDoesNotMatch(key: '$key' + e.key, value: e.value, expected: e.expected);
      }
    }
  }
}

class ListF extends BluePrintFeild {
  final BluePrintFeild? childBluePrint;
  ListF([this.childBluePrint]);
  @override
  void match(String key, Object? value) {
    if (value is! List) throw TypeDoesNotMatch(key: key, expected: List);
    if (childBluePrint != null) {
      for (final item in value) {
        childBluePrint!.match(key, item);
      }
    }
  }
}
