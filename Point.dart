import 'dart:math';

///6. Реализуйте класс Point, который описывает точку в трёхмерном пространстве.
///У данного класса реализуйте метод distanceTo(Point another),
///который возвращает расстояние от данной точки до точки в параметре.
///По желанию можете реализовать метод, принимающий три точки в трёхмерном пространстве и
///возвращающий площадь треугольника, который образуют данные точки.
///Реализуйте factory-конструкторы для данного класса, возвращающие начало координат,
///и ещё несколько на своё усмотрение
///(например, конструктор, возвращающий точку с координатами [1,1,1], которая определяет единичный вектор).
class Point {
  final int x;
  final int y;
  final int z;

  Point(this.x, this.y, this.z);

  factory Point.zero() {
    return Point(0, 0, 0);
  }

  factory Point.one() {
    return Point(1, 1, 1);
  }

  factory Point.oneTwoTree() {
    return Point(1, 2, 3);
  }

  ///Метод distanceTo(Point another), который возвращает расстояние от данной точки до точки в параметре
  double distanceTo(Point another) {
    double result = 0;
    result = pow(this.x - another.x, 2).toDouble();
    result += pow(this.y - another.y, 2).toDouble();
    result += pow(this.z - another.z, 2).toDouble();
    result = sqrt(result);
    return result;
  }

  String toString() {
    return '[' + this.x.toString() + ', ' + this.y.toString() + ', ' + this.z.toString() + ']';
  }
}

///Метод, принимающий три точки в трёхмерном пространстве и возвращающий площадь треугольника, который образуют данные точки
double areaTriangle(Point a, Point b, Point c) {
  double result = 0;
  final double ab = a.distanceTo(b);
  final double bc = b.distanceTo(c);
  final double ac = a.distanceTo(c);
  final p = (ab + bc + ac) / 2;
  result = sqrt(((p - ab) * (p - ac) * (p - bc) * p));
  return result;
}
