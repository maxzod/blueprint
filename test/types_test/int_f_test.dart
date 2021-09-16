import 'package:json_blueprint/json_blueprint.dart';
import 'package:test/test.dart';

void main() {
  group(
    'IntF BluePrint',
    () {
      test('when blueprint is valid int felid', () {
        const json = {'age': 22};
        final result = match(json, {'age': IntF()});
        expect(result, isTrue);
      });
      test('when blueprint is **NOT**  valid int felid', () {
        const json = {'age': 'Foo'};
        final result = match(json, {'age': IntF()}, throwIfFail: false);
        expect(result, isFalse);
      });
    },
  );
}
