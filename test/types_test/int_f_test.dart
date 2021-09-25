import 'package:blueprint/blueprint.dart';

import 'package:test/test.dart';

void main() {
  test('when int with IntF return true', () {
    const json = {'age': 22};
    final result = matchMap(json, {'age': IntF});
    expect(result, isTrue);
  });
  test('when null with IntF return false', () {
    const json = {'age': null};
    final result = matchMap(json, {'age': IntF});
    expect(result, isFalse);
  });
  test('when int with IntOrNull return true', () {
    const json = {'age': 22};
    final result = matchMap(json, {'age': IntOrNull});
    expect(result, isTrue);
  });
  test('when null with IntOrNull return true', () {
    const json = {'age': null};
    final result = matchMap(json, {'age': IntOrNull});
    expect(result, isTrue);
  });
}
