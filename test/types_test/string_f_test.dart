import 'package:json_blueprint/json_blueprint.dart';
import 'package:test/test.dart';

void main() {
  test('when String with StringF return true', () {
    const json = {'name': 'Ahmed Masoud'};
    final result = match(json, {'name': StringF});
    expect(result, isTrue);
  });
  test('when null with StringF return false', () {
    const json = {'name': null};
    final result = match(json, {'name': StringF});
    expect(result, isFalse);
  });
  test('when String with StringOrNull return true', () {
    const json = {'name': 'Ahmed Masoud'};
    final result = match(json, {'name': StringOrNull});
    expect(result, isTrue);
  });
  test('when null with StringOrNull return true', () {
    const json = {'name': null};
    final result = match(json, {'name': StringOrNull});
    expect(result, isTrue);
  });
}
