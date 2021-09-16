import 'package:json_blueprint/json_blueprint.dart';
import 'package:test/test.dart';

void main() {
  group(
    'BoolF BluePrint',
    () {
      test('when blueprint is valid bool felid', () {
        const json = {'isAdmin': true};
        final result = match(json, {'isAdmin': BoolF()});
        expect(result, isTrue);
      });
      test('when blueprint is **NOT** valid bool felid', () {
        const json = {'isAdmin': 'Foo'};
        final result = match(json, {'isAdmin': BoolF()}, throwIfFail: false);
        expect(result, isFalse);
      });
    },
  );
}
