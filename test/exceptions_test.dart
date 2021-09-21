import 'package:json_blueprint/json_blueprint.dart';
import 'package:test/test.dart';

void main() {
  test(
      'when blueprint felid type does not match it will throw TypeDoesNotMatch Exception',
      () {
    const json = {'isAdmin': 'Foo'};
    expect(
      () => matchOrThrow(json, {'isAdmin': BoolF}),
      throwsA(isA<TypeDoesNotMatch>()),
    );
  });

  test('when blueprint is **NOT** valid and use match()', () {
    const json = {'isAdmin': 'Foo'};
    final result = match(json, {'isAdmin': BoolF});
    expect(result, isFalse);
  });
  test(
    'when blueprint is **NOT** valid and use matchOrThrow will throw',
    () {
      const json = {'isAdmin': 'Foo'};
      expect(
        () => matchOrThrow(json, {'isAdmin': BoolF}),
        throwsException,
      );
    },
  );
}
