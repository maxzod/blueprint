export 'package:json_blueprint/src/matcher.dart';
import 'package:json_blueprint/src/matcher.dart';

void match(
  Map<String, dynamic> json,
  MapBluePrint bluePrint,
) {
  MapF(bluePrint).match(json);
}
