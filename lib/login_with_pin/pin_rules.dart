import 'dart:math';

class PinRule {
  final bool Function(String pin) condition;
  final String description;

  PinRule(this.condition, this.description);
}

class PinRules {
  List<PinRule> _rules = [
    PinRule((pin) => sixLength(pin), "Must be 6 characters long"),
    PinRule((pin) => containsOnlyDigits(pin), "PIN must contain only digits"),
    PinRule((pin) => !isSequential(pin), "PIN must not be sequential"),
    PinRule((pin) => !hasSameNumber(pin), "PIN must not have repeating digits"),
    PinRule((pin) => !totalEqualsToThirteen(pin),
        "Sum of digits must not be equal to 13"),
  ];

  // bool validate(String pin) {
  //   return _rules.every((rule) => rule.rule(pin));
  // }

  bool validate(String pin) {
    return _rules.map((rule) {
      if (!rule.condition(pin)) {
        print("validate failed: " + rule.description);
        return false;
      }
      return true;
    }).every((result) => result);
  }

  static bool sixLength(String pin) {
    return pin.length == 6;
  }

  static bool containsOnlyDigits(String pin) {
    return pin.contains(RegExp(r'^[0-9]+$'));
  }

  static bool isSequential(String pin) {
    if (pin.length < 2) return false;

    bool isIncreasing = true;
    bool isDecreasing = true;

    for (int i = 0; i < pin.length - 1; i++) {
      int currentDigit = int.parse(pin[i]);
      int nextDigit = int.parse(pin[i + 1]);

      if (currentDigit + 1 != nextDigit) {
        isIncreasing = false;
      }
      if (currentDigit - 1 != nextDigit) {
        isDecreasing = false;
      }
    }

    return isIncreasing || isDecreasing;
  }

  static bool hasSameNumber(String pin) {
    for (int i = 0; i < pin.length - 1; i++) {
      if (pin[i] == pin[i + 1]) {
        return true;
      }
    }
    return false;
  }

  static bool totalEqualsToThirteen(String pin) {
    int total = 0;
    for (int i = 0; i < pin.length; i++) {
      total += int.parse(pin[i]);
    }
    return total == 13;
  }
}
