import 'package:flutter/material.dart';
import 'dart:async';

class UserCall extends StatefulWidget {
  @override
  _UserCallState createState() => _UserCallState();
}

class _UserCallState extends State<UserCall> {
  var isMuted = false;
  var isSpeaker = false;
  int t = 0;
  var dot = '';

  String text;

  @override
  void initState() {
    super.initState();
    // ToDO: Add caller name here
    text = 'Calling tony';
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
      body: Center(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // ClipPath(
                //   child: Image.asset(
                //     "./assets/img.jpg",
                //     fit: BoxFit.cover,
                //     height: 600,
                //   ),
                //   clipper: BottomWaveClipper(),
                // ),
                ClipRRect(
                  child: Image.asset(
                    "./assets/img.jpg",
                    fit: BoxFit.cover,
                    height: 550,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                Positioned(
                  bottom: 70,
                  child: Center(
                    child: Text(
                      text + dot,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: isSpeaker ? Colors.black26 : null,
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                    border: Border.all(color: Colors.blueAccent, width: 3),
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
                    color: Colors.blueAccent,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                    border: Border.all(color: Colors.red, width: 3),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.call_end_sharp),
                    onPressed: () {},
                    color: Colors.red,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: isMuted ? Colors.black26 : null,
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                    border: Border.all(color: Colors.blueAccent, width: 3),
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
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
