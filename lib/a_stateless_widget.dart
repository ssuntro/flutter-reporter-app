import 'package:flutter/material.dart';

class AStatelessWidget extends StatelessWidget {
  final String parsedString;

  AStatelessWidget({this.parsedString}) {
    print("AStatelessWidget is init");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(parsedString + " lesssssss"),
    );
  }
}
