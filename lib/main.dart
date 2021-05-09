import 'package:flutter/material.dart';
import './userCall.dart';
import './expertPickCall.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserCall(), 
      debugShowCheckedModeBanner: false,
    );
  }
}
