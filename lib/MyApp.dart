import 'package:catalog/LoginSignUpPage.dart';
import 'package:flutter/material.dart';

double screenHeight;
double screenWidth;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Catalog",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: LoginSignUpPage(),
    );
  }
}
