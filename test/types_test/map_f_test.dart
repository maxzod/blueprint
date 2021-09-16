import 'package:json_blueprint/json_blueprint.dart';
import 'package:test/test.dart';

void main() {
  group(
    'MapF BluePrint',
    () {
      test('when blueprint is valid Map felid', () {
        const json = {'name': {}};
        final result = match(json, {'name': MapF()});
        expect(result, isTrue);
      });
      test('when **INNER** map blueprint is valid Map felid', () {
        const json = {
          'name': {
            'user': {},
          }
        };
        final result = match(json, {
          'name': MapF(
            {
              'user': MapF(),
            },
          )
        });
        expect(result, isTrue);
      });

      test('when blueprint is **NOT** valid Map felid', () {
        const json = {'name': 10112017};
        final result = match(json, {'name': MapF()}, throwIfFail: false);
        expect(result, isFalse);
      });
    },
  );
}
