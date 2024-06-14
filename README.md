# Dart 示例代码仿写复现——第三题

## 简介

这个项目包含了一系列用 Dart 语言编写的示例代码，仿写了Dart语言入门示例。

## 目录

- [示例1: 打印信息到控制台](#示例1-打印信息到控制台)
- [示例2: 变量与流程控制语句](#示例2-变量与流程控制语句)
- [示例3: 函数使用](#示例3-函数使用)
- [示例4: 类的使用](#示例4-类的使用)
- [示例5: 枚举类型](#示例5-枚举类型)
- [示例6: 类的继承](#示例6-类的继承)
- [示例7: Mixin语法](#示例7-Mixin语法)
- [示例8: 将类视为接口并实现](#示例8-将类视为接口并实现)
- [示例9: 定义抽象类并实现](#示例9-定义抽象类并实现)
- [示例10: 异常处理和异步](#示例10-异常处理和异步)
- [示例11: 读取文件内容并计算每个数值的平方根](#示例11-读取文件内容并计算每个数值的平方根)

## 示例1: 打印信息到控制台

```dart
void example1() {
  print('Hello, World!');
}
```

这个示例展示了如何在 Dart 中打印信息到控制台。

## 示例2: 变量与流程控制语句

```dart
void example2() {
  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };

  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

  for (final object in flybyObjects) {
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while (year < 2016) {
    year += 1;
  }
}
```

这个示例展示了如何在 Dart 中使用变量、条件语句和循环。

## 示例3: 函数使用

```dart
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

void example3() {
  var result = fibonacci(20);
  print(result);
}
```

这个示例展示了如何定义和调用递归函数。

## 示例4: 类的使用

```dart
class Spacecraft {
  String name;
  DateTime? launchDate;

  int? get launchYear => launchDate?.year;

  Spacecraft(this.name, this.launchDate);

  Spacecraft.unlaunched(String name) : this(name, null);

  void describe() {
    print('Spacecraft: $name');
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

void example4() {
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();

  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();
}
```

这个示例展示了如何定义和使用类。

## 示例5: 枚举类型

```dart
enum PlanetType { terrestrial, gas, ice }

enum Planet {
  mercury(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  venus(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  earth(planetType: PlanetType.terrestrial, moons: 1, hasRings: false),
  uranus(planetType: PlanetType.ice, moons: 27, hasRings: true),
  neptune(planetType: PlanetType.ice, moons: 14, hasRings: true);

  const Planet({
    required this.planetType,
    required this.moons,
    required this.hasRings,
  });

  final PlanetType planetType;
  final int moons;
  final bool hasRings;

  bool get isGiant =>
      planetType == PlanetType.gas || planetType == PlanetType.ice;
}

void example5() {
  final yourPlanet = Planet.earth;

  if (!yourPlanet.isGiant) {
    print('Your planet is not a "giant planet".');
  }
}
```

这个示例展示了如何定义和使用枚举类型。

## 示例6: 类的继承

```dart
class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(super.name, DateTime super.launchDate, this.altitude);
}
```

这个示例展示了如何在 Dart 中使用类的继承。

## 示例7: Mixin语法

```dart
mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  double altitude;

  PilotedCraft(super.name, DateTime super.launchDate, this.altitude);
}

void example7() {
  PilotedCraft myAircraft =
      PilotedCraft('FlyingDutchman', DateTime(1919, 8, 10), 3000);
  myAircraft.describeCrew();
}
```

这个示例展示了如何使用 Dart 中的 mixin 语法。

## 示例8: 将类视为接口并实现

```dart
class MockSpaceship implements Spacecraft {
  @override
  void describe() {
    print('MockSpaceship: describe');
  }

  @override
  DateTime? launchDate;

  @override
  String name = 'Mock';

  @override
  int? get launchYear => null;
}

void example8() {
  MockSpaceship temp = MockSpaceship();
  temp.describe();
}
```

这个示例展示了如何将类视为接口并实现它。

## 示例9: 定义抽象类并实现

```dart
abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}

class Describer implements Describable {
  @override
  void describe() {
    print('this is a test');
  }

  @override
  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}

void example9() {
  Describer des = Describer();
  des.describeWithEmphasis();
}
```

这个示例展示了如何定义和实现抽象类。

## 示例10: 异常处理和异步

```dart
Future<void> describeFlybyObjects(List<String> flybyObjects) async {
  try {
    for (final object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (e) {
    print('Could not describe object: $e');
  } finally {
    flybyObjects.clear();
  }
}

void example10() {
  List<String> flybyObjects = ['object1', 'object2', 'nonExistentObject'];

  describeFlybyObjects(flybyObjects).then((_) {
    print('nothing wrong');
  }).catchError((error) {
    print('Error: $error');
  });
}
```

这个示例展示了如何进行异常处理和异步编程。

## 示例11: 读取文件内容并计算每个数值的平方根

```dart
Future<void> readAndCalculateSquareRoots(String filePath) async {
  try {
    final file = File(filePath);
    final contents = await file.readAsString();

    final lines = contents.split('\n');
    for (var line in lines) {
      final trimmedLine = line.trim();
      if (trimmedLine.isNotEmpty) {
        final number = double.tryParse(trimmedLine);
        if (number != null) {
          final sqrtValue = sqrt(number);
          print('The square root of $number is $sqrtValue');
        } else {
          print('Cannot parse "$trimmedLine" as a number');
        }
      }
    }
  } on IOException catch (e) {
    print('Error reading file: $e');
  }
}

void example11() {
  readAndCalculateSquareRoots('numbers.txt').then((_) {
    print('Completed reading and calculating square roots.');
  }).catchError((error) {
    print('Error: $error');
  });
}
```

这个示例展示了如何读取文件内容并计算每个数值的平方根。

##

运行示例

要运行这些示例代码，请确保您的开发环境中已安装 Dart SDK。然后可以创建一个 Dart 项目，将这些示例代码复制到项目中的主文件中，并运行 `dart run` 命令来执行代码。

```sh
dart run
```
