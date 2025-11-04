import 'dart:io';
import 'package:path/path.dart' as path;

final fileRegex = RegExp(r'quest_(?<quest>\d+)_p(?<part>\d).dart');

File getFile() {
  final fileName = path.basename(Platform.script.path);
  final match = fileRegex.firstMatch(fileName);
  if (match == null) {
    throw Exception("Could not match filename to regex");
  }
  final quest = int.parse(match.namedGroup("quest")!);
  final part = int.parse(match.namedGroup("part")!);
  return File('inp/everybody_codes_e2025_q${quest.toString().padLeft(2, '0')}_p$part.txt',);
}

List<String> parseStringList(String inp) {
  return inp.split(',');
}

extension SwappableList<E> on List<E> {
  void swap(int first, int second) {
    final temp = this[first];
    this[first] = this[second];
    this[second] = temp;
  }
}
