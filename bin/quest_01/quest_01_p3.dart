import '../utils.dart';

const quest = 1;
const part = 3;

void main() async {
  final lines = await getFile(quest, part).readAsLines();

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
