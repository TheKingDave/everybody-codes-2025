import '../utils.dart';
import '../pairwise.dart';

class Rule {
  final String letter;
  final List<String> follow;
  
  Rule(this.letter, this.follow);

  factory Rule.parse(String str) {
    final [letter, follow] = str.split('>').map((e) => e.trim()).toList(growable: false);
    
    return Rule(letter, parseStringList(follow));
  }

  @override
  String toString() {
    return 'Rule{letter: $letter, follow: $follow}';
  }
}

void main() async {
  final lines = await getFile().readAsLines();
  
  final [namesRaw, _, ...rulesRaw] = lines;
  
  final names = parseStringList(namesRaw);
  final rules = rulesRaw.map(Rule.parse);
  
  final ruleMap = { for (var r in rules) r.letter : r };
  
  var sum = 0;
  for (final (idx, name) in names.indexed) {
    var followsRules = true;
    for (final (start, follow) in PairwiseIterable(name.split(''))) {
      final rule = ruleMap[start];
      if (rule == null || !rule.follow.contains(follow)) {
        followsRules = false;
        break;
      }
    }
    if (followsRules) {
      sum += idx + 1;
    }
  }
  
  print('Sum: $sum');
}
