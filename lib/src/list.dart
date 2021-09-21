part of 'match.dart';

extension ListExt on _BluePrintFieldT<List> {
  _BPFWrapper of(_BluePrintFieldT bpf) => _BPFWrapper(
        (key, value) {
          /// * insure is List
          if (value is! List) {
            throw TypeDoesNotMatch(key: key, value: value, expected: List);
          }
          _validateInnerOfList(key, value, bpf);
        },
      );
}

extension ListExtOrNull on _BluePrintFieldT<List?> {
  _BPFWrapper of(_BluePrintFieldT bpf) => _BPFWrapper(
        (key, value) {
          /// * insure is List
          if (value is! List?) {
            throw TypeDoesNotMatch(key: key, value: value, expected: List);
          }
          if (value == null) return;
          _validateInnerOfList(key, value, bpf);
        },
      );
}

void _validateInnerOfList(String key, List value, _BluePrintFieldT bpf) {
  for (final item in value) {
    bpf.match(key, item);
  }
}
