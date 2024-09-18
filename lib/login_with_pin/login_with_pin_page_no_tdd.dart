import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/login_with_pin/pin_grid_view.dart';
import 'package:news_app/login_with_pin/pin_utils.dart';
import 'package:news_app/login_with_pin/sort_order.dart';

//with no-TDD
class LoginWithPinPage extends StatefulWidget {
  static const routeName = 'login-with-pin-page';

  final SortOrder KeyPadsortOrder;
  final util = PinUtils();

  LoginWithPinPage()
      : KeyPadsortOrder =
            Random().nextBool() ? SortOrder.ascending : SortOrder.descending {}

  @override
  State<LoginWithPinPage> createState() => _LoginWithPinPageState();
}

class _LoginWithPinPageState extends State<LoginWithPinPage> {
  var inputtedPin = "";
  var isLoading = false;

  Widget createCircle(int index) {
    return Container(
      width: 15.0,
      height: 15.0,
      decoration: index <= inputtedPin.length
          ? BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange,
            )
          : BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.orange,
                width: 2.0,
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("inputtedPin: ${inputtedPin}");

    return Scaffold(
      appBar: AppBar(
        title: Text('Login with PIN'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Icon(
              Icons.add,
              size: 50.0,
              color: Colors.green,
            ),
            SizedBox(height: 50.0),
            Row(
              children: [
                ...new List<int>.generate(6, (i) => i + 1)
                    .map<Widget>(
                      (number) => createCircle(number),
                    )
                    .toList()
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
            SizedBox(height: 50.0),
            isLoading
                ? CircularProgressIndicator(
                    color: Colors.orange,
                  )
                : Expanded(
                    child: PinGridView(
                        sortOrder: widget.KeyPadsortOrder,
                        deleteButtonOnPressed: _onDeleteButtonPressed,
                        numberButtonOnPressed: _onDigitPressed),
                  ),
          ],
        ),
      ),
    );
  }

  void _onDeleteButtonPressed() {
    setState(() {
      if (inputtedPin.length > 0) {
        //TODO: integration test bug to demo ได้นะ
        inputtedPin = inputtedPin.substring(0, inputtedPin.length - 1);
      }
    });
  }

  void _onDigitPressed(int digit) {
    final newPin = inputtedPin + digit.toString();
    //TODO: hidden bug - expect to be detected by unit testing if do TDD which will drive to mvvm. Can be detected by component testing if !TDD
    //final newPin = digit.toString() + inputtedPin;
    if (inputtedPin.length < 6) {
      //TODO: integration test bug to demo ได้นะ

      setState(() {
        inputtedPin = newPin;
      });
    }
    if (newPin.length == 6 && widget.util.validatePin(newPin)) {
      _submitPin(newPin);
    }

    //TO-FIX: update all var and call empty setState() or
    //save new inputtedPin in temp var and check == 6
  }

  void _submitPin(String pin) async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 4));
    // var a = await util.savePin(pin);

    setState(() {
      isLoading = false;
    });
  }
}
