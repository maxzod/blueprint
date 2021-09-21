import 'package:json_blueprint/src/exceptions.dart';

part 'imp.dart';
part 'basic_types.dart';
part 'list.dart';
part 'map.dart';

bool match(
  Map<String, dynamic> json,
  MapBluePrint bluePrint,
) {
  try {
    MapF.of(bluePrint).match('', json);
    return true;
  } on BluePrintException {
    return false;
  }
}

void matchOrThrow(
  Map<String, dynamic> json,
  MapBluePrint bluePrint,
) =>
    MapF.of(bluePrint).match('', json);
