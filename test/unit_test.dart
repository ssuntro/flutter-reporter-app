import 'package:flutter_test/flutter_test.dart';
import '../business_logic/calculator.dart';

//NOTE: Spike: flutter_test without mockito. This file is for only spike purpose which is not a good practice to use this file in production code.

class MockCalculator implements Calculator {
  @override
  int add(int a, int b) {
    return 111;
  }
}

// class MockCalculator extends Mock implements Calculator {
//   @override
//   int add(int a, int b) {
//     return 111;
//   }
// }

void main() {
  test('addition test', () {
    final calculator = Calculator();
    expect(calculator.add(2, 3), 5);
  });

  test('fetchData returns data', () async {
    final service = MockCalculator();

    expect(await service.add(4, 5), 111);
    expect(await service.add(1, 1), 111);
  });
}
