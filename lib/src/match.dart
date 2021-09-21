import 'exceptions.dart';

part 'basic_types.dart';
part 'imp.dart';
part 'list.dart';
part 'map.dart';

/// * match the json with the bluePrint
/// * return true in case of success
/// * return false in case of failure
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

/// * match the json with the bluePrint
/// ? return void in case of success
/// ! throw `TypeDoesNotMatch` in case of failure
void matchOrThrow(
  Map<String, dynamic> json,
  MapBluePrint bluePrint,
) =>
    MapF.of(bluePrint).match('', json);
