import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'root.dart';
import 'authentication.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: Color.fromRGBO(100, 200, 235, .1),
      100: Color.fromRGBO(100, 200, 235, .2),
      200: Color.fromRGBO(100, 200, 235, .3),
      300: Color.fromRGBO(100, 200, 235, .4),
      400: Color.fromRGBO(100, 200, 235, .5),
      500: Color.fromRGBO(100, 200, 235, .6),
      600: Color.fromRGBO(100, 200, 235, .7),
      700: Color.fromRGBO(100, 200, 235, .8),
      800: Color.fromRGBO(100, 200, 235, .9),
      900: Color.fromRGBO(100, 200, 235, 1),
    };
    MaterialColor colorCustom = MaterialColor(0xFF64C8EB, color);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: colorCustom,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryTextTheme:
              TextTheme(headline6: TextStyle(color: Colors.white))),
      home: RootPage(auth:new Auth()),
    );
  }
}

