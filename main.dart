import 'ConvertDecimalBinary.dart';
import 'DelimetersCalculator.dart';
import 'Point.dart';
import 'SearchNumber.dart';
import 'Users.dart';

/// 7. Реализуйте метод, который вычисляет корень любой заданной степени из числа.
/// Реализуйте данный метод как extension-метод для num.
/// Алгоритм можете взять на википедии как «Алгоритм нахождения корня n-й степени».
/// Запрещается использовать методы math.
/// В случае когда значение вернуть невозможно, необходимо бросать исключение с описанием ошибки.
extension on num {
  double rootNDegree(int n) {
    if (n < 2) {
      throw 'Корень  n степени существует только  при n>=2';
    }

    ConvertDecimalBinary calc = ConvertDecimalBinary();
    double precision = 0.000001;
    double x0 = this / n;
    double x1 = ((n - 1) * x0 + this / calc.exponent(x0, (n - 1).toInt())) / n;

    while ((x0 - x1).abs() > precision) {
      x0 = x1;
      x1 = ((n - 1) * x0 + this / calc.exponent(x0, (n - 1).toInt())) / n;
    }
    return x1;
  }
}

main() {
  DelimetersCalculator calc = DelimetersCalculator();
  print('*** Задание 1 ***');
  int a = 12;
  int b = 30;
  print('НОД чисел $a и $b = ' + calc.gcd(a, b).toString());
  print('НОК чисел $a и $b = ' + calc.lcm(a, b).toString());
  print('Простые множители числа $b ' + calc.primeFactors(b).toString());
  print('');

  print('*** Задание 2 ***');
  ConvertDecimalBinary convert = ConvertDecimalBinary();
  print('$a в бинарной системе = ' + convert.convertBinary(a));
  String str = '1000';
  print('$str в десятичной системе = ' + convert.convertDecimal(str).toString());
  print('');

  print('*** Задание 3 ***');
  str = 'dff 4 sdasas 55 2 33 dasd';
  List<int> result3 = SearchNumbers().findNumber(str);
  print('Коллекция чисел строки  $str  = $result3');
  print('');

  print('*** Задание 4 ***');
  List<String> list = ['!', '+', '!', '!'];
  Map<String, int> result4 = SearchNumbers().findCountWord(list);
  print('Количество слов в коллекции $list  = $result4');
  print('');

  print('*** Задание 5 ***');
  str = 'one, two, zero, zero';
  Set<int> result5 = SearchNumbers().findWordNumber(str);
  print('Цифры в строке $str без повторений = $result5');
  print('');

  print('*** Задание 6 ***');
  Point point1 = Point(-1, 3, 2);
  Point point2 = Point(2, -3, 4);
  Point point3 = Point.oneTwoTree();
  double s = areaTriangle(point1, point2, point3);
  print('Площадь треугольника для точек $point1, $point2, $point3  = $s');
  print('');

  print('*** Задание 7 ***');
  a = 8;
  try {
    for (b = 3; b > 0; b--) {
      print('Корень $b степени из $a = ' + a.rootNDegree(b).toString());
    }
  } catch (e) {
    print('Внимание! Произошло исключение $e');
  }
  print('');

  print('*** Задание 8 ***');
  try {
    User user1 = User('user1', 'user1@mail.ru');
    AdminUser user2 = AdminUser('user2', 'user2@mail.ru');
    GeneralUser user3 = GeneralUser('user3', 'user3@mail.ru');
    UserManager userManager = UserManager();
    userManager.addUser(user1);
    userManager.addUser(user2);
    userManager.addUser(user3);
    userManager.addUser(GeneralUser.main());
    userManager.addUser(AdminUser('admin', 'admin@super.ru'));
    print('Тест №1: ');
    userManager.printEmail();
    userManager.deleteUser(user2);
    print('Тест №2: ');
    userManager.printEmail();
    userManager.deleteUser(user1);
    userManager.deleteUser(user3);
    print('Тест №3: ');
    userManager.printEmail();
    userManager.deleteUser(user2);
    print('Тест №4: ');
    userManager.printEmail();
  } catch (e){
    print('Внимание! Произошло исключение $e');
  }
}
