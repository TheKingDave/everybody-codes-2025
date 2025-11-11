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

bool nameValid(String name, Map<String, Rule> rules) {
  for (final (start, follow) in PairwiseIterable(name.split(''))) {
    final rule = rules[start];
    if (rule == null || !rule.follow.contains(follow)) {
      return false;
    }
  }
  return true;
}

void findNames(String prefix, Set<String> allNames, Map<String, Rule> rules) {
  if (prefix.length > 11) {
    return;
  }
  if (prefix.length >= 7) {
    allNames.add(prefix);
  }
  
  final rule = rules[prefix.split('').last];
  if (rule == null) {
    return;
  }
  for (final follow in rule.follow) {
    findNames(prefix + follow, allNames, rules);
  }
}

void main() async {
  final lines = await getFile().readAsLines();
  
  final [prefixesRaw, _, ...rulesRaw] = lines;
  
  final rules = rulesRaw.map(Rule.parse);
  final ruleMap = { for (var r in rules) r.letter : r };
  final prefixes = parseStringList(prefixesRaw).where((name) => nameValid(name, ruleMap));
  
  final allNames = <String>{};
  
  for (final prefix in prefixes) {
    findNames(prefix, allNames, ruleMap);
  }
  
  print('Num: ${allNames.length}');
}
