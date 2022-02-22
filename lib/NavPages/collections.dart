import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:definitly_app/data_api.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:definitly_app/navigation.dart';
import 'package:definitly_app/modals/collection.dart';
import 'package:definitly_app/search.dart';

import 'collection_details.dart';

class Collections extends StatefulWidget {
  @override
  CollectionsState createState() => CollectionsState();
}

class CollectionsState extends State<Collections> {
  late List<Collection> collections;
  String query = "";

  @override
  void initState() {
    super.initState();
    collections = dataApi.collections;
  }

  @override
  Widget build(BuildContext context) {
    const title = 'Collections';
    return MaterialApp(
        title: title,
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            drawer: NavigationDrawerWidget(),
            appBar: AppBar(
              title: Text("Collections"),
            ),
            body: Column(
              children: [
                buildSearch(),
                Expanded(
            child: ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: collections.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CollectionDetails(collections[index])));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Markdown(
                                physics: NeverScrollableScrollPhysics(),
                                onTapLink: (text, url, title) async =>
                                    {if (url != null) await launch(url)},
                                data: collections[index].icon,
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
                                  child: Text(collections[index].collection,
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
                ),),
              ],
            )));
  }

  Widget buildSearch() =>
      SearchWidget(
          text: query,
          hintText: "collection",
          onChanged: searchCollections
      );

  void searchCollections(String query) {
    final collectionsList = dataApi.collections.where((collection) {
      final collectionsLower = collection.collection.toLowerCase();
      final searchLower = query.toLowerCase();

      return collectionsLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.collections = collectionsList;
    });
  }
}
