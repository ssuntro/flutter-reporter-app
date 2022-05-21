import 'package:flutter/material.dart';

class AddNewsPage extends StatelessWidget {
  static const routeName = '/add-news';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a news'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: Text(
                "dsadklfh;hf;afdsadklfh;hf;afdsadklfh;hf;afdsadklfh;hf;af",
                softWrap: true,
                style: TextStyle(fontSize: 18),
              )),
              ElevatedButton(
                onPressed: () {},
                child: Text("Add"),
              ),

              // Row(
              //   children: [
              //     IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              //     IconButton(onPressed: () {}, icon: Icon(Icons.abc))
              //   ],
              // )
            ],
          ),
          SizedBox(
            height: 100,
          ),
          // TextField( //textinput
          //   maxLines: 8,
          //   decoration:
          //       InputDecoration.collapsed(hintText: "Enter your text here"),
          // ),
          Text(
              "contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent",
              softWrap: true),
          SizedBox(
            height: 100,
          ),
          Row(
            children: [
              Text("url: ", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("djdjdjd.com")
            ],
          ),
          Row(
            children: [
              Text("Status: ", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("djdjdjd.com")
            ],
          ),
          Row(
            children: [
              Text("Category: ", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("djdjdjd.com")
            ],
          ),
        ],
      ),
      // body: Center(
      //   child: CircularProgressIndicator(),
      // )
    );
  }
}
