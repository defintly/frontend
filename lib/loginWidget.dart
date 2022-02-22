import 'dart:convert';
import 'package:definitly_app/saveLoginData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:definitly_app/modals/login.dart';
import 'package:http/http.dart' as http;

import 'NavPages/collections.dart';
import 'modals/loginResult.dart';

class loginWidget extends StatefulWidget {
  @override
  State<loginWidget> createState() => _loginWidgetState();
}

class _loginWidgetState extends State<loginWidget> {
  final loginNameController = TextEditingController();
  final loginPasswordController = TextEditingController();
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
                controller: loginNameController,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.person),
                  hintText: "username or email",
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
                controller: loginPasswordController,
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
                      login(BuildContext);
                    },
                    icon: Icon(Icons.arrow_forward_sharp)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> login(BuildContext context) async {
    LoginResult result = new LoginResult(0, "", "");
    var client = http.Client();
    var userLogin =
        Login(loginNameController.text, loginPasswordController.text);
    var body = json.encode(userLogin.toJson());
    print(body);
    try {
      var response = await client.post(
          Uri.parse("https://defintly.knoblich.co/auth/login"),
          body: body);
      result = LoginResult.fromJson(json.decode(response.body));
    } catch(e){
      print(e);
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('error'),
            content: Text('something went wrong'),
          ));
    }
    finally {
      client.close();

    if (isChecked) {
      saveLoginData.write(result.sessionKey);
    }

      saveLoginData.key = result.sessionKey;

      if (result.sessionKey != "") {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text('welcome'),
                content: Text('you are now logged in'),
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
  }
  }
}
