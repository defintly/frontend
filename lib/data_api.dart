import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:definitly_app/modals/all_data.dart';

class dataApi{
  static Future<AllData> getData() async{
    final response = await http.get(Uri.parse("https://www.json-generator.com/api/json/get/cfOcoaGvkO?indent=2"));
    print("1");
    var t = response.body.toString();
    print("2");
    final data = json.decode(t);
    print("3");
    var parse = AllData.fromJson(data);
    return parse;
  }
}

/*
    var trans = parsed.map((e) => Category.fromJson(e as Map<String, dynamic>)).toList();
        final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
        (e) => Category.fromJson(e as Map<String, dynamic>)).toList();


          @override
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(
    body: FutureBuilder<AllData>(
      future: dataApi.getData(),
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
              return buildCategorys(allData);
            }
        }
      },
    ),
  )
  );

  Widget buildCategorys(AllData allData) => ListView.builder(
    physics: BouncingScrollPhysics(),
    itemCount: allData.categorys.length,
    itemBuilder: (context, index) {

      return ListTile(
        title: Text(allData.categorys[0].category),
        subtitle: Text(allData.categorys[0].discription),
      );
    },
  );
 */