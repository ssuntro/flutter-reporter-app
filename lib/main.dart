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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'News App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController _controller;
  var showButton = true;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    Future.delayed(const Duration(milliseconds: 5000), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => MainNewsScreen()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildButton() {
    print("#1 - buildButton");
    return showButton
        ? ElevatedButton(
            onPressed: () {},
            child: const Text('Button ja'),
          )
        : Container(
            // ~invisible view - to group things, can see if set bgColor

            color: Colors.amber,
            height: 10,
            width: 10,
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
