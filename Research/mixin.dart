void main() {}

//* simple mixin
mixin Printable {
  bool isMarkSensitiveData = true;
  void print(String data) {
    print("print: $data");
  }
}

class AA with Printable {}

class BB with Printable {}

//* conditional mixin
class Detectable {}

mixin Police on Detectable {}

class SingerDancer extends Detectable with Police {}

// class Programmer with Police {}
