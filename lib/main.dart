import 'dart:io';

import 'package:covid19/Utils/ThemeChanger.dart';
import 'package:covid19/screen/ActivityScreen.dart';
import 'package:covid19/screen/DasboardScreen.dart';
import 'package:covid19/screen/HistoryScreen.dart';
import 'package:covid19/screen/LoginScreen.dart';
import 'package:covid19/screen/ProfileScreen.dart';
import 'package:covid19/screen/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  double getSmartBannerHeight(MediaQueryData mediaQuery) {
    // https://developers.google.com/admob/android/banner#smart_banners
    if (Platform.isAndroid) {
      if (mediaQuery.size.height > 720) return 90.0;
      if (mediaQuery.size.height > 400) return 50.0;
      return 32.0;
    }
    // https://developers.google.com/admob/ios/banner#smart_banners
    // Smart Banners on iPhones have a height of 50 points in portrait and 32 points in landscape.
    // On iPads, height is 90 points in both portrait and landscape.
    if (Platform.isIOS) {
      // TODO use https://pub.dartlang.org/packages/device_info to detect iPhone/iPad?
      // if (iPad) return 90.0;
      if (mediaQuery.orientation == Orientation.portrait) return 50.0;
      return 32.0;
    }
    // No idea, just return a common value.
    return 50.0;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Theme Provider',
            theme: light,
            home: SplaceScreen(),
            initialRoute: '/',
            routes: {
              '/splace-screen': (context) => SplaceScreen(),
              '/login': (context) => LoginScreen(),
              '/dashboard': (context) => DashboardScreen(),
              '/activity': (context) => ActivityScreen(),
              '/history': (context) => HistoryScreen(),
              '/profile': (context) => ProfileScreen(),
            },
            builder: (BuildContext context, Widget widget) {
              final mediaQuery = MediaQuery.of(context);
              return new Padding(
                child: widget,
                padding: new EdgeInsets.only(
                    bottom: getSmartBannerHeight(mediaQuery)),
              );
            },
          );
        },
      ),
    );
  }
}

//class MaterialAppWithTheme extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final theme = Provider.of<ThemeCanger>(context);
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      theme:  theme.getTheme(),
////      ThemeData(
////        scaffoldBackgroundColor: Colors.white,
////        fontFamily: 'OpenSans-Semibold',
////        primaryColor: Colors.cyan[900],
////        canvasColor: Colors.cyan[900],
////      ),
////      darkTheme: ThemeData(
////        brightness: Brightness.dark,
////        scaffoldBackgroundColor: Colors.black,
////        fontFamily: 'OpenSans-Semibold',
////      ),
//      home: SplaceScreen(),
//      initialRoute: '/',
//      routes: {
//        '/splace-screen': (context) => SplaceScreen(),
//        '/portal': (context) => page_portal(),
//        '/login': (context) => LoginPage(),
//        '/dashboard': (context) => BottomMenu(),
//      },
//    );
//  }
//}
