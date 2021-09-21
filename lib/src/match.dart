import 'exceptions.dart';

part 'basic_types.dart';
part 'imp.dart';
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
