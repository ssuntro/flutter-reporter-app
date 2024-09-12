import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/login_with_pin/pin_utils.dart';
import 'package:news_app/login_with_pin/sort_order.dart';

class LoginWithPinPage extends StatefulWidget {
  static const routeName = 'login-with-pin-page';

  final SortOrder KeyPadsortOrder;

  LoginWithPinPage()
      : KeyPadsortOrder =
            Random().nextBool() ? SortOrder.ascending : SortOrder.descending {}

  @override
  State<LoginWithPinPage> createState() => _LoginWithPinPageState();
}

class _LoginWithPinPageState extends State<LoginWithPinPage> {
  var inputtedPin = "";
  final util = PinUtils();

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
            CircularProgressIndicator(
              color: Colors.orange,
            ),
            Expanded(
              child: PinGridView(
                sortOrder: widget.KeyPadsortOrder,
                deleteButtonOnPressed: () {
                  setState(() {
                    if (inputtedPin.length > 0) {
                      //TODO: integration test bug to demo ได้นะ
                      inputtedPin =
                          inputtedPin.substring(0, inputtedPin.length - 1);
                    }
                  });
                },
                numberButtonOnPressed: (aNumber) {
                  setState(() {
                    if (inputtedPin.length < 6) {
                      //TODO: integration test bug to demo ได้นะ
                      inputtedPin += aNumber.toString();
                    }
                    if (inputtedPin.length == 6 &&
                        util.validatePin(inputtedPin)) {
                      util.savePin(inputtedPin);
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PinGridView extends StatelessWidget {
  final SortOrder sortOrder;
  final VoidCallback deleteButtonOnPressed;
  final void Function(int) numberButtonOnPressed;
  PinGridView(
      {required this.sortOrder,
      required this.deleteButtonOnPressed,
      required this.numberButtonOnPressed});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
      itemCount: 11,
      itemBuilder: (context, index) {
        if (index == 10) {
          // Last item, render delete button
          return IconButton(
              icon: Icon(Icons.backspace), onPressed: deleteButtonOnPressed);
        }
        return InkWell(
          onTap: () {
            numberButtonOnPressed(sortOrder.getDisplayNumber(index));
            //   // print('Pressed ${widget.KeyPadsortOrder.getDisplayNumber(index)}');
          },
          child: Container(
            alignment: Alignment.center,
            child: Text(
              '${sortOrder.getDisplayNumber(index)}',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
