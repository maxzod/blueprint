import 'package:blueprint/blueprint.dart';

import 'package:test/test.dart';

void main() {
  test(
      'when blueprint felid type does not match it will throw TypeDoesNotMatch Exception',
      () {
    const json = {'isAdmin': 'Foo'};
    expect(
      () => matchMap(
        json,
        {'isAdmin': BoolF},
        throwable: true,
      ),
      throwsA(isA<TypeDoesNotMatch>()),
    );
  });

  test('when blueprint is **NOT** valid and use matchMap()', () {
    const json = {'isAdmin': 'Foo'};
    final result = matchMap(
      json,
      {'isAdmin': BoolF},
    );
    expect(result, isFalse);
  });
  test(
    'when blueprint is **NOT** valid and use matchOrThrow will throw',
    () {
      const json = {'isAdmin': 'Foo'};
      expect(
        () => matchMap(
          json,
          {'isAdmin': BoolF},
          throwable: true,
        ),
        throwsException,
      );
    },
  );
}
