// pin_view_model.dart
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/login_with_pin/pin_rules.dart';
import 'package:news_app/login_with_pin/sort_order.dart';

class PinViewModel extends ChangeNotifier {
  String _inputtedPin = '';
  bool _isLoading = false;
  SortOrder _keyPadsortOrder =
      Random().nextBool() ? SortOrder.ascending : SortOrder.descending;

  String get inputtedPin => _inputtedPin;
  bool get isLoading => _isLoading;
  SortOrder get keyPadsortOrder => _keyPadsortOrder;

  void onDigitPressed(int digit) {
    if (_inputtedPin.length < 6) {
      _inputtedPin = _inputtedPin + digit.toString();
      notifyListeners();
    }
    if (_validatePin()) {
      _submitPin();
    }
  }

  bool _validatePin() {
    return PinRules().validate(_inputtedPin);
    // return _inputtedPin.length == 6 && true; //rules
  }

  Future<void> _submitPin() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 4));
    // var a = await util.savePin(pin);

    _isLoading = false;
    notifyListeners();
  }

  void onDeleteButtonPressed() {
    if (_inputtedPin.isNotEmpty) {
      _inputtedPin = _inputtedPin.substring(0, _inputtedPin.length - 1);
      notifyListeners();
    }
  }

  // Future<void> submitPin() async {
  //   if (_inputtedPin.length == 6) {
  //     _isLoading = true;
  //     notifyListeners();

  //     // Simulate a delay for submitting the pin
  //     await Future.delayed(Duration(seconds: 2));

  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }
}
