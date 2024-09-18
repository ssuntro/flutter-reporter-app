import 'package:flutter/material.dart';
import 'package:news_app/login_with_pin/sort_order.dart';

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
