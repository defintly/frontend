import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Collections extends StatelessWidget {

  final items = List<String>.generate(10, (i) => 'Item $i');

  Collections({Key? key}) : super(key: key);

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
          itemCount: (1),
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.school),
              title: Text("Intelligence",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text("Collection"),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            );
          },
        ),
      ),
    );
  }
}