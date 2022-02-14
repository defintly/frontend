import 'package:flutter/material.dart';
import 'NavPages/home.dart';
import 'NavPages/all_criteria.dart';
import 'NavPages/collections.dart';
import 'NavPages/by_category.dart';
import 'NavPages/contact.dart';
import 'NavPages/define_it.dart';


class NavigationDrawerWidget extends StatelessWidget{

  Widget build(context){
    return Drawer(
      child: Material(
        color: Colors.blue,
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 50),
            BuildMenuItem(
              text: 'Home',
              icon: Icons.menu_book,
              onClicked: () => SelectedItem(context, 0),
            ),
            BuildMenuItem(
              text: 'all Criteria',
              icon: Icons.my_library_books,
              onClicked: () => SelectedItem(context, 1),
            ),
            BuildMenuItem(
              text: 'categories',
              icon: Icons.horizontal_split_rounded,
              onClicked: () => SelectedItem(context, 2),
            ),
            BuildMenuItem(
              text: 'Define It',
              icon: Icons.lock_open,
              onClicked: () => SelectedItem(context, 3),
            ),
            BuildMenuItem(
              text: 'collection',
              icon: Icons.inventory,
              onClicked: () => SelectedItem(context, 4),
            ),
            BuildMenuItem(
              text: 'Contact',
              icon: Icons.mail_rounded,
              onClicked: () => SelectedItem(context, 5),
            ),
          ],
        ),
      ),
    );
  }

  Widget BuildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      onTap: onClicked,
    );
  }

  void SelectedItem(BuildContext context, index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
          Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Home(),
        ));
          break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AllCriteria(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ByCategory(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DefineIt(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Collections(),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Contact(),
        ));
        break;
    }
  }
}