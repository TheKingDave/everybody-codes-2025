import 'dart:math';

import 'package:collection/collection.dart';
import 'package:trotter/trotter.dart';

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
  
  final pattern = parseIntList(lines.first).map((i) => i - 1);
  
  final strings = PairwiseIterable(pattern).toList(growable: false);
  
  var maxKnots = 0;
  (int, int)? cut;
  
  final comb = Combinations(2, List.generate(numNails, (i) => i));
  
  for (final c in comb.iterable) {
    final [from, to] = c;
    
    final left = pointsBetween(from, to, -1);
    final right = pointsBetween(from, to, 1);

    final useList = left.length < right.length ? left : right;
    
    
    var knots = strings.firstWhereOrNull((s) => (s.$1 == from && s.$2 == to) || (s.$1 == to && s.$2 == from)) == null ? 0 : 1;
    for (final point in useList.sublist(1, useList.length - 1)) {
      knots += strings.where((s) => (s.$1 == point && !useList.contains(s.$2)) || (s.$2 == point && !useList.contains(s.$1))).length;
    }
    if (knots > maxKnots) {
      maxKnots = knots;
      cut = (from, to);
    }
  }
  
  print(maxKnots);
}
