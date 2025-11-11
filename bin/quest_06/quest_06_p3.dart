import '../utils.dart';

void main() async {
  final lines = await getFile().readAsLines();
  
  final line = lines.first;
  
  final repeat = 1000;
  final distance = 1000;
  
  var totalFront = 0;
  var minusFront = 0;
  var totalMiddle = 0;
  var totalBack = 0;
  var minusBack = 0;
  
  final ll = line.length;
  for (var i = 0; i < ll; i++) {
    final codeUnit = line.codeUnitAt(i);
    // Not a-c
    if (!(codeUnit >= 97 && codeUnit <= 99)) {
      continue;
    }
    final upperCodeUnit = codeUnit - 32;
    for (var d = -distance; d <= distance; d++) {
      if (d == 0) {
        continue;
      }
      final checkCodeUnit = line.codeUnitAt((d + i) % ll);
      if (checkCodeUnit == upperCodeUnit) {
        if (i + d < 0) {
          minusFront++;
        }
        totalMiddle++;
        if (i + d >= ll) {
          minusBack++;
        }
      }
    }
  }
  
  print(minusFront);
  print(totalMiddle);
  print(minusBack);
  
  print('');
  print((totalMiddle * repeat) - minusFront - minusBack);
  print(3442321);
  print('');
}
