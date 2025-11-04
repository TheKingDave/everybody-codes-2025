import '../utils.dart';
import 'complex.dart';

int minRange = -1000000;
int maxRange = 1000000;

Complex a = Complex(-79785,-16616);
//Complex a = Complex(35300,-64910); // Example
Complex divident = Complex(100000, 100000);

void main(List<String> args) async {
  final file = getFile();

  var sum = 0;
  for (int y = 0; y <= 1000; y += 1) {
    for (int x = 0; x <= 1000; x += 1) {
      final check = a.addInt(x, y);
      final isIncluded = isPointIncluded(check);
      if (isIncluded) {
        sum += 1;
      }
    }
  }

  print(sum);
}

bool isPointIncluded(Complex p) {
  Complex check = Complex(0, 0);
  for (int i = 0; i < 100; i++) {
    check = check.mul(check).div(divident).add(p);
    if (check.x < minRange || check.x > maxRange || check.y < minRange || check.y > maxRange) {
      return false;
    }
  }
  return true;
}
