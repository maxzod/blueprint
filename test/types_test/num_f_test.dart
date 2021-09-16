import 'package:json_blueprint/json_blueprint.dart';
import 'package:test/test.dart';

void main() {
  group(
    'NumF BluePrint',
    () {
      test('when blueprint is valid num feild', () {
        /// *  num is int or double
        const json = {'age': 22.1, 'foo': 22};
        final result = match(json, {'age': NumF(), 'foo': NumF()});
        expect(result, isTrue);
      });
      test('when blueprint is **NOT** valid double feild', () {
        const json = {'age': 'Foo'};
        final result = match(json, {'age': NumF()}, throwIfFail: false);
        expect(result, isFalse);
      });
    },
  );
}
