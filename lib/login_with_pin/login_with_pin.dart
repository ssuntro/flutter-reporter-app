import 'dart:math';

import 'package:flutter/material.dart';
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
  var numberOfInputtedDigits = 0;

  Widget createCircle(int index) {
    return Container(
      width: 15.0,
      height: 15.0,
      decoration: index <= numberOfInputtedDigits
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
            Expanded(
              child: GridView.builder(
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
                      icon: Icon(Icons.backspace),
                      onPressed: () {
                        setState(() {
                          if (numberOfInputtedDigits > 0) {
                            numberOfInputtedDigits--;
                          }
                        });
                      },
                    );
                  }
                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (numberOfInputtedDigits < 6) {
                          numberOfInputtedDigits++;
                        }
                      });
                      print(
                          'Pressed ${widget.KeyPadsortOrder.getDisplayNumber(index)}');
                      // Add your onPress logic here
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        '${widget.KeyPadsortOrder.getDisplayNumber(index)}',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //   },
            //   child: Text("Add"),
            // ),
          ],
        ),
      ),
    );
  }
}
