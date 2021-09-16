import 'package:json_blueprint/json_blueprint.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Matcher Test',
    () {
      test('when blueprint is valid it will pass', () {
        const json = {'isAdmin': true};
        final result = match(json, {'isAdmin': BoolF()});
        expect(result, isTrue);
      });

      test(
          'when blueprint is **NOT** valid and throwIfFail  == false it will return false',
          () {
        const json = {'isAdmin': 'Foo'};
        final result = match(json, {'isAdmin': BoolF()}, throwIfFail: false);
        expect(result, isFalse);
      });
      test('when blueprint is **NOT** valid it will throw exception', () {
        const json = {'isAdmin': 'Foo'};
        expect(
          () => match(json, {'isAdmin': BoolF()}),
          throwsException,
        );
      });
    },
  );
}
