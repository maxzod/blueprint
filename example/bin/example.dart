import 'package:blueprint/blueprint.dart';

void main(List<String> args) {
  const json = {
    'posts': [
      {
        'id': 1,
        'text': '',
        'user': {'id': 0, 'age': '21', 'avatar': ''}
      }
    ]
  };
  final schema = {
    'posts': ListF.of(
      MapF.of(
        {
          'id': IntF,
          'text': StringF,
          'user': MapF.of({
            'id': IntF,
            'age': IntF,
            'avatar': StringF,
          })
        },
      ),
    ),
  };
  final bool r = matchMap(json, schema, throwable: true);
  print(r);
  // OR use try catch blocks to  get the failiure message
  try {
    matchMap(json, schema, throwable: true);
  } on TypeDoesNotMatch catch (e) {
    print(e.msg); // field [posts][user][age] is a String expected to be int

  }
}
