import 'package:blueprint/blueprint.dart';

import 'package:test/test.dart';

void main() {
  group('MapF BluePrint group ', () {
    test('when is Map with MapF return true', () {
      const json = {'name': {}};
      final result = matchMap(json, {'name': MapF});
      expect(result, isTrue);
    });

    test('when null with MapF return false', () {
      const json = <String, dynamic>{};
      final result = matchMap(json, {'name': MapF});
      expect(result, isFalse);
    });
    test('when is Map with MapOrNull return true', () {
      const json = {'name': {}};
      final result = matchMap(json, {'name': MapOrNull});
      expect(result, isTrue);
    });

    test('when null with MapOrNull return true', () {
      const json = <String, dynamic>{};
      final result = matchMap(json, {'name': MapOrNull});
      expect(result, isTrue);
    });

    group(
      'validate against map args',
      () {
        test('when is Map with MapF with valid args return true', () {
          const json = {
            'user': {
              'id': -0,
              'name': 'ahmed masoud',
              'langs': ['MD 😀', 'Java', 'javaScript', 'dart', 'php']
            }
          };
          final result = matchMap(
            json,
            {
              'user': MapF.of({
                'id': IntF,
                'name': StringF,
                'langs': ListF,
              })
            },
          );
          expect(result, isTrue);
        });

        test('when is Map with MapF with **NOT** valid args return false', () {
          const json = {
            'user': {
              /// *  `string` not `int`
              'id': '-0',
              'name': 'ahmed masoud',
              'langs': ['MD 😀', 'Java', 'javaScript', 'dart', 'php']
            }
          };
          final result = matchMap(
            json,
            {
              'user': MapF.of({
                'id': IntF,
                'name': StringF,
                'langs': ListF,
              })
            },
          );
          expect(result, isFalse);
        });
        test('when is null with MapF with valid args return false', () {
          const json = <String, dynamic>{};
          final result = matchMap(
            json,
            {
              'user': MapF.of({
                'id': IntF,
                'name': StringF,
                'langs': ListF,
              })
            },
          );
          expect(result, isFalse);
        });
        test('when is Map with MapOrNull with **NOT** valid args return false',
            () {
          const json = {
            'user': {
              /// *  `string` not `int`
              'id': '-0',
              'name': 'ahmed masoud',
              'langs': ['MD 😀', 'Java', 'javaScript', 'dart', 'php']
            }
          };
          final result = matchMap(
            json,
            {
              'user': MapOrNull.of({
                'id': IntF,
                'name': StringF,
                'langs': ListF,
              })
            },
          );
          expect(result, isFalse);
        });
        test('when is Map with MapOrNull with valid args return true', () {
          const json = {
            'user': {
              'id': -0,
              'name': 'ahmed masoud',
              'langs': ['MD 😀', 'Java', 'javaScript', 'dart', 'php']
            }
          };
          final result = matchMap(
            json,
            {
              'user': MapOrNull.of({
                'id': IntF,
                'name': StringF,
                'langs': ListF,
              })
            },
          );
          expect(result, isTrue);
        });
        test('when is null with MapOrNull with valid args return true', () {
          const json = <String, dynamic>{};
          final result = matchMap(
            json,
            {
              'user': MapOrNull.of({
                'id': IntF,
                'name': StringF,
                'langs': ListF,
              })
            },
          );
          expect(result, isTrue);
        });
      },
    );
  });
}
