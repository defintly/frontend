import 'package:flutter/material.dart';
import 'NavPages/all_criteria.dart';
import 'NavPages/collections.dart';
import 'NavPages/by_category.dart';
import 'NavPages/contact.dart';
import 'NavPages/login.dart';
import 'NavPages/define_it.dart';

class NavigationDrawerWidget extends StatelessWidget {
  Widget build(context) {
    return Drawer(
      child: Material(
        color: Colors.blue,
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 50),
            BuildMenuItem(
              text: 'Collections',
              icon: Icons.inventory,
              onClicked: () => SelectedItem(context, 0),
            ),
            BuildMenuItem(
              text: 'All Criteria',
              icon: Icons.my_library_books,
              onClicked: () => SelectedItem(context, 1),
            ),
            BuildMenuItem(
              text: 'Categories',
              icon: Icons.horizontal_split_rounded,
              onClicked: () => SelectedItem(context, 2),
            ),
            BuildMenuItem(
              text: 'About',
              icon: Icons.info_rounded,
              onClicked: () => SelectedItem(context, 3),
            ),
            BuildMenuItem(
              text: 'Login / Register',
              icon: Icons.person,
              onClicked: () => SelectedItem(context, 4),
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
          builder: (context) => Collections(),
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
          builder: (context) => Contact(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => login(),
        ));
        break;
    }
  }
}
