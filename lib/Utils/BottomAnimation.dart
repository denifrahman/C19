import 'package:covid19/screen/KeluargaScreen.dart';
import 'package:covid19/widget/DataDiri/DataDiri.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:covid19/screen/BookingScreen.dart';
import 'package:covid19/screen/DasboardScreen.dart';
import 'package:covid19/screen/HistoryScreen.dart';
import 'package:covid19/screen/KebutuhanScreen.dart';
import 'package:covid19/screen/ProfileScreen.dart';
import 'package:route_transitions/route_transitions.dart';

class BottomAnimateBar extends StatefulWidget {
  @override
  _BottomAnimateBarState createState() => _BottomAnimateBarState();
}

class _BottomAnimateBarState extends State<BottomAnimateBar> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    DashboardScreen(),
    KeluargaScreen(),
    KebutuhanScreen(),
    ProfileScreen(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = DashboardScreen(); // Our first view in viewport

  _openBoodking() {
    Navigator.of(context).push(PageRouteTransition(
        animationType: AnimationType.slide_up,
        builder: (context) => BookingScreen()));
  }

  Future<bool> _onWillPop() {
    if (currentTab == 0) {
      return showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Anda yakin!'),
              content: Text('Ingin keluar dari aplikasi?'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('No'),
                ),
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  /*Navigator.of(context).pop(true)*/
                  child: Text('Yes'),
                ),
              ],
            ),
          ) ??
          false;
    } else {
      setState(() {
        currentScreen = DashboardScreen();
        currentTab = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),

//        floatingActionButton: Container(
//          margin: EdgeInsets.only(top: 20),
//          child: FloatingActionButton(
//            tooltip: 'Booking',
//            backgroundColor: Colors.red[600],
//            foregroundColor: Colors.redAccent,
//            heroTag: Text('Book'),
//            child: Icon(
//              FontAwesomeIcons.stethoscope,
//              color: Colors.white,
//              size: 24,
//            ),
//            onPressed: () => _openBoodking(),
//          ),
//        ),
//        backgroundColor: Colors.grey[100],
//        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
//          shape: CircularNotchedRectangle(),
          notchMargin: 3,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MaterialButton(
                  minWidth: 30,
                  onPressed: () {
                    setState(() {
                      currentScreen =
                          DashboardScreen(); // if user taps on this dashboard tab will be active
                      currentTab = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.newspaper,
                        size: 18,
                        color: currentTab == 0
                            ? Colors.red[600]
                            : Colors.grey[700],
                      ),
                      Text(
                        'News',
                        style: TextStyle(
                          fontSize: 11,
                          color: currentTab == 0
                              ? Colors.red[600]
                              : Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 30,
                  onPressed: () {
                    setState(() {
                      currentScreen =
                          KeluargaScreen(); // if user taps on this dashboard tab will be active
                      currentTab = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.houseUser,
                        size: 18,
                        color: currentTab == 1
                            ? Colors.red[600]
                            : Colors.grey[700],
                      ),
                      Text(
                        'Keluarga',
                        style: TextStyle(
                          fontSize: 11,
                          color: currentTab == 1
                              ? Colors.red[600]
                              : Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 30,
                  onPressed: () {
                    setState(() {
                      currentScreen =
                          KebutuhanScreen(); // if user taps on this dashboard tab will be active
                      currentTab = 2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.boxOpen,
                        size: 18,
                        color: currentTab == 2
                            ? Colors.red[600]
                            : Colors.grey[700],
                      ),
                      Text(
                        'Kebutuhan',
                        style: TextStyle(
                          fontSize: 11,
                          color: currentTab == 2
                              ? Colors.red[600]
                              : Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 30,
                  onPressed: () {
                    setState(() {
                      currentScreen =
                          ProfileScreen(); // if user taps on this dashboard tab will be active
                      currentTab = 3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.person,
                        size: 18,
                        color: currentTab == 3
                            ? Colors.red[600]
                            : Colors.grey[700],
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 11,
                          color: currentTab == 3
                              ? Colors.red[600]
                              : Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
