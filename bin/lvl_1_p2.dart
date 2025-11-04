import 'dart:io';
import 'utils.dart';

const level = 1;
const part = 2;

void main() async {
  final lines = await File(
    'inp/everybody_codes_e2025_q${level.toString().padLeft(2, '0')}_p$part.txt',
  ).readAsLines();

  final names = parseStringList(lines.first);

  final instructions = parseStringList(lines[2]);

  final selectedName = instructions
      .map((ins) {
        final lr = ins.substring(0, 1);
        final num = int.parse(ins.substring(1));
        return num * (lr == 'L' ? -1 : 1);
      })
      .reduce((a, b) => (a + b) % names.length);

  print('Solution: ${names[selectedName]}');
}
