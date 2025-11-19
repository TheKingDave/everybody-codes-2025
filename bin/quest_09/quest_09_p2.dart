import 'package:collection/collection.dart';
import 'package:trotter/trotter.dart';

import '../utils.dart';

bool isChildOf(String child, String parentA, String parentB, {int from = 0}) {
  return IterableZip([child, parentA, parentB].map((e) => e.substring(from).split(''))).every((pair) => pair[0] == pair[1] || pair[0] == pair[2]);
}

int findChild(String a, String b, String c) {
  final list = [a, b, c];
  
  final couldBeChild = [true, true, true];
  for (final (idx, [a, b, c]) in IterableZip(list.map((e) => e.split(''))).indexed) {
    if (a == b && b == c) {
      continue;
    }
    if (a == b) {
      couldBeChild[2] = false;
    } else if (b == c) {
      couldBeChild[0] = false;
    } else if (a == c) {
      couldBeChild[1] = false;
    }
    final firstFound = couldBeChild.indexOf(true);
    if (couldBeChild.indexOf(true, firstFound + 1) == -1) {
      return isChildOf(list.removeAt(firstFound), list[0], list[1], from: idx) ? firstFound : -1;
    }
  }
  return -1;
}

int computeSimilarity(String child, String parentA, parentB) {
  var sumA = 0;
  var sumB = 0;
  for (final [c, a, b] in IterableZip([child, parentA, parentB].map((e) => e.split('')))) {
    sumA += c == a ? 1 : 0;
    sumB += c == b ? 1 : 0; 
  }
  return sumA * sumB;
}

void main() async {
  final lines = await getFile().readAsLines();
  
  final notFound = <String>{};
  final DNAs = lines.map((l) => l.substring(2)).toSet();
  final parents = <String>{};
  
  var sum = 0;
  
  /*while (DNAs.isNotEmpty) {
    final foundPair = Permutations(3, [...DNAs, ...parents]).iterable.map((pair) => (pair, findChild(pair[0], pair[1], pair[2]))).firstWhereOrNull((tuple) => tuple.$2 != -1);
    
    if (foundPair == null) {
      notFound.add(DNAs.first);
      print('not foudn: ${DNAs.first}');
      DNAs.remove(DNAs.first);
      continue;
    }
    final (parent, childIdx) = foundPair;
    DNAs.removeAll(parent);
    final child = parent.removeAt(childIdx);
    parents.addAll(parent);
    
    sum += computeSimilarity(child, parent[0], parent[1]);
    print(DNAs.length);
  }*/

  print(Permutations(3, [...DNAs, ...parents]).iterable.where((pair) => isChildOf(pair[0], pair[1], pair[2])).map((pair) => computeSimilarity(pair[0], pair[1], pair[2])).reduce((a, b) => a + b) / 2);
  print(sum);
}
