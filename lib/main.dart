import 'package:definitly_app/data_api.dart';
import 'package:flutter/material.dart';
import 'NavPages/home.dart';
import 'NavPages/all_criteria.dart';
import 'NavPages/collections.dart';
import 'NavPages/by_category.dart';
import 'NavPages/contact.dart';
import 'NavPages/define_it.dart';
import 'data_api.dart';
import 'navigation.dart';

void main() => runApp(const Definitly());

class Definitly extends StatelessWidget {
  const Definitly({Key? key}) : super(key: key);

  static const String _title = 'Definitly';

  @override
  Widget build(BuildContext context) => MaterialApp(
      home: Scaffold(
          drawer: NavigationDrawerWidget(),
          body: FutureBuilder(
              future:
                  Future.wait([dataApi.loadLocalData(), dataApi.loadData()]),
              builder: (context, snapshot) {
                final allData = snapshot.data;
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

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  final screens = [
    Home(),
    AllCriteria(),
    ByCategory(),
    DefineIt(),
    Collections(),
    Contact()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screens[_selectedIndex],
      ),
    );
  }
}