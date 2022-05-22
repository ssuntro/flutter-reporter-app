import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:news_app/news.dart';

class NewsPage extends StatelessWidget {
  static const routeName = 'news-page';

  Event buildEvent({News model, Recurrence recurrence}) {
    return Event(
      title: model.title,
      description: model.body,
      location: 'News app',
      startDate: DateTime.now(),
      endDate: DateTime.now().add(Duration(minutes: 30)),
      allDay: false,
      iosParams: IOSParams(
        reminder: Duration(minutes: 40),
      ),
      androidParams: AndroidParams(
        emailInvites: ["ann@ktbg.com"],
      ),
      recurrence: recurrence,
    );
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context).settings.arguments ??
        <String, dynamic>{}) as Map;
    final model = arguments["news"] as News;
    final onRemove = arguments["onRemove"] as Function(String);
    return Scaffold(
      appBar: AppBar(
        title: Text("News detail"),
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
                      model?.title ?? "",
                      softWrap: true,
                      style: TextStyle(fontSize: 18),
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: model == null
                              ? null
                              : () {
                                  Add2Calendar.addEvent2Cal(
                                    buildEvent(model: model),
                                  );
                                },
                          child: Icon(Icons.calendar_month),
                        ),
                        ElevatedButton(
                          onPressed: model == null ? null : () {},
                          child: Icon(Icons.ios_share),
                        ),
                        ElevatedButton(
                            onPressed: (model == null || onRemove == null)
                                ? null
                                : () {
                                    Navigator.of(context).pop();
                                    onRemove(model.title);
                                  },
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
                Text(model?.body ?? "", softWrap: true),
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
