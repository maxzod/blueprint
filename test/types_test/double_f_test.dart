import 'package:json_blueprint/json_blueprint.dart';
import 'package:test/test.dart';

void main() {
  group(
    'DoubleF BluePrint',
    () {
      test('when blueprint is valid double felid', () {
        const json = {'age': 22.1};
        final result = match(json, {'age': DoubleF()});
        expect(result, isTrue);
      });
      test('when blueprint is **NOT** valid double felid', () {
        const json = {'age': 'Foo'};
        final result = match(json, {'age': DoubleF()}, throwIfFail: false);
        expect(result, isFalse);
      });
      test('when giving int still is **NOT** valid double felid', () {
        const json = {'age': 12};
        final result = match(json, {'age': DoubleF()}, throwIfFail: false);
        expect(result, isFalse);
      });
    },
  );
}
