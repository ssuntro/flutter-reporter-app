import 'package:flutter_test/flutter_test.dart';
import '../business_logic/calculator.dart';

void main() {
  test('addition test', () {
    final calculator = Calculator();
    expect(calculator.add(2, 3), 5);
  });
}
