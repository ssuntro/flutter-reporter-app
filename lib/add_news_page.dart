import 'package:flutter/material.dart';

class AddNewsPage extends StatelessWidget {
  static const routeName = '/add-news';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add a news'),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.back_hand)),
            IconButton(onPressed: () {}, icon: Icon(Icons.abc))
          ],
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ));
  }
}
