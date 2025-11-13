import 'dart:math';

import '../utils.dart';
import '../pairwise.dart';

final numNails = 256;

List<int> pointsBetween(int start, int end, int dir) {
  final ret = <int>[start];
  var curr = start;
  do {
    curr = (curr + dir) % numNails;
    ret.add(curr);
  } while(curr != end);
  
  return ret;
}

void main() async {
  final lines = await getFile().readAsLines();
  final numNailsHalf = numNails ~/ 2;
  
  final pattern = parseIntList(lines.first).map((i) => i - 1);
  
  final strings = <(int, int)>[];
  
  var knots = 0;
  
  for (final (from, to) in PairwiseIterable(pattern)) {
    final left = pointsBetween(from, to, -1);
    final right = pointsBetween(from, to, 1);
    
    final useList = left.length < right.length ? left : right;
    
    for (final point in useList.sublist(1, useList.length - 1)) {
      knots += strings.where((s) => (s.$1 == point && !useList.contains(s.$2)) || (s.$2 == point && !useList.contains(s.$1))).length;
    }
    strings.add((from, to));
  }
  
  print(knots);
}
