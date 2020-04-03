import 'package:covid19/widget/DashboardWidget/BodyWidget.dart';
import 'package:covid19/widget/DashboardWidget/HeaderWidget.dart';
import 'package:flutter/material.dart';

class KeluargaScreen extends StatelessWidget {
  KeluargaScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(top: 0, child: HeaderWidget()),
          Align(
            alignment: Alignment.bottomCenter,
            child: BodyWidget(),
          )
        ],
      ),
    );
  }
}
