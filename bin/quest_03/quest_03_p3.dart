import '../utils.dart';

void main() async {
  final lines = await getFile().readAsLines();
  
  final crates = parseIntList(lines.first);
  
  crates.sort((a, b) => a - b);

  List<List<int>> sets = [[crates.removeAt(0)]];
  
  while (crates.isNotEmpty) {
    final currSize = sets.last.last;
    final idx = crates.indexWhere((box) => box > currSize);
    if (idx < 0) {
      sets.add([crates.removeAt(0)]);
      continue;
    }
    sets.last.add(crates.removeAt(idx));
  }
  
  print(sets.length);
  
}
