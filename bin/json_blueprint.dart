import 'package:json_blueprint/matcher.dart';
import 'package:json_blueprint/src/matcher.dart';

void main(List<String> arguments) {
  try {
    match(
      {
        'name': 'ahmed',
        'age': 25,
        'args': [
          {'foo': 5},
        ],
      },
      {
        'name': StringF(),
        'age': IntF(),
        'args': ListF(MapF({'foo': IntF()})),
      },
    );
    print('[👑][blue_print] match result is ✅');
  } catch (e) {
    print(e);
    print('[👑][blue_print] match result is ❌');
  }
}
