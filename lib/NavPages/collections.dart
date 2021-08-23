import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:definitly_app/data_api.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

import 'collection_details.dart';

class Collections extends StatelessWidget {
  Collections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'By Collections';
    return MaterialApp(
        title: title,
        home: Scaffold(
            appBar: AppBar(
              title: Text("By Collections"),
            ),
            body: ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: dataApi.collections.length,
              itemBuilder: (context, index) {
                return Card(
                    child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CollectionDetails(dataApi.collections[index])));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Markdown(
                            physics: NeverScrollableScrollPhysics(),
                            onTapLink: (text, url, title) async =>
                                {if (url != null) await launch(url)},
                            data: dataApi.collections[index].icon,
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
                              child: Text(dataApi.collections[index].collection,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ))),
                          Container(
                              child: Text("Collection",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey[800]))),
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
