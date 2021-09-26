import 'exceptions.dart';

part 'basic_types.dart';
part 'imp.dart';
part 'list.dart';
part 'map.dart';

/// * match the json with the bluePrint
/// * return true in case of success
/// ! throw `TypeDoesNotMatch` in case of failure or return false based on throwable paramter
bool matchMap(
  Object json,
  MapBluePrint bluePrint, {
  bool throwable = false,
}) {
  try {
    MapF.of(bluePrint).match('', json);
    return true;
  } on BluePrintException {
    if (throwable) rethrow;
    return false;
  }
}

bool matchF(
  Object json,
  BluePrintField bluePrint, {
  bool throwable = false,
}) {
  try {
    bluePrint.match('', json);
    return true;
  } on BluePrintException {
    if (throwable) rethrow;
    return false;
  }
}
