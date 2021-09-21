import 'package:json_blueprint/json_blueprint.dart';
import 'package:test/test.dart';

void main() {
  test('when num with NumF return true', () {
    /// *  num is int or double
    const json = {'age': 22.1, 'foo': 22};
    final result = match(json, {'age': NumF, 'foo': NumF});
    expect(result, isTrue);
  });
  test('when null with NumF return false', () {
    /// *  num is int or double
    const json = {'age': null, 'foo': null};
    final result = match(json, {'age': NumF, 'foo': NumF});
    expect(result, isFalse);
  });
  test('when num with NumOrNull return true', () {
    /// *  num is int or double
    const json = {'age': 22.1, 'foo': 22};
    final result = match(json, {'age': NumOrNull, 'foo': NumOrNull});
    expect(result, isTrue);
  });
  test('when null with NumOrNull return true', () {
    /// *  num is int or double
    const json = {'age': null, 'foo': null};
    final result = match(json, {'age': NumOrNull, 'foo': NumOrNull});
    expect(result, isTrue);
  });
}
