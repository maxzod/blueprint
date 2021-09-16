import 'package:json_blueprint/json_blueprint.dart';
import 'package:test/test.dart';

void main() {
  group(
    'StringF BluePrint',
    () {
      test('when blueprint is valid String feild', () {
        const json = {'name': 'Ahmed Masoud'};
        final result = match(json, {'name': StringF()});
        expect(result, isTrue);
      });
      test('when blueprint is **NOT**  valid String feild', () {
        const json = {'name': 10112017};
        final result = match(json, {'name': StringF()}, throwIfFail: false);
        expect(result, isFalse);
      });
    },
  );
}
