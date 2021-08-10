import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ByCategory extends StatelessWidget {

  final items = List<String>.generate(10, (i) => 'Item $i');

  ByCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'All Criteria';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          itemCount: (items.length~/2),
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.chat_bubble),
              title: Text(items[(index*2)+1],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(items[(index*2)]),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            );
          },
        ),
      ),
    );
  }
}