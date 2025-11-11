import 'package:path/path.dart';

import '../utils.dart';
import '../pairwise.dart';

void main() async {
  final lines = await getFile().readAsLines();

  final gears = lines.map((line) {
    final parts = line.split('|');
    final first = int.parse(parts.first);
    if (parts.length == 2) {
      return (first, int.parse(parts.last));
    }
    return (first, first);
  });

  final ratio = PairwiseIterable(gears).map((pair) => pair.$1.$2 / pair.$2.$1).reduce((a, b) => a * b);

  print(100 * ratio);
}
