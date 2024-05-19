void main() {
  print('42'.parseInt());
  dynamic d = '2'; // Static types and dynamic
  // print(d.parseInt());

  var dd = '2'; //Extension methods do work with Dart's type inference
  print(dd.parseInt());
}

extension NumberParsing on String {
  int parseInt() {
    return int.parse(this) + 10;
  }
  // ···
}
