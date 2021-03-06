part of 'match.dart';

/// * to enable deeper types in the list
extension ListExt on BluePrintFieldT<List> {
  /// * validate aginst `List` content
  BPFWrapper of(BluePrintField bpf) => BPFWrapper(
        (key, value) {
          /// * insure is List
          _offType<List>(key, value);

          /// * validate the inner data
          _validateInnerOfList(key, value as List, bpf);
        },
      );
}

/// * to enable deeper types in the list or null
extension ListExtOrNull on BluePrintFieldT<List?> {
  BPFWrapper of(BluePrintField bpf) => BPFWrapper(
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
void _validateInnerOfList(String key, List value, BluePrintField bpf) {
  for (final item in value) {
    bpf.match(
      key,
      item,
    );
  }
}
