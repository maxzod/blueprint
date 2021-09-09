abstract class JsonBluePrint {
  Map<String, BluePrintFeild> get schema;
  void match();
}

//* nonfunction-type-aliases
typedef MapBluePrint = Map<String, BluePrintFeild>;

abstract class BluePrintFeild {
  void match(Object? value);
}

class _BluePrintFeildT<T> implements BluePrintFeild {
  @override
  void match(Object? value) {
    if (value is! T) throw '$value is not a subtype of $T';
  }
}

class StringF extends _BluePrintFeildT<String> {}

class IntF extends _BluePrintFeildT<int> {}

class DoubleF extends _BluePrintFeildT<double> {}

class NumF extends _BluePrintFeildT<num> {}

class BoolF extends _BluePrintFeildT<num> {}

class MapF extends BluePrintFeild {
  final MapBluePrint mapBluePrint;

  MapF(this.mapBluePrint);

  @override
  void match(Object? value) {
    if (value is! Map) throw '$value is not suptybe of Map';

    if (mapBluePrint.keys.length != value.keys.length) throw '$value keys are not the same lenght to the mapBluePrint';
    for (final key in mapBluePrint.keys) {
      mapBluePrint[key]!.match(value[key]);
    }
  }
}

class ListF extends BluePrintFeild {
  final BluePrintFeild? childBluePrint;
  ListF([this.childBluePrint]);
  @override
  void match(Object? value) {
    if (value is! List) throw '$value is not suptybe of List';
    if (childBluePrint != null) {
      for (final item in value) {
        childBluePrint!.match(item);
      }
    }
  }
}
