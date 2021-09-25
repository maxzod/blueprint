`PART OF` **`QUEEN`** 👑

Validate JSON Against Your Own Blueprint 👑🧬

#![example](https://github.com/maxzod/blueprint/blob/master/images/example.png)

- [Motivation](#motivation)
- [NOTE](#note)
- [Features](#features)
- [supported types](#supported-types)
- [Notes](#notes)
- [Examples](#examples)
  - [example 1](#example-1)
  - [example 2](#example-2)
  - [example 3](#example-3)

# Motivation

we use json almost every day in our job with null safety we can skip many errors but we cant test if the api still intact and the update does't break any thing in the data type or schema

so we meade this package mostly you can use it for testing the apis you consume with dart or what you built with dart `palace` hope your day is less bugs with this package

# NOTE

this package depends on dart `>= 2.13.0` if you want to use it with flutter you have to update to flutter >= 2.5
the reason is the

# Features

- validate json to match any schema you want 🌟
- support dart native types 🔍
- support for TypeOrNull
- support for `.of` for deeper and deeper validation 💪
- throw or return false as a result 💣
- Strong Types , also the blueprint is just a map but values must be a subtype of `_BluePrintFieldT` which is all of supported types null or not
- tells you which key is a failure and why 💪
- tested 🧪

# supported types

| data type | non-nullable Field | nullable Field |
| --------- | ------------------ | -------------- |
| String    | StringF            | StringOrNull   |
| int       | IntF               | IntOrNull      |
| double    | DoubleF            | DoubleOrNull   |
| num       | NumF               | NumOrNull      |
| bool      | BoolF              | BoolOrNull     |
| Map       | MapF               | MapOrNull      |
| List      | ListF              | ListOrNull     |

# Notes

1 - use `match` to get true or false as result

2 - use `matchOrThrow` to throw the error in case of miss match

3 - use `.of()` function on `Map` and `List` it is available on there four rules `MapF`,`MapOrNull`,`ListF` , `ListOrNull` to validate deer inside the object

4 - in case of null value the nullable Field Rule will not validate against the args an consider it a match

5 - in case of a value in the nullable Field Rule the `.of()` function will validate against the args and return the result based on that

# Examples

## example 1

```dart
import 'package:blueprint/blueprint.dart';

void main(List<String> arguments) {
  //* use try/catch blocs to catch the failure message
  try {
    // simple one felid
    matchOrThrow(
      // the json
      {'name': 'queen'},
      // the blue print
      {'name': String},
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

void main(List<String> arguments) {
  //* use try/catch blocs to catch the failure message
  try {

    // ? validate against lists
    matchOrThrow(
      {
        'ids': [10, 11, 17]
      },
      {
        'ids': ListF,
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
        'name': StringF,
        'age': IntF,
        'args': ListF(MapF.of({'foo': IntF})),
        'passport': MapF.of({
          'id': IntF,
          'type': StringF,
          'created_at': StringF,
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
