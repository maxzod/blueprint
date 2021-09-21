import 'package:blueprint/blueprint.dart';

import 'package:test/test.dart';

void main() {
  test('when double with DoubleF return true', () {
    const json = {'age': 22.1};
    final result = match(json, {'age': DoubleF});
    expect(result, isTrue);
  });
  test('when null with DoubleF return false', () {
    const json = {'age': null};
    final result = match(json, {'age': DoubleF});
    expect(result, isFalse);
  });
  test('when double with DoubleOrNull return true', () {
    const json = {'age': 22.1};
    final result = match(json, {'age': DoubleOrNull});
    expect(result, isTrue);
  });
  test('when null with DoubleOrNull return true', () {
    const json = {'age': null};
    final result = match(json, {'age': DoubleOrNull});
    expect(result, isTrue);
  });
}
