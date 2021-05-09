import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import './circle_painter.dart';
import './curve_wave.dart';

class ExpertPickCall extends StatefulWidget {
  @override
  _ExpertPickCallState createState() => _ExpertPickCallState();
}

class _ExpertPickCallState extends State<ExpertPickCall>
    with TickerProviderStateMixin {
  var size = 80.0;
  var color = Colors.blue[900];
  AnimationController _controller;

  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _button() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: <Color>[color, Color.lerp(color, Colors.black, .05)],
            ),
          ),
          child: ScaleTransition(
            scale: Tween(begin: 0.95, end: 1.0).animate(
              CurvedAnimation(
                parent: _controller,
                curve: const CurveWave(),
              ),
            ),
            child: CircleAvatar(
              radius: 50,
              child: Text(
                'TS',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Container(
          //   height: double.infinity,
          //   width: double.infinity,
          //   child: Opacity(
          //       opacity: 0.5,
          //       child: Image.asset(
          //         "./assets/img.jpg",
          //         fit: BoxFit.cover,
          //       )),
          // ),
          Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  'Incoming Audio Call ...',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                CustomPaint(
                  painter: CirclePainter(
                    _controller,
                    color: color,
                  ),
                  child: SizedBox(
                    width: size * 3.125,
                    height: size * 3.125,
                    child: _button(),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Tony Stark',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '9898765444',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
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
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        border: Border.all(color: Colors.green, width: 3),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.call),
                        onPressed: () {},
                        color: Colors.green,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
