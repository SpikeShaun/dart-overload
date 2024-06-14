import 'dart:io';
import 'dart:math';

// 示例1: 打印信息到控制台
void example1() {
  print('Hello, World!');
}

// 示例2: 变量与流程控制语句
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

// 示例3: 函数使用
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

void example3() {
  var result = fibonacci(20);
  print(result);
}

// 示例4: 类的使用
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

// 示例5: 枚举类型
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

// 示例6: 类的继承
class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(super.name, DateTime super.launchDate, this.altitude);
}

// 示例7: Mixin语法
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

// 示例8: 将类视为接口并实现
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

// 示例9: 定义抽象类并实现
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

// 示例10: 异常处理和异步
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

// 示例11: 读取文件内容并计算每个数值的平方根
Future<void> readAndCalculateSquareRoots(String filePath) async {
  try {
    // 读取文件内容
    final file = File(filePath);
    final contents = await file.readAsString();

    // 将文件内容按行拆分，并尝试将每行转换为数字
    final lines = contents.split('\n');
    for (var line in lines) {
      final trimmedLine = line.trim();
      if (trimmedLine.isNotEmpty) {
        final number = double.tryParse(trimmedLine);
        if (number != null) {
          // 计算并打印平方根
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
  // 请确保在调用此函数前，文件路径是有效的，并且文件内容是每行一个数字
  readAndCalculateSquareRoots('numbers.txt').then((_) {
    print('Completed reading and calculating square roots.');
  }).catchError((error) {
    print('Error: $error');
  });
}

void main() {
  example1();
  example2();
  example3();
  example4();
  example5();
  example7();
  example8();
  example9();
  example10();
  example11();
}
