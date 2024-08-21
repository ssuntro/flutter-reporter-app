import 'package:flutter_test/flutter_test.dart';
import '../business_logic/calculator.dart';
import 'package:mockito/mockito.dart';

class MockCalculator extends Mock implements Calculator {}

void main() {
  // test('addition test', () {
  //   final calculator = Calculator();
  //   expect(calculator.add(2, 3), 5);
  // });

  test('fetchData returns data', () async {
    final service = MockCalculator();
    when(service.add(4, 5)).thenAnswer((_) => 111);

    expect(await service.add(4, 5), 111);
  });
}
