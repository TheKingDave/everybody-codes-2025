import 'dart:io';

File getFile(int quest, int part) {
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
