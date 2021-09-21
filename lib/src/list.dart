part of 'match.dart';

extension ListExt on _BluePrintFieldT<List> {
  _BPFWrapper withArgs(MapBluePrint bluePrint) => _BPFWrapper(
        (key, value) {
          /// * insure is List
          if (value is! List) {
            throw TypeDoesNotMatch(key: key, value: value, expected: List);
          }
        },
      );
  _BPFWrapper offType<T>() => _BPFWrapper(
        (key, value) {
          _offType<List>(key, value);
          (value as List).map((e) => _offType<T>(key, e));
        },
      );
}
