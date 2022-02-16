import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:definitly_app/data_api.dart';
import 'package:definitly_app/modals/criteria.dart';
import 'package:definitly_app/NavPages/criteria_details.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:definitly_app/navigation.dart';
import 'package:definitly_app/search.dart';

class AllCriteria extends StatefulWidget {
  @override
  AllCriteriaState createState() => AllCriteriaState();
}

class AllCriteriaState extends State<AllCriteria> {
  //AllCriteria({Key? key}) : super(key: key);
  late List<Criteria> criteria;
  String query = "";

  @override
  void initState() {
    super.initState();
    criteria = dataApi.criteria;
  }

  @override
  Widget build(BuildContext context) {
    const title = 'All Criteria';
    return MaterialApp(
        title: title,
        home: Scaffold(
            drawer: NavigationDrawerWidget(),
            appBar: AppBar(
              title: Text("All Criteria"),
            ),
            body: Column(
              children: [
                buildSearch(),
                Expanded(
                  child: ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: criteria.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CriteriaDetails(criteria[index])));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      child: Text(
                                          criteria[index].quality_criterion,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.8,
                                      height: 30,
                                    ),
                                    Container(
                                      child: Text(
                                          criteria[index].description_short,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey[800])),
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.8,
                                      height: 40,
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
                  ),
                ),
              ],
            )));
  }

  Widget buildSearch() =>
      SearchWidget(
          text: query,
          hintText: "criteria",
          onChanged: searchCriteria
      );

  void searchCriteria(String query) {
    final criteriaList = dataApi.criteria.where((criterion) {
      final criterionLower = criterion.quality_criterion.toLowerCase();
      final searchLower = query.toLowerCase();

      return criterionLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.criteria = criteriaList;
    });
  }
}
