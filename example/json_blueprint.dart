import 'package:json_blueprint/json_blueprint.dart';

void main(List<String> arguments) {
  //* use try/catch blocs to catch the failure message
  try {
    match({'foo': 'bar'}, {'foo': BoolF()});
    print('[👑][blue_print] match result is ✅');
  } catch (e) {
    print(e.runtimeType);
    print('[👑][blue_print] match result is ❌');
  }
}
