import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

//NOTE: Spike: flutter_test with mockito and its build_runner. This file is for only spike purpose which is not a good practice to use this file in production code.

// Annotation which generates the cat.mocks.dart library and the MockCat class.
@GenerateNiceMocks([MockSpec<Cat>()])
import 'cat_unit_test.mocks.dart'; //path will have a same name of file that @GenerateNiceMocks annotation located

class Cat {
  String sound(String suffix) => "Meow$suffix";
  bool eatFood(String food, {bool? hungry}) {
    return false;
  }

  Future<void> chew() async => print("Chewing...");
  int walk(List<String> places) => 7;
  void sleep() {}
  void hunt(String place, String prey) {}
  int lives = 9;
}

void main() {
  test('cat sound', () {
    var cat = MockCat();

    when(cat.sound(any)).thenReturn("Purr");
    expect(cat.sound(""), "Purr");
    expect(cat.sound("ddd"), "Purr");
  });

  group('eat food', () {
    test('any input return true', () {
      var cat = MockCat();

      when(cat.eatFood(any)).thenReturn(true);
      expect(cat.eatFood(""), true);
      expect(cat.eatFood("w"), true);
    });
    test('specific input return true', () {
      var cat = MockCat();

      when(cat.eatFood(any, hungry: true)).thenReturn(true);
      expect(cat.eatFood("qqq", hungry: true), true);
      expect(cat.eatFood("w", hungry: true), true);
    });

    test('Spy number of called with any argument', () {
      var cat = MockCat();
      cat.hunt("forest", "mouse");
      cat.hunt("forest", "eiei");

      verify(cat.hunt(any, any)).called(2);
    });
    test('Spy number of called with specific argument', () {
      var cat = MockCat();
      cat.hunt("forest", "mouse");
      cat.hunt("forest", "eiei");

      verify(cat.hunt("forest", "mouse")).called(1);
    });
  });
}
