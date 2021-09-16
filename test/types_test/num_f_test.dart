import 'package:json_blueprint/json_blueprint.dart';
import 'package:test/test.dart';

void main() {
  group(
    'NumF BluePrint',
    () {
      test('when blueprint is valid num felid', () {
        /// *  num is int or double
        const json = {'age': 22.1, 'foo': 22};
        final result = match(json, {'age': NumF(), 'foo': NumF()});
        expect(result, isTrue);
      });
      test('when blueprint is **NOT** valid double felid', () {
        const json = {'age': 'Foo'};
        final result = match(json, {'age': NumF()}, throwIfFail: false);
        expect(result, isFalse);
      });
    },
  );
}
