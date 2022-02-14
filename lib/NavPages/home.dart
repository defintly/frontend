import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:definitly_app/data_api.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:definitly_app/navigation.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          drawer: NavigationDrawerWidget(),
            appBar: AppBar(
              title: Text("Overview"),
            ),
            body:
                ListView(physics: ScrollPhysics(), shrinkWrap: true, children: [
              Column(children: [
                Container(
                  child: Markdown(
                      onTapLink: (text, url, title) async =>
                          {if (url != null) await launch(url)},
                      data: dataApi.overview,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      styleSheet: MarkdownStyleSheet.fromTheme(ThemeData(
                          textTheme: TextTheme(
                              bodyText2: TextStyle(fontSize: 15.0))))),
                ),
                Container(
                  child: Markdown(
                      onTapLink: (text, url, title) async =>
                          {if (url != null) await launch(url)},
                      data: dataApi.footer,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      styleSheet: MarkdownStyleSheet.fromTheme(ThemeData(
                          textTheme: TextTheme(
                              bodyText2: TextStyle(fontSize: 15.0))))),
                ),
                InkWell(
                  onTap: () async => await launch('http://agisi.org/news.html'),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.lightBlue[200],
                    ),
                    child: Text(
                      "Learn more",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.blue[900],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 40,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/bg-agisibanner.jpg",
                ),
                Card(
                    child: InkWell(
                  onTap: () async => await launch('http://agisi.org/'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("AGISI- The AGI Sertinal Initative",
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                            Text("AGISI.org",
                                style: TextStyle(
                                  fontSize: 15,
                                ))
                          ]),
                      Icon(Icons.link, color: Colors.blue)
                    ],
                  ),
                )),
                Card(
                    child: InkWell(
                  onTap: () async =>
                      await launch("mailto:contact@defintly.com"),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Contact",
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                            Text("contact@definitly.com",
                                style: TextStyle(
                                  fontSize: 15,
                                ))
                          ]),
                      Icon(Icons.email, color: Colors.blue)
                    ],
                  ),
                )),
                Image.asset(
                  "assets/agisiLOGO.webp",
                  height: 100,
                ),
              ])
            ])));
  }
}
