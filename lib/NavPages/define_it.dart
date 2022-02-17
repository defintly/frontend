import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:definitly_app/data_api.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:definitly_app/navigation.dart';

class DefineIt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            drawer: NavigationDrawerWidget(),
            appBar: AppBar(
              title: Text("Define It!"),
            ),
            body:
                ListView(physics: ScrollPhysics(), shrinkWrap: true, children: [
              Column(children: [
                Container(
                  child: Markdown(
                      physics: NeverScrollableScrollPhysics(),
                      onTapLink: (text, url, title) async =>
                          {if (url != null) await launch(url)},
                      data: dataApi.define_it,
                      shrinkWrap: true,
                      styleSheet: MarkdownStyleSheet.fromTheme(ThemeData(
                          textTheme: TextTheme(
                              bodyText2: TextStyle(fontSize: 15.0))))),
                ),
              ]),
            ])));
  }
}
