import 'package:flutter/material.dart';
import 'package:covid19/widget/Login/LoginWidget.dart';

class LoginScreen2 extends StatelessWidget {
  LoginScreen2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: LoginWidget(
          primaryColor: Color(0xFF4aa0d5),
          backgroundColor: Colors.white,
          backgroundImage: new AssetImage("assets/full-bloom.png"),
        ),
      ),
    );
  }
}
