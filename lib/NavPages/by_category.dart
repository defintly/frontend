import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:definitly_app/data_api.dart';
import 'package:definitly_app/modals/criteria.dart';
import 'package:definitly_app/NavPages/criteria_details.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

import 'category_details.dart';

class ByCategory extends StatelessWidget {
  ByCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'By Category';
    return MaterialApp(
        title: title,
        home: Scaffold(
            appBar: AppBar(
              title: Text("Collections"),
            ),
            body: ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: dataApi.categories.length,
              itemBuilder: (context, index) {
                return Card(
                    child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CategoryDetails(dataApi.categories[index])));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Markdown(
                            physics: NeverScrollableScrollPhysics(),
                            onTapLink: (text, url, title) async =>
                                {if (url != null) await launch(url)},
                            data: dataApi.categories[index].icon,
                            shrinkWrap: true,
                            styleSheet: MarkdownStyleSheet.fromTheme(ThemeData(
                                textTheme: TextTheme(
                                    bodyText2: TextStyle(fontSize: 30.0))))),
                        width: 60,
                        height: 60,
                      ),
                      Column(
                        children: [
                          Container(
                            child: Text(dataApi.categories[index].category,
                                style: TextStyle(
                                  fontSize: 20,
                                )),
                            width: MediaQuery.of(context).size.width * 0.7,
                          ),
                          Container(
                              child: Text(dataApi.categories[index].description,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey[800])),
                              width: MediaQuery.of(context).size.width * 0.7),
                        ],
                      ),
                      Container(
                          alignment: Alignment.topRight,
                          child: Icon(Icons.arrow_forward_ios))
                    ],
                  ),
                ));
              },
            )));
  }
}
