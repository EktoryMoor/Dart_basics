///1.
///Реализуйте методы вычисления НОД и НОК целых чисел.
///Реализуйте метод, который разбивает число на простые множители и возвращает их.
class DelimetersCalculator {

  ///НОД
  int gcd(int a, int b) {
    return (a > b) ? _gcd(a, b) : _gcd(b, a);
  }

  int _gcd(int paramA, int paramB) {
    return paramB != 0 ? _gcd(paramB, paramA % paramB) : paramA;
  }

  ///НОК
  int lcm(int a, int b) {
    return (a * b) ~/ gcd(a,b);
  }

  ///Простые множители
  List<int> primeFactors(int n) {
    List<int> factors = [];
    int d = 2;
    factors.add(1);
     while( n>1){
       if ( n % d == 0){
         factors.add(d);
         n = n ~/ d;
       }
       else d++;
     }

    return factors;
  }


}


