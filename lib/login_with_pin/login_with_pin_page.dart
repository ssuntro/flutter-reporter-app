// pin_page.dart
import 'package:flutter/material.dart';
import 'package:news_app/login_with_pin/pin_grid_view.dart';
import 'package:provider/provider.dart';
import 'pin_view_model.dart';

//MVVM with ChangeNotifierProvider
//the alternative of mvvm is delegation pattern with mixin https://betterprogramming.pub/how-to-implement-the-delegation-design-pattern-in-dart-d782de77c886
class LoginWithPinPage extends StatelessWidget {
  static const routeName = 'pin-page';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PinViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Enter PIN'),
        ),
        body: Center(
          child: Consumer<PinViewModel>(
            builder: (context, viewModel, child) {
              print(viewModel.inputtedPin);
              return Column(
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
                            (number) => createCircle(number, viewModel),
                          )
                          .toList()
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  ),
                  SizedBox(height: 50.0),
                  viewModel.isLoading
                      ? CircularProgressIndicator(
                          color: Colors.orange,
                        )
                      : Expanded(
                          child: PinGridView(
                              sortOrder: viewModel.keyPadsortOrder,
                              deleteButtonOnPressed:
                                  viewModel.onDeleteButtonPressed,
                              numberButtonOnPressed: viewModel.onDigitPressed),
                        ),

//
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget createCircle(int index, PinViewModel viewModel) {
    return Container(
      width: 15.0,
      height: 15.0,
      decoration: index <= viewModel.inputtedPin.length
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
}
