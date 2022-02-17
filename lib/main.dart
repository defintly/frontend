import 'package:definitly_app/data_api.dart';
import 'package:flutter/material.dart';
import 'NavPages/collections.dart';
import 'data_api.dart';
import 'navigation.dart';

void main() => runApp(const Definitly());

class Definitly extends StatelessWidget {
  const Definitly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
      home: Scaffold(
          drawer: NavigationDrawerWidget(),
          body: FutureBuilder(
              future:
                  Future.wait([dataApi.loadLocalData(), dataApi.loadData()]),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  default:
                    if (snapshot.hasError) {
                      print(snapshot.error);
                      return Center(child: Text('Some error occurred!'));
                    } else {
                      return Collections();
                    }
                }
              })));
}