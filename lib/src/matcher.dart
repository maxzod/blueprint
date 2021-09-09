import 'exceptions.dart';

//* map blue print
typedef MapBluePrint = Map<String, BluePrintFeild>;

// * the matcher api for single feilds
abstract class BluePrintFeild {
  void match(String key, Object? value);
}

// * for standard types
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

//* the Map handler
class MapF extends BluePrintFeild {
  final MapBluePrint? mapBluePrint;
  // * if you pass the bluePrint for thes Feild the matcher will matche aginst
  //*  every single feild in the map other wise it will check if its just a Map
  MapF([this.mapBluePrint]);

  @override
  void match(String key, Object? value) {
    //* inure is Map
    if (value is! Map) throw TypeDoesNotMatch(key: key, expected: Map);
    if (mapBluePrint != null) {
      // * insure keys keys length
      if (mapBluePrint!.keys.length != value.keys.length) {
        throw LengthDoesNotMatch(expected: mapBluePrint!.length, key: key, vLength: value.length, value: value);
      }

      /// * chick aginst keys values
      try {
        for (final childKey in mapBluePrint!.keys) {
          mapBluePrint![childKey]!.match('[$childKey]', value[childKey]);
        }
      } on TypeDoesNotMatch catch (e) {
        if (key.isEmpty) rethrow;
        // * append the parent key if exist
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
