import 'package:flutter/material.dart';
import 'outgoing_audio_call_screen.dart';
import 'internal_audio_call_screen.dart';
import 'incoming_audio.dart';
import './incoming_video_call.dart';
import './outgoing_video_call_screen.dart';
import './internal_video_call_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VideoScreenOne(), 
      debugShowCheckedModeBanner: false,
    );
  }
}
