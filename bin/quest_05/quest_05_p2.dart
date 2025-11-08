import 'dart:io';

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

  @override
  String toString() {
    return 'Segment{left: $left, middle: $middle, right: $right}';
  }


}

void main() async {
  final lines = await getFile().readAsLines();
  
  final swords = lines.map(Sword.parse).toList();
  swords.sort((a, b) => b.quality - a.quality);
  
  print(swords.first.quality - swords.last.quality);
}


