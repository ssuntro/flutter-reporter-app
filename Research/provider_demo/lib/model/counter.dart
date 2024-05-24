import 'dart:async';

import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  Counter() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      _count++;
      notifyListeners();
    });
  }
  int _count = 42;
  int get count => _count;
}
