import 'package:flutter/material.dart';

class MainNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Container();
    return Scaffold(
        appBar: AppBar(
          title: Text("News list"),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            //vertically, mainAxisAlignment to center the children vertically, the cross axis would be horizontal
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[],
          ),
        ));
  }
}

// present popup == Navigator.of(context).push(
              //   MaterialPageRoute(
              //     fullscreenDialog: true,
              //     builder: (ctx) => MainNewsScreen(),
              //   ),
              // );