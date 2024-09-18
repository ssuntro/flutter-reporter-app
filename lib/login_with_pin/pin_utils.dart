class PinUtils {
  bool validatePin(String inputtedPin) {
    return true;
  }

  Future<bool> submitPin(String pin) {
    return Future.delayed(Duration(seconds: 2), () {
      print("Pin saved: $pin");
      return true;
    });
  }
}
