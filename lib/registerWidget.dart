import 'dart:convert';
import 'package:definitly_app/saveLoginData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'NavPages/collections.dart';
import 'modals/loginResult.dart';
import 'modals/register.dart';

class registerWidget extends StatefulWidget {
  @override
  State<registerWidget> createState() => _registerWidgetState();
}

class _registerWidgetState extends State<registerWidget> {
  final registerNameController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  bool isChecked = false;

  Widget build(BuildContext) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 30),
        height: 400,
        width: 300,
        child: Column(
          children: [
            Container(
              child: TextField(
                controller: registerNameController,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.person),
                  hintText: "username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: TextField(
                controller: registerEmailController,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.mail),
                  hintText: "email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: TextField(
                controller: registerPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.vpn_key_sharp),
                  hintText: "password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Center(
                    child: Text("stay logged in:"),
                  ),
                ),
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                SizedBox(
                  width: 60,
                ),
                IconButton(
                    onPressed: () {
                      register(BuildContext);
                    },
                    icon: Icon(Icons.arrow_forward_sharp)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> register(BuildContext context) async {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(registerEmailController.text)) {
      LoginResult result = new LoginResult(0, "", "");
      var client = http.Client();
      var userRegister = Register(registerNameController.text,
          registerEmailController.text, registerPasswordController.text);
      var body = json.encode(userRegister.toJson());
      print(body);
      try {
        var response = await client.post(
            Uri.parse("https://defintly.knoblich.co/auth/register"),
            body: body);
        result = LoginResult.fromJson(json.decode(response.body));
      } catch (e) {
        print(e);
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text('error'),
                  content: Text('something went wrong'),
                ));
      } finally {
        client.close();
      }
      if (isChecked) {
        saveLoginData.write(result.sessionKey);
      }

      saveLoginData.key = result.sessionKey;

      if (result.sessionKey != "") {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text('welcome'),
                  content: Text('you are now registered'),
                ));
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Collections(),
        ));
      } else {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text('error'),
                  content: Text('something went wrong'),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text('error'),
                content: Text('no valid E-mail'),
              ));
    }
  }
}
