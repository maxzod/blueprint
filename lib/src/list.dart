part of 'match.dart';

extension ListExt on _BluePrintFieldT<List> {
  /// * validate aginst `List` content
  _BPFWrapper of(_BluePrintFieldT bpf) => _BPFWrapper(
        (key, value) {
          /// * insure is List
          _offType<List>(key, value);

          /// * validate the inner data
          _validateInnerOfList(key, value as List, bpf);
        },
      );
}

extension ListExtOrNull on _BluePrintFieldT<List?> {
  _BPFWrapper of(_BluePrintFieldT bpf) => _BPFWrapper(
        (key, value) {
          /// * insure is List
          _offType<List?>(key, value);

          /// * if is null its ok
          if (value == null) return;

          /// * validate the inner data
          _validateInnerOfList(key, value as List, bpf);
        },
      );
}

/// * loop throw the List content and validate
void _validateInnerOfList(String key, List value, _BluePrintFieldT bpf) {
  for (final item in value) {
    bpf.match(
      key,
      item,
    );
  }
}
