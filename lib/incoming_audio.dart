import 'package:flutter/material.dart';
import 'dart:async';
import 'package:swipedetector/swipedetector.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:animated_widgets/animated_widgets.dart';

class IncomingAudioCall extends StatefulWidget {
  @override
  _IncomingAudioCallState createState() => _IncomingAudioCallState();
}

class _IncomingAudioCallState extends State<IncomingAudioCall> {
  var isMuted = false;
  var isSpeaker = false;

  var isDraggedUp = false;
  var isDraggedDown = false;
  var dragOver = false;
  var h = 100.00;
  var w = double.infinity;
  int t = 0;
  var dot = '';

  String text;

  @override
  void initState() {
    super.initState();
    // ToDO: Add caller name here
    text = 'Tony Stark Calling';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 70,
          ),
          CircleAvatar(
            radius: 70,
            backgroundColor: Color(0xffFFFFFF).withOpacity(0.33),
            child: Text(
              'TS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            text + dot,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          SizedBox(
            height: 40,
          ),
          DragTarget(
            builder: (context, candidateData, rejectedData) {
              return Container(
                height: h,
                width: w,
                child: isDraggedUp
                    ? Phone(Colors.red, Colors.white)
                    : Column(
                        children: [
                          Icon(
                            SimpleLineIcons.arrow_up,
                            color: Colors.red,
                            size: 30,
                          ),
                          Icon(
                            SimpleLineIcons.arrow_up,
                            color: Colors.red,
                            size: 20,
                          ),
                        ],
                      ),
              );
            },
            onAccept: (data) {
              setState(() {
                isDraggedUp = true;
                dragOver = true;
                h = null;
                w = null;
              });
              print('Call End');
            },
          ),
          SizedBox(
            height: 50,
          ),
          ShakeAnimatedWidget(
            enabled: true,
            duration: Duration(milliseconds: 1500),
            shakeAngle: Rotation.deg(z: 40),
            curve: Curves.linear,
            child: Draggable(
              axis: Axis.vertical,
              child: dragOver
                  ? Container(
                      height: 120,
                    )
                  : Phone(Colors.white, Colors.black),

              feedback: Phone(Colors.white, Colors.black),
              childWhenDragging: Container(
                height: 40,
              ),
              // onDragCompleted: () {
              //   print('Completed');
              // },
            ),
          ),
          SizedBox(
            height: 75,
          ),
          DragTarget(
            builder: (context, candidateData, rejectedData) {
              return Container(
                height: h,
                width: w,
                child: isDraggedDown
                    ? Phone(Colors.green, Colors.white)
                    : Column(
                        children: [
                          Icon(
                            SimpleLineIcons.arrow_down,
                            color: Colors.green,
                            size: 20,
                          ),
                          Icon(
                            SimpleLineIcons.arrow_down,
                            color: Colors.green,
                            size: 30,
                          ),
                        ],
                      ),
              );
            },
            onAccept: (data) {
              setState(() {
                isDraggedDown = true;
                dragOver = true;
                h = null;
                w = null;
              });
              print('Call End');
            },
          ),
        ],
      ),
    );
  }
}

class Phone extends StatelessWidget {
  final color;
  final btnColor;
  Phone(this.color, this.btnColor);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Material(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
            color: color,
          ),
          child: IconButton(
            icon: Icon(Icons.call),
            onPressed: () {},
            color: btnColor,
          ),
        ),
      ),
    );
  }
}
