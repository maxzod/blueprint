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
    MapF.withArgs(bluePrint).match('', json);
    return true;
  } on BluePrintException {
    return false;
  }
}

void matchOrThrow(
  Map<String, dynamic> json,
  MapBluePrint bluePrint,
) =>
    MapF.withArgs(bluePrint).match('', json);
