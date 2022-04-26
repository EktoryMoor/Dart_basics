///2. Реализуйте методы для преобразования целых чисел из десятичной системы в двоичную и обратно.
class ConvertDecimalBinary {
  ///Преобразование из десятичной в двоичную
  String convertBinary( int decimal) {
    String result = '';
    while (decimal > 0) {
      result = (decimal % 2).toString() + result;
      decimal = decimal ~/ 2;
    }
    return result;
  }

  ///Преобразование из  двоичной  в десятичную
  int convertDecimal(String binary) {
    int result = 0;
    for (int i = 0; i < binary.length; i++) {
      if (binary[i] == '1') {
        result += exponent(2, (binary.length - i - 1)).toInt();
      }
    }
    return result;
  }

  ///Расчет степени, чтобы не использовать Math
  double exponent(double number, int exp) {
    double result = number;
    if (exp == 0) {
      return 1;
    }
    while (exp != 1) {
      result *= number;
      exp--;
    }
    return result;
  }
}
