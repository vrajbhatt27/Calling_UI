import 'package:flutter/material.dart';
import 'dart:async';
import 'package:swipedetector/swipedetector.dart';

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

  String text;

  @override
  void initState() {
    super.initState();
    // ToDO: Add caller name here
    text = 'Tony Calling';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff023E8A).withOpacity(0.73), //Color(0xff89CFF0)
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 70,
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
            SizedBox(
              height: 20,
            ),
            DragTarget(
              builder: (context, candidateData, rejectedData) {
                return Container(
                  height: h,
                  width: w,
                  child: isDraggedUp
                      ? Phone(Colors.red, Colors.white)
                      : Icon(
                          Icons.keyboard_arrow_up_sharp,
                          color: Colors.red,
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
              },
            ),
            SizedBox(
              height: 50,
            ),
            Draggable(
              axis: Axis.vertical,
              child: dragOver
                  ? Container(
                      height: 50,
                    )
                  : Phone(Colors.white, Colors.black),
              feedback: Phone(Colors.white, Colors.black),
              childWhenDragging: Container(
                height: 40,
              ),
              onDragCompleted: () {
                print('Completed');
              },
            ),
            SizedBox(
              height: 50,
            ),
            DragTarget(
              builder: (context, candidateData, rejectedData) {
                return Container(
                  height: h,
                  width: w,
                  child: isDraggedDown
                      ? Phone(Colors.green, Colors.white)
                      : Icon(
                          Icons.arrow_downward,
                          color: Colors.green,
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
              },
            ),
          ],
        ),
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
