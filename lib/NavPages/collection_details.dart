import 'package:definitly_app/modals/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:definitly_app/data_api.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'concept_details.dart';

class CollectionDetails extends StatelessWidget {
  final Collection indexCollection;
  CollectionDetails(this.indexCollection);

  @override
  Widget build(BuildContext context) {
    var concepts = dataApi.getMatchingConcepts(indexCollection);
    return MaterialApp(
        title: indexCollection.collection,
        home: Scaffold(
            appBar: AppBar(
              title: Text(indexCollection.collection),
            ),
            body: ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: concepts.length,
              itemBuilder: (context, index) {
                return Card(
                    child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ConceptDetails(concepts[index])));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(concepts[index].author,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            width: MediaQuery.of(context).size.width * 0.8,
                          ),
                          Container(
                            child: Text(indexCollection.collection,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[800])),
                            width: MediaQuery.of(context).size.width * 0.8,
                          ),
                        ],
                      ),
                    ],
                  ),
                ));
              },
            ),
        ));
  }
}
