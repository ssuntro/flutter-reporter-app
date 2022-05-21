import 'package:flutter/material.dart';
import 'package:news_app/news.dart';

class NewsPage extends StatelessWidget {
  static const routeName = 'news-page';
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context).settings.arguments ??
        <String, dynamic>{}) as Map;
    final model = arguments["news"] as News;
    return Scaffold(
      appBar: AppBar(
        title: Text("News detail"), //model == null ?  : model.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: Text(
                      model.title,
                      softWrap: true,
                      style: TextStyle(fontSize: 18),
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.calendar_month),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.ios_share),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: Icon(Icons.remove_circle),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent,
                            )),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                Text(model.body, softWrap: true),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
