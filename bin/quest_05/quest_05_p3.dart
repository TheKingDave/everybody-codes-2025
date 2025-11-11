import 'package:collection/collection.dart';

import '../utils.dart';

class Sword {
  int id;
  List<Segment> fishbone;
  int quality;
  
  Sword(this.id, this.fishbone, this.quality);
  
  factory Sword.parse(String inp) {
    final [id, nummStr] = inp.split(':');
    final numbers = parseIntList(nummStr);

    List<Segment> fishbone = [];

    for (var n in numbers) {
      fishbone.firstWhere((segment) {
        if (n < segment.middle && segment.left == null) {
          segment.left = n;
        } else if (n > segment.middle && segment.right == null) {
          segment.right = n;
        } else {
          return false;
        }
        return true;
      }, orElse: () {
        fishbone.add(Segment(n));
        return Segment(n);
      });
    }

    final quality = int.parse(fishbone.map((segment) => segment.middle).join());
    
    return Sword(int.parse(id), fishbone, quality);
  }
}

class Segment {
  int? left;
  int middle;
  int? right;

  Segment(this.middle);
  
  int get quality {
    return int.parse('${left ?? ''}$middle${right ?? ''}');
  }

  @override
  String toString() {
    return 'Segment{left: $left, middle: $middle, right: $right}';
  }
}

void main() async {
  final lines = await getFile().readAsLines();
  
  final swords = lines.map(Sword.parse).toList();
  swords.sort((a, b) {
    final cmpQuality = b.quality - a.quality;
    if (cmpQuality != 0) {
      return cmpQuality;
    }
    
    for (final pairs in IterableZip([a.fishbone, b.fishbone])) {
      final cmp = pairs.last.quality - pairs.first.quality;
      if (cmp != 0) {
        return cmp;
      }
    }
    
    return b.id - a.id;
  });

  print(swords.mapIndexed((idx, sword) => (idx+1) * sword.id).reduce((a, b) => a + b));
}


