import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginWithPinPage extends StatelessWidget {
  static const routeName = 'login-with-pin-page';

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

  LoginWithPinPage() {
    xx = <Widget>[
      createDircle(),
      SizedBox(width: 15.0),
      createDircle(),
      SizedBox(width: 15.0),
      createDircle(),
      SizedBox(width: 15.0),
      createDircle(),
      SizedBox(width: 15.0),
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
            Text('Login with PIN'),
            Row(
              children: xx, mainAxisAlignment: MainAxisAlignment.spaceAround,
              // <Widget>[
              // ...new List<int>.generate(5, (i) => i + 1)
              //     .map((number) => Container(
              //           width: 15.0,
              //           height: 15.0,
              //           decoration: new BoxDecoration(
              //             color: Colors.orange,
              //             shape: BoxShape.circle,
              //           ),
              //         ))
              //     .toList()
              // ],
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 columns
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                itemCount: 10, // 0-9
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    // decoration: BoxDecoration(
                    //   color: Colors.orange,
                    // shape: BoxShape.circle,
                    // ),
                    child: Text(
                      '${9 - index}',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
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
