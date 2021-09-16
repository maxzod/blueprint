import 'package:json_blueprint/json_blueprint.dart';
import 'package:test/test.dart';

void main() {
  group(
    'ListF BluePrint',
    () {
      test('when blueprint is valid List feild', () {
        const json = {'names': []};
        final result = match(json, {'names': ListF()});
        expect(result, isTrue);
      });
      test(
        'when **INNER** List blueprint is valid List feild',
        () {
          const json = {
            'names': [[]],
          };
          final result = match(json, {
            'names': ListF(
              ListF(),
            )
          });
          expect(result, isTrue);
        },
      );

      test('when blueprint is **NOT** valid List feild', () {
        const json = {'name': 10112017};
        final result = match(json, {'name': ListF()}, throwIfFail: false);
        expect(result, isFalse);
      });
    },
  );
}
