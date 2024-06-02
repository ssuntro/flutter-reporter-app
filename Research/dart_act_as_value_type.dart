// Yes, Dart's int type is a "reference type". Dart does not have value types at all, all values are instances of a class, including integers. (At least technically, function values makes their classes very hard to see.) EDIT: With records, it's ... complicated. They're technically reference values, but ones that don't have a fixed identity. Or rather, any attempt to compare record references for being references to the same object, is always free to say false.

// Integers are immutable and pretends to be canonicalized. If a and b are int values and a == b, then identical(a, b) is guaranteed to be true, so a and b looks like they are the same object, but it's unspecified whether that's because they really are the same object, or because identical just cheats and does == for integers.

// int is a value type in the sense that if you pass int value into a function and change the value of a parameter inside function, it won't affect outer scope.
// But int is still a class even though its name starts from lowercase letter

// And regarding your concern about 'null' : In Dart, like JavaScript and Python, everything that a variable can hold is an object including null. Every object including null is an instance of some class and all these classes inherit from Object class.

void main() {
//   for (int i = 0; i < 10; i++) {
//     print('hello ${i + 1}');
//   }

  int outer = 0;
  add(outer);
  print(outer); // 0, unchanged

  String a = "JJ";
  addString(a);
  print(a);

  print('2  is instance of "int" class :\t${2 is int}');
}

void add(int inner) {
  inner += 1;
}

void addString(String inner) {
  inner += " ee";
}


// in short, this is what dart dev need to be aware. However, mem leak issue still avaiable as typical ref type in other programming lang