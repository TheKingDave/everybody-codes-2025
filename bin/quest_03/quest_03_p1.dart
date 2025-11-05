import '../utils.dart';

void main() async {
  final lines = await getFile().readAsLines();
  
  final crates = parseIntList(lines.first);
  
  crates.sort((a, b) => b - a);
  
  final res = crates.fold([crates.first, crates.first], (previousValue, element) {
    final [count, lastSize] = previousValue;
    if (element < lastSize) {
      return [count + element, element];
    }
    return [count, element];
  });
  
  print(res.first);
}
