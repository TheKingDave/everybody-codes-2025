import '../utils.dart';

void main() async {
  final lines = await getFile().readAsLines();
  
  final line = lines.first;
  
  
  var mentorsA = 0;
  var totalA = 0;
  var mentorsB = 0;
  var totalB = 0;
  var mentorsC = 0;
  var totalC = 0;
  for (var char in line.codeUnits) {
    if (char == 'A'.codeUnitAt(0)) {
      mentorsA += 1;
    } else if (char == 'a'.codeUnitAt(0)) {
      totalA += mentorsA;
    } else if (char == 'B'.codeUnitAt(0)) {
      mentorsB += 1;
    } else if (char == 'b'.codeUnitAt(0)) {
      totalB += mentorsB;
    } else if (char == 'C'.codeUnitAt(0)) {
      mentorsC += 1;
    } else if (char == 'c'.codeUnitAt(0)) {
      totalC += mentorsC;
    }
  }
  
  print(totalA + totalB + totalC);
}
