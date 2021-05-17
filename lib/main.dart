import 'package:flutter/material.dart';
import 'package:news_app/Color.dart';
import 'package:news_app/Splash/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primaryColor: Color(getColorHexFromStr('#1b3c69')),
    accentColor: Color(getColorHexFromStr('#F6F6F6'))
    ),
    home: SplashScreen());
  }
}
