import '../utils.dart';

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
  
  final [id, nummStr] = lines.first.split(':');
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
  
  print(fishbone.map((segment) => segment.middle).join());
}
