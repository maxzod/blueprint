// import 'package:json_blueprint/json_blueprint.dart';

// void main(List<String> arguments) {
//   //* use try/catch blocs to catch the failure message
//   try {
//     match(
//       {'foo': 'bar'},
//       {'foo': BoolF},
//     );
//     print('[👑][blue_print] match result is ✅');
//   } catch (e) {
//     print(e.runtimeType);
//     print('[👑][blue_print] match result is ❌');
//   }
// }

import 'package:blueprint/blueprint.dart';

void main(List<String> args) {
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
  final r = match(
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
  print(r);
}
