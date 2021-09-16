# blue_print

part of `queen` packages 👑

Validate JSON Against Your Own Blueprint 👑🧬

# Features

- validate json to match any schema you want 🌟
- support dart native types 🔍
- throw or return false as a result 💣
- tills you which key is a failure and why 💪
- tested 🧪

# supported types

- StringF
- IntF
- DoubleF
- NumF
- BoolF
- MapF
- ListF

## example 1

```dart
import 'package:json_blueprint/json_blueprint.dart';

void main(List<String> arguments) {
  //* use try/catch blocs to catch the failure message
  try {
    // simple one felid
    match(
      // the json
      {'name': 'queen'},
      // the blue print
      {'name': StringF()},
      // * you can use supported Felids only , they are listen in the readme.md file
    );
    print('[👑][blue_print] match result is ✅');
  } catch (e) {
    print(e);
    print('[👑][blue_print] match result is ❌');
  }
}

```

## example 2

```dart
import 'package:json_blueprint/json_blueprint.dart';

void main(List<String> arguments) {
  //* use try/catch blocs to catch the failure message
  try {

    // ? validate against lists
    match(
      {
        'ids': [10, 11, 17]
      },
      {
        'ids': ListF(),
        // ? or you can determine the list items type
        // 'ids' : ListF(IntF()),
      },
    );
    print('[👑][blue_print] match result is ✅');
  } catch (e) {
    print(e);
    print('[👑][blue_print] match result is ❌');
  }
}

```

## example 3

```dart
import 'package:json_blueprint/json_blueprint.dart';

void main(List<String> arguments) {
  //* use try/catch blocs to catch the failure message
  try {

    // * full example
    match(
      {
        'name': 'ahmed',
        'age': 25,
        'args': [
          {'foo': 5},
        ],
        'passport': {
          'id': 1,
          'type': 'royal',
          'created_at': '10-11-17',
        }
      },

      // the blue print
      {
        'name': StringF(),
        'age': IntF(),
        'args': ListF(MapF({'foo': IntF()})),
        'passport': MapF({
          'id': IntF(),
          'type': StringF(),
          'created_at': StringF(),
        })
      },
    );
    print('[👑][blue_print] match result is ✅');
  } catch (e) {
    print(e);
    print('[👑][blue_print] match result is ❌');
  }
}

```
