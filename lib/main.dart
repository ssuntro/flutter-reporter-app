import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/main_news_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'News App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key) {
    // print("MyHomePage - init");
  }

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  _MyHomePageState() {
    // print("_MyHomePageState - init");
  }
  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    // print("_MyHomePageState - didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // print("_MyHomePageState - dispose");
    _controller.dispose();
    super.dispose();
  }

//////
  AnimationController _controller;
  var showButton = true;
  @override
  void initState() {
    // print("_MyHomePageState - initState");
    super.initState();
    _controller = AnimationController(vsync: this);
    Future.delayed(const Duration(milliseconds: 5000), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => MainNewsScreen()));
    });
  }

  String ann;
  Widget buildButton() {
    print("#1 - buildButton");
    return showButton
        ? Container(
            // ~invisible view - to group things, can see if set bgColor

            color: Colors.amber,
            height: 10,
            width: 10,
          )
        : ElevatedButton(
            onPressed: () {
              setState(() {
                print("#2 - setState been called");
                ann = "";
              });
            },
            child: const Text('Button ja'),
          );
  }

  Widget buildLottie() {
    print("#1 - buildLottie ${showButton}");
    return Lottie.asset('assets/dino.json', controller: _controller,
        onLoaded: (composition) {
      setState(() {
        print("#1 - setState been called");
        _controller..duration = composition.duration;
        showButton = !showButton;
        // ..forward();
      });
      print("#1 - call future");
      // Future.delayed(const Duration(milliseconds: 5000), () {});
      _controller.repeat();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildLottie(),
          buildButton(),
        ],
      ),
    );

    // floatingActionButton: FloatingActionButton(
    //   onPressed: () {},
    //   tooltip: 'Increment',
    //   child: Icon(Icons.add),
    // ),
    // );
  }
}
