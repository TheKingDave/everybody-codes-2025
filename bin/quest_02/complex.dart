import 'dart:math';

typedef Complex = Point<int>;

extension ComplexMath on Complex {
  Complex add(Complex b) {
    return Complex(x + b.x, y + b.y);
  }
  
  Complex addInt(int x, int y) {
    return Complex(this.x + x, this.y + y);
  }

  Complex mul(Complex b) {
    return Complex(x * b.x - y * b.y, x * b.y + y * b.x);
  }

  Complex div(Complex b) {
    return Complex(x ~/ b.x, y ~/ b.y);
  }

  void output() {
    print('[$x,$y]');
  }
}
