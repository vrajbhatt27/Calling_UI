import 'package:flutter/material.dart';
import 'out_audio.dart';
import 'int_audio.dart';
import 'incoming_audio.dart';
import './expertPickCall.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IncomingAudioCall(), 
      debugShowCheckedModeBanner: false,
    );
  }
}
