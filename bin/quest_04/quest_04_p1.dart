import '../utils.dart';
import '../pairwise.dart';
import 'package:collection/collection.dart';

void main() async {
  final lines = await getFile().readAsLines();
  
  final ratio = PairwiseIterable(lines.map(int.parse)).map((pair) => pair.$1 / pair.$2).reduce((a, b) => a * b);

  print(2025 * ratio);
}
