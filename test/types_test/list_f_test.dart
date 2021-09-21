import 'package:blueprint/blueprint.dart';

import 'package:test/test.dart';

void main() {
  test('when is List with ListF return true', () {
    const json = {'names': []};
    final result = match(json, {'names': ListF});
    expect(result, isTrue);
  });
  test('when is null with ListF return false', () {
    const json = {'names': null};
    final result = match(json, {'names': ListF});
    expect(result, isFalse);
  });

  test(
    'when List is empty with ListF.of return true',
    () {
      const json = {'names': []};
      final result = match(json, {'names': ListF.of(IntF)});
      expect(result, isTrue);
    },
  );

  test(
    'when List is not Empty ListF.of return true with Right Schema',
    () {
      const json = {
        'names': [1, 2, 3]
      };
      final result = match(json, {'names': ListF.of(IntF)});
      expect(result, isTrue);
    },
  );
  test(
    'when List is not Empty ListF.of return False with Wrong Schema',
    () {
      const json = {
        'names': [1, 2, 3]
      };
      final result = match(json, {'names': ListF.of(StringF)});
      expect(result, isFalse);
    },
  );
  test(
    'when List is List Of Maps ListF.of return True if Right Schema',
    () {
      const json = {
        'posts': [
          {
            'id': 1,
            'text': '',
            'user': {
              'id': 0,
              'age': 21,
              'avatar': '',
            }
          },
          {
            'id': 2,
            'text': '',
            'user': {
              'id': 0,
              'age': 21,
              'avatar': '',
            }
          }
        ]
      };
      final result = match(
        json,
        {
          'posts': ListF.of(
            MapF.of(
              {
                'id': IntF,
                'text': StringF,
                'user': MapF.of({
                  'id': IntF,
                  'age': IntF,
                  'avatar': StringF,
                })
              },
            ),
          ),
        },
      );
      expect(result, isTrue);
    },
  );
}
