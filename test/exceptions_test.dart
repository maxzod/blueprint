import 'package:json_blueprint/json_blueprint.dart';
import 'package:test/test.dart';

void main() {
  group(
    'BluePrint Exceptions Test',
    () {
      test(
          'when blueprint feild type does not match it will throw TypeDoesNotMatch Exception',
          () {
        const json = {'isAdmin': 'Foo'};
        expect(
          () => match(json, {'isAdmin': BoolF()}),
          throwsA(isA<TypeDoesNotMatch>()),
        );
      });

      test(
          'when map keys length does not match it will throw LengthDoesNotMatch Exception',
          () {
        const json = {
          'user': {
            'name': 'Foo',
          },
        };
        expect(
          () => match(json, {
            'user': MapF({
              'id': IntF(),
              'name': StringF(),
            })
          }),
          throwsA(isA<LengthDoesNotMatch>()),
        );
      });

      //   test(
      //       'when blueprint is **NOT** valid and throwIfFail  == false it will return false',
      //       () {
      //     const json = {'isAdmin': 'Foo'};
      //     final result = match(json, {'isAdmin': BoolF()}, throwIfFail: false);
      //     expect(result, isFalse);
      //   });
      //   test('when blueprint is **NOT** valid it will throw exception', () {
      //     const json = {'isAdmin': 'Foo'};
      //     expect(
      //       () => match(json, {'isAdmin': BoolF()}),
      //       throwsException,
      //     );
      //   });
    },
  );
}
