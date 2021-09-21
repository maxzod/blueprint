import 'package:json_blueprint/json_blueprint.dart';
import 'package:test/test.dart';

void main() {
  test('when bool with BoolF return true', () {
    const json = {'isAdmin': true};
    final result = match(json, {'isAdmin': BoolF});
    expect(result, isTrue);
  });
  test('when null with BoolF return false', () {
    const json = {'isAdmin': null};
    final result = match(json, {'isAdmin': BoolF});
    expect(result, isFalse);
  });
  test('when bool with BoolOrNull return true', () {
    const json = {'isAdmin': true};
    final result = match(json, {'isAdmin': BoolOrNull});
    expect(result, isTrue);
  });
  test('when null with BoolOrNull return false', () {
    const json = {'isAdmin': null};
    final result = match(json, {'isAdmin': BoolOrNull});
    expect(result, isTrue);
  });
}
