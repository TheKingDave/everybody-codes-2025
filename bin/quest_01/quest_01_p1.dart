import '../utils.dart';

const quest = 1;
const part = 1;

void main() async {
  final lines = await getFile(quest, part).readAsLines();

  final names = parseStringList(lines.first);

  final instructions = parseStringList(lines[2]);

  final selectedName = instructions
      .map((ins) {
        final lr = ins.substring(0, 1);
        final num = int.parse(ins.substring(1));
        return num * (lr == 'L' ? -1 : 1);
      })
      .reduce((a, b) => (a + b).clamp(0, names.length - 1));

  print('Solution: ${names[selectedName]}');
}
