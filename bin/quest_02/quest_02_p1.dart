import 'dart:math';
import 'complex.dart';

const quest = 2;
const part = 1;


void main() async {
  Complex a = Complex(151, 50);
  Complex ten = Complex(10, 10);

  Complex res = Complex(0, 0);

  for (var i = 0; i < 3; i++) {
    res = res.mul(res).div(ten).add(a);
  }

  res.output();
}
