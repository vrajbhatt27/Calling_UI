// This file is for outgoing video file at user side.

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:async';

class OutgoingVideoCall extends StatefulWidget {
  @override
  _OutgoingVideoCallState createState() => _OutgoingVideoCallState();
}

class _OutgoingVideoCallState extends State<OutgoingVideoCall> {
  var isMuted = false;
  var isSpeaker = false;
  var isVideoCall = false;
  int t = 0;
  var dot = '';

  String text;

  @override
  void initState() {
    super.initState();
    // ToDO: Add expert name here-------------------------------------------------------
    text = 'Dr. Natasha';
    Timer.periodic(Duration(seconds: 1), (timer) {
      effect(t);
      t = (t + 1) % 4;
    });
  }

  void effect(int t) {
    setState(() {
      if (t < 3) {
        dot = dot + '.';
      } else {
        dot = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff023E8A).withOpacity(0.73), //Color(0xff89CFF0)
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  height: 150,
                  width: 150,
									// Todo: Add Expert profile image here.--------------------------
                  child: Image.asset(
                    "./assets/doctor.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            Text(
              'Ringing' + dot,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            SizedBox(
              height: 250,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: isSpeaker
                            ? Colors.white
                            : Color(0xffFFFFFF).withOpacity(0.33),
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        // border: Border.all(color: Colors.black87, width: 3),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.campaign),
                        onPressed: () {
                          setState(() {
                            if (isSpeaker) {
                              isSpeaker = false;
                            } else {
                              isSpeaker = true;
                            }
                          });
													// Todo: Add the speaker on/off functionality here.------------
                        },
                        color: isSpeaker ? Colors.black : Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Speaker',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: isVideoCall
                            ? Colors.white
                            : Color(0xffFFFFFF).withOpacity(0.33),
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        // border: Border.all(color: Colors.black87, width: 3),
                      ),
                      child: IconButton(
                        icon: isVideoCall
                            ? Icon(MaterialCommunityIcons.video)
                            : Icon(MaterialCommunityIcons.video_off),
                        onPressed: () {
                          setState(() {
                            if (isVideoCall) {
                              isVideoCall = false;
                            } else {
                              isVideoCall = true;
                            }
                          });
													// Todo: Add the video on/off functionality here.------
                        },
                        color: isVideoCall ? Colors.black : Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      isVideoCall?'video Off':'Video On',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: isMuted
                            ? Colors.white
                            : Color(0xffFFFFFF).withOpacity(0.33),
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(isMuted ? Icons.mic_off : Icons.mic),
                        onPressed: () {
                          setState(() {
                            if (isMuted) {
                              isMuted = false;
                            } else {
                              isMuted = true;
                            }
                          });
													// Todo: add the mute on/off functionality here.------------
                        },
                        color: isMuted ? Colors.black : Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Mute',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        color: Colors.red,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.call_end_sharp),
                        onPressed: () {
													// Todo: add the end call fucntionality here------------------
												},
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'End',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
