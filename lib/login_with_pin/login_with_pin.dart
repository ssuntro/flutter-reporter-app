import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/login_with_pin/sort_order.dart';

class LoginWithPinPage extends StatelessWidget {
  static const routeName = 'login-with-pin-page';

  final SortOrder KeyPadsortOrder;

  Widget createDircle() {
    return Container(
      width: 15.0,
      height: 15.0,
      decoration: new BoxDecoration(
        color: Colors.orange,
        shape: BoxShape.circle,
      ),
    );
  }

  late final List<Widget> xx;

  LoginWithPinPage()
      : KeyPadsortOrder =
            Random().nextBool() ? SortOrder.ascending : SortOrder.descending {
    xx = <Widget>[
      createDircle(),
      createDircle(),
      createDircle(),
      createDircle(),
      createDircle(),
    ];
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
              children: xx,
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
                      onPressed: () {},
                    );
                  }
                  return InkWell(
                    onTap: () {
                      print(
                          'Pressed ${KeyPadsortOrder.getDisplayNumber(index)}');
                      // Add your onPress logic here
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        '${KeyPadsortOrder.getDisplayNumber(index)}',
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
