import 'package:flutter/material.dart';

class ExpertPickCall extends StatefulWidget {
  @override
  _ExpertPickCallState createState() => _ExpertPickCallState();
}

class _ExpertPickCallState extends State<ExpertPickCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Incoming Audio Call ...',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.purple,
              child: Text(
                'TS',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
									color: Colors.white,
                ),
              ),
            ),
						 Text(
              'Tony Stark',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
						 Text(
              '9898765444',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
					],
        ),
      ),
    );
  }
}
