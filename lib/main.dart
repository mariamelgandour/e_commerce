import 'package:e_commerce/splash.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: 'Pacifico',
      ),
      home: SplashScreen(),
      
    );
  }
}

