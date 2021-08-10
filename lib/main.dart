import 'package:flutter/material.dart';
import 'NavPages/home.dart';
import 'NavPages/all_criteria.dart';
import 'NavPages/collections.dart';
import 'NavPages/by_category.dart';
import 'NavPages/contact.dart';
import 'NavPages/define_it.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        unselectedItemColor: Colors.white54,
        unselectedLabelStyle: TextStyle(fontSize: 9),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_books),
            label: 'all Criteria',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.horizontal_split_rounded),
            label: 'categorys',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_open),
            label: 'Define It',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'collection',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_rounded),
            label: 'Contact',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
