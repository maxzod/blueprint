export 'package:json_blueprint/src/matcher.dart';
import 'package:json_blueprint/src/exceptions.dart';
import 'package:json_blueprint/src/matcher.dart';

bool match(Map<String, dynamic> json, MapBluePrint bluePrint, {bool throwIfFail = true}) {
  try {
    MapF(bluePrint).match('', json);
    return true;
  } on BluePrintException {
    if (throwIfFail) rethrow;
    return false;
  }
}
