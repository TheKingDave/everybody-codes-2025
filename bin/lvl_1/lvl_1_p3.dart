import 'dart:io';
import 'utils.dart';

const level = 1;
const part = 3;

void main() async {
  final lines = await File(
    'inp/everybody_codes_e2025_q${level.toString().padLeft(2, '0')}_p$part.txt',
  ).readAsLines();

  final names = parseStringList(lines.first);

  final instructions = parseStringList(lines[2]);

  instructions
      .map((ins) {
        final lr = ins.substring(0, 1);
        final num = int.parse(ins.substring(1));
        return num * (lr == 'L' ? -1 : 1);
      })
      .forEach((num) => names.swap(0, num % names.length));

  print('Solution: ${names[0]}');
}
