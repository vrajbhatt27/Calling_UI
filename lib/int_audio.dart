import 'package:flutter/material.dart';
import 'dart:async';

class InternalAudioCall extends StatefulWidget {
  @override
  _InternalAudioCallState createState() => _InternalAudioCallState();
}

class _InternalAudioCallState extends State<InternalAudioCall> {
  var isMuted = false;
  var isSpeaker = false;
  int seconds = 0;
  int minutes = 0;
  var hours = -1;
  String h, m, s;

  String text;

  @override
  void initState() {
    super.initState();
    // ToDO: Add caller name here
    text = 'Dr. Natasha';
    startTimer();
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        seconds++;
        if (seconds > 59) {
          minutes++;
          seconds = 0;
          if (minutes > 59) {
            hours++;
            minutes = 0;
            seconds = 0;
          }
        }

        if (seconds.toString().length == 1) {
          s = '0$seconds';
        } else {
          s = '$seconds';
        }

        if (minutes.toString().length == 1) {
          m = '0$minutes';
        } else {
          m = '$minutes';
        }

        if (hours > -1) {
          if (hours.toString().length == 1) {
            h = '0$hours:';
          } else {
            h = '$hours:';
          }
        } else {
          h = '';
        }

        // print("$h$m:$s");
      });
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
              "$h$m:$s",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            SizedBox(
              height: 250,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        onPressed: () {},
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
