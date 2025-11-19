import 'package:collection/collection.dart';

import '../utils.dart';

int findChild(String a, String b, String c) {
  final couldBeChild = [true, true, true];
  for (final [a, b, c] in IterableZip([a, b, c].map((e) => e.split('')))) {
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
      return firstFound;
    }
  }
  return -1;
}

int computeSimilarity(String a, String b) {
  return IterableZip([a.split(''), b.split('')]).where((pair) => pair[0] == pair[1]).length;
}

void main() async {
  final lines = await getFile().readAsLines();
  
  final DNAs = lines.map((l) => l.split(':')[1]).toList();
  
  final [a, b, c] = DNAs;
  
  final childIndex = findChild(a, b, c);
  
  final child = DNAs.removeAt(childIndex);
  
  print(DNAs.map((dna) => computeSimilarity(dna, child)).reduce((a, b) => a * b));
  
}
