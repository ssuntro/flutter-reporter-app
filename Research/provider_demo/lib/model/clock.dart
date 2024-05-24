import 'dart:async';

import 'package:flutter/material.dart';

class Clock extends ChangeNotifier {
  Clock() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      _dateTime = DateTime.now();
      notifyListeners();
    });
  }
  DateTime _dateTime = DateTime.now();
  DateTime get dateTime => _dateTime;
}
