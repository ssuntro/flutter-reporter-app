void main() {
  Person.nationality;

  final one = Person(name: "one", age: 11, onCompare: isLowerThan);
  final two = Person(name: "two", age: null, onCompare: isLowerThan);
  final three = Person(name: "three", onCompare: isLowerThan);

  one.name;
  two.age;
  // two.age = 1;
  two.age!;
  two.age ?? "100";
  three.onCompare(2, 2);
}

bool isLowerThan(int a, int b) {
  a = a + 10;
  b = b + 10;
  print("aFunction.a: $a");
  print("aFunction.b: $b");
  return a < b;
}

class Person {
  var name = "Ann";
  final int? age;
  static const String nationality = "Thai";
  final bool Function(int, int) onCompare;
  Person({required this.name, this.age, required this.onCompare});
}
