import '../utils.dart';
import '../pairwise.dart';

void main() async {
  final lines = await getFile().readAsLines();
  
  final numNails = 32;
  final numNailsHalf = numNails ~/ 2;
  
  final pattern = parseIntList(lines.first);
  
  print(PairwiseIterable(pattern).where((pair) => pair.$1 % numNailsHalf == pair.$2 % numNailsHalf).length);
}
