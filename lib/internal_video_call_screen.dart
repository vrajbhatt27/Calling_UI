import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import './dialog.dart';

class VideoScreenOne extends StatefulWidget {
  @override
  _VideoScreenOneState createState() => _VideoScreenOneState();
}

class _VideoScreenOneState extends State<VideoScreenOne> {
  var buttonBackgroundColor = Colors.white;

  var soundIcon = Icons.volume_up;
  var soundIconOpacity = 1.0;
  var soundIconColor = Colors.black;

  var videoIcon = Icons.videocam;
  var videoIconOpacity = 1.0;
  var videoIconColor = Colors.black;

  var micIcon = Icons.mic;
  var micIconOpacity = 1.0;
  var micIconColor = Colors.black;

  var rating = 0.0;
  var review = false;

  int seconds = 0;
  int minutes = 0;
  var hours = -1;
  String h = '', m = '', s = '';
  var canShowTimer = false;

  @override
  void initState() {
    super.initState();
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
          m = '0$minutes:';
        } else {
          m = '$minutes:';
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

  void showTimer() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        canShowTimer = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    showTimer();
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
						// Todo: add the expert image here-------------------------------------------
            image: NetworkImage(
              'https://www.cdc.gov/diabetes/images/library/spotlights/Male-doctor-smiling-portrait-close-up-Med-Res-72991363.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    canShowTimer
                        ? Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[700],
                                  offset: new Offset(2.0, 2.0),
                                  blurRadius: 5.0,
                                )
                              ],
                            ),
                            child: Text(
                              "$h$m$s",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        : Container(),
                    Container(
                      height: 150,
                      width: 100,
                      // color: Colors.teal[100],
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
												// Todo: add the user image here.----------------------------
                        image: DecorationImage(
                          image: AssetImage("assets/person.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: null /* add child content here */,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                if (soundIcon == Icons.volume_up) {
                                  soundIcon = Icons.volume_off;
                                  soundIconOpacity = 0.5;
                                  soundIconColor = Colors.white;
                                } else {
                                  soundIcon = Icons.volume_up;
                                  soundIconOpacity = 1;
                                  soundIconColor = Colors.black;
                                }
                              });
															// Todo: add the speaker on/off icon here.-----------------
                            },
                            color: buttonBackgroundColor
                                .withOpacity(soundIconOpacity),
                            textColor: soundIconColor,
                            child: Icon(
                              soundIcon,
                            ),
                            padding: EdgeInsets.all(16),
                            shape: CircleBorder(),
                          ),
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                if (videoIcon == Icons.videocam) {
                                  videoIcon = Icons.videocam_off;
                                  videoIconOpacity = 0.5;
                                  videoIconColor = Colors.white;
                                } else {
                                  videoIcon = Icons.videocam;
                                  videoIconOpacity = 1;
                                  videoIconColor = Colors.black;
                                }
                              });
															// Todo: add the video on/off here
                            },
                            color: buttonBackgroundColor
                                .withOpacity(videoIconOpacity),
                            textColor: videoIconColor,
                            child: Icon(
                              videoIcon,
                            ),
                            padding: EdgeInsets.all(16),
                            shape: CircleBorder(),
                          ),
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                if (micIcon == Icons.mic) {
                                  micIcon = Icons.mic_off;
                                  micIconOpacity = 0.5;
                                  micIconColor = Colors.white;
                                } else {
                                  micIcon = Icons.mic;
                                  micIconOpacity = 1;
                                  micIconColor = Colors.black;
                                }
                              });
															// todo: add the mic on/off here.-------------------
                            },
                            color: buttonBackgroundColor
                                .withOpacity(micIconOpacity),
                            textColor: micIconColor,
                            child: Icon(
                              micIcon,
                            ),
                            padding: EdgeInsets.all(16),
                            shape: CircleBorder(),
                          ),
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ReviewDialog();
                                },
                              );
                            },
                            color: Colors.red,
                            textColor: Colors.white,
                            child: Icon(
                              Icons.call_end,
                            ),
                            padding: EdgeInsets.all(16),
                            shape: CircleBorder(),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Speaker',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Video',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Mute',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'End Call',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
