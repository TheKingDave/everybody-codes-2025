import '../utils.dart';

void main() async {
  final lines = await getFile().readAsLines();
  
  final line = lines.first;
  
  var mentors = 0;
  var total = 0;
  for (var char in line.codeUnits) {
    if (char == 'A'.codeUnitAt(0)) {
      mentors += 1;
    } else if (char == 'a'.codeUnitAt(0)) {
      total += mentors;
    }
  }
  
  print(total);
}
