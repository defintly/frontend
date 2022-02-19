import 'package:definitly_app/modals/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:definitly_app/data_api.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../search.dart';
import 'concept_details.dart';
import 'package:definitly_app/navigation.dart';
import 'package:definitly_app/navigation.dart';
import 'package:definitly_app/modals/concept.dart';

class CollectionDetails extends StatefulWidget {
  final Collection indexCollection;
  CollectionDetails(this.indexCollection);
  @override
  CollectionDetailsState createState() => CollectionDetailsState(indexCollection);
}

class CollectionDetailsState extends State<CollectionDetails> {
  final Collection indexCollection;
  CollectionDetailsState(this.indexCollection);
  late List<Concept> concepts;
  String query = "";

  @override
  void initState() {
    super.initState();
    concepts = dataApi.getMatchingConcepts(indexCollection);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: indexCollection.collection,
        home: Scaffold(
            drawer: NavigationDrawerWidget(),
            appBar: AppBar(
              title: Text(indexCollection.collection),
            ),
            body: Column(
                children: [
                buildSearch(),
            Expanded(
              child:
                ListView.builder(
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
          hintText: "author",
          onChanged: searchCollections
      );

  void searchCollections(String query) {
    final conceptsList = dataApi.getMatchingConcepts(indexCollection).where((concept) {
      final conceptsLower = concept.author.toLowerCase();
      final searchLower = query.toLowerCase();

      return conceptsLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.concepts = conceptsList;
    });
  }
}
