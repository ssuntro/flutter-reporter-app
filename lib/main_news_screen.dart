import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';

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

          // child: SingleChildScrollView(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.stretch,
          //     children: [
          //       ...new List<int>.generate(10, (i) => i + 1)
          //           .map(
          //             (number) => Container(
          //               child: Text(
          //                 "${number}",
          //                 style: TextStyle(fontSize: 150),
          //               ),
          //               color: (number % 2 == 0)
          //                   ? Colors.amber
          //                   : Colors.blueAccent,
          //               height: 100,
          //               width: 10,
          //             ),
          //           )
          //           .toList()
          //     ],
          //   ),
          // ),

          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (ctx, index) => Container(
                  padding: EdgeInsets.all(0),
                  height: 100,
                  // color: index % 2 == 0 ? Colors.amber : Colors.blue,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        padding: EdgeInsets.all(0)),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Image.network(
                            "https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg"),
                        Container(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "AA",
                              textAlign: TextAlign.left,
                              // style: TextStyle(backgroundColor: Colors.red),
                            ),
                            SizedBox(
                              height: 25,
                              child: ElevatedButton(
                                  child: Text("Animal"),
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 181, 231,
                                        244), //Color.fromARGB(255, 198, 126, 210),
                                    onPrimary: Color.fromARGB(255, 20, 133,
                                        161), //Color.fromARGB(255, 108, 8, 125),
                                  )),
                            ),
                            // TextButton(
                            //     child: Text("Add to cart".toUpperCase(),
                            //         style: TextStyle(fontSize: 14)),
                            //     style: ButtonStyle(
                            //         padding:
                            //             MaterialStateProperty.all<EdgeInsets>(
                            //                 EdgeInsets.all(15)),
                            //         foregroundColor:
                            //             MaterialStateProperty.all<Color>(
                            //                 Colors.red),
                            //         shape: MaterialStateProperty.all<
                            //                 RoundedRectangleBorder>(
                            //             RoundedRectangleBorder(
                            //                 borderRadius:
                            //                     BorderRadius.circular(18.0),
                            //                 side: BorderSide(
                            //                     color: Colors.red)))),
                            //     onPressed: () => null),
                          ],
                        ),
                      ],
                    ),
                  )

                  // child: ListTile(
                  //   // dense: true,
                  //   minVerticalPadding: 0,
                  //   contentPadding: EdgeInsets.all(0),
                  //   // minLeadingWidth: 100,
                  //   leading: Expanded(
                  //     child: Container(
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  //   // leading: Image.network(
                  //   //   "https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg",
                  //   //   fit: BoxFit.cover, height: 100,
                  //   //   width: 100,
                  //   //   // width: 200,
                  //   // ),
                  //   title: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text("A"),
                  //         ElevatedButton(
                  //           child: Text("Animal"),
                  //           onPressed: () {},
                  //           style: ElevatedButton.styleFrom(
                  //             primary: Color.fromARGB(255, 198, 126, 210),
                  //             onPrimary: Color.fromARGB(255, 108, 8, 125),
                  //             textStyle: TextStyle(
                  //                 fontSize: 15,
                  //                 fontWeight: FontWeight.normal),
                  //           ),
                  //         ),
                  //       ],
                  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly),
                  //   onTap: () {},
                  // ),
                  )),

          // child: ListView.builder(
          //   itemCount: 10,
          //   itemBuilder: (ctx, index) => Container(
          //     child: Text(
          //       "${index + 1}",
          //       style: TextStyle(fontSize: 150),
          //     ),
          //     color: (index + 1) % 2 == 0 ? Colors.amber : Colors.blueAccent,
          //     height: 100,
          //     width: 10,
          //   ),
          // ),

          // child: ListView(
          //   children: <Widget>[
          //     ...new List<int>.generate(10, (i) => i + 1)
          //         .map(
          //           (number) => Container(
          //             child: Text(
          //               "${number}",
          //               style: TextStyle(fontSize: 150),
          //             ),
          //             color:
          //                 (number % 2 == 0) ? Colors.amber : Colors.blueAccent,
          //             height: 100,
          //             width: 10,
          //           ),
          //         )
          //         .toList()
          //   ],
          // ),
        ));
  }
}

// present popup == Navigator.of(context).push(
              //   MaterialPageRoute(
              //     fullscreenDialog: true,
              //     builder: (ctx) => MainNewsScreen(),
              //   ),
              // );