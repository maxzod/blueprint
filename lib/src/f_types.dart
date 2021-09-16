//* map blue print
import 'exceptions.dart';

typedef MapBluePrint = Map<String, BluePrintFelid>;

// * the matcher api for single felids
abstract class BluePrintFelid {
  const BluePrintFelid();
  void match(String key, Object? value);
}

// * for standard types
class _BluePrintFelidT<T> implements BluePrintFelid {
  @override
  void match(String key, Object? value) {
    if (value is! T) {
      throw TypeDoesNotMatch(key: key, value: value, expected: T);
    }
  }
}

class StringF extends _BluePrintFelidT<String> {}

class IntF extends _BluePrintFelidT<int> {}

class DoubleF extends _BluePrintFelidT<double> {}

class NumF extends _BluePrintFelidT<num> {}

class BoolF extends _BluePrintFelidT<bool> {}

//* the Map handler
class MapF extends BluePrintFelid {
  final MapBluePrint? mapBluePrint;
  // * if you pass the bluePrint for this Felid the matcher will matches
  //*  every single felid in the map other wise it will check if its just a Map
  const MapF([this.mapBluePrint]);

  @override
  void match(String key, Object? value) {
    //* inure is Map
    if (value is! Map) throw TypeDoesNotMatch(key: key, expected: Map);
    if (mapBluePrint != null) {
      // * insure keys keys length
      if (mapBluePrint!.keys.length != value.keys.length) {
        throw LengthDoesNotMatch(
            expected: mapBluePrint!.length,
            key: key,
            vLength: value.length,
            value: value);
      }

      /// * chick keys values
      try {
        for (final childKey in mapBluePrint!.keys) {
          mapBluePrint![childKey]!.match('[$childKey]', value[childKey]);
        }
      } on TypeDoesNotMatch catch (e) {
        if (key.isEmpty) rethrow;
        // * append the parent key if exist
        throw TypeDoesNotMatch(
            key: key + e.key, value: e.value, expected: e.expected);
      }
    }
  }
}

class ListF extends BluePrintFelid {
  final BluePrintFelid? childBluePrint;
  const ListF([this.childBluePrint]);
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
