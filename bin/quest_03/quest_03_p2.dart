import '../utils.dart';

void main() async {
  final lines = await getFile().readAsLines();
  
  final crates = parseIntList(lines.first);
  
  crates.sort((a, b) => a - b);
  
  final res = crates.fold([1, crates.first, crates.first], (previousValue, element) {
    final [count, size, lastSize] = previousValue;
    if (count >= 20) {
      return previousValue;
    }
    if (element > lastSize) {
      return [count+1, size + element, element];
    }
    return previousValue;
  });
  
  print(res.first);
  print(res[1]);
}
