import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:definitly_app/navigation.dart';
import 'package:definitly_app/loginWidget.dart';

import '../registerWidget.dart';

class login extends StatefulWidget {
  @override
  loginState createState() => loginState();
}

class loginState extends State<login> {
  Widget displayedWidget = loginWidget();
  var loginColor = Colors.blue;
  var registerColor = Colors.grey;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Authentification",
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          drawer: NavigationDrawerWidget(),
          appBar: AppBar(
            title: Text("Authentification"),
          ),
          body: ListView(
            physics: ScrollPhysics(),
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () => switchToLoginWidget(loginWidget()),
                            child: Text("login"),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(loginColor)
                          ),
                          ),
                        SizedBox(
                          width: 30,
                        ),
                        ElevatedButton(
                          onPressed: () => switchToRegisterWidget(registerWidget()),
                          child: Text("register"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(registerColor)
                          ),
                        )
                      ],
                    ),
                  ),
                  displayedWidget,
                ],
              ),
          ),
        );
  }

  void switchToLoginWidget(Widget updatedWidget) {
    setState(() {
      loginColor = Colors.blue;
      registerColor = Colors.grey;
      displayedWidget = updatedWidget;
    });
  }

  void switchToRegisterWidget(Widget updatedWidget) {
    setState(() {
      registerColor = Colors.blue;
      loginColor = Colors.grey;
      displayedWidget = updatedWidget;
    });
  }
}
