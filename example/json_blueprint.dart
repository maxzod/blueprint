import 'package:json_blueprint/matcher.dart';
import 'package:json_blueprint/src/matcher.dart';

void main(List<String> arguments) {
  //* use try/catch blocs to catch the faliure message
  try {
    // simple one feild
    match(
      // the json
      {'name': 'queen'},
      // the blue print
      {'name': StringF()},
      // * you can use supported Feilds only , they are listen in the readme.md file
    );

    // ? validate aginst lists
    match(
      {
        'ids': [10, 11, 17]
      },
      {
        'ids': ListF(),
        // ? or you can detrmine the list items type
        // 'ids' : ListF(IntF()),
      },
    );

    // * full example
    match(
      {
        'name': 'ahmed',
        'age': 25,
        'args': [
          {'foo': 5},
        ],
        'passport': {
          'id': 1,
          'type': 'royal',
          'created_at': '10-11-17',
        }
      },
      {
        'name': StringF(),
        'age': IntF(),
        'args': ListF(MapF({'foo': IntF()})),
        'passport': MapF({
          'id': IntF(),
          'type': StringF(),
          'created_at': StringF(),
        })
      },
    );
    print('[👑][blue_print] match result is ✅');
  } catch (e) {
    print(e);
    print('[👑][blue_print] match result is ❌');
  }
}
