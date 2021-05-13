import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ReviewDialog extends StatefulWidget {
  @override
  ReviewDialogState createState() => ReviewDialogState();
}

class ReviewDialogState extends State<ReviewDialog> {
  bool review = false;
  var rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5,
        sigmaY: 5,
      ),
      child: SimpleDialog(
        contentPadding: EdgeInsets.all(5),
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.close_sharp),
            alignment: Alignment.topRight,
            onPressed: () => Navigator.pop(context, true),
          ),
          Text(
            'Rate your experience',
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Your feedback is very helpful to us.',
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            'Tell us how we can improve.',
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: SmoothStarRating(
              rating: rating,
              isReadOnly: false,
              size: 40,
              filledIconData: Icons.star,
              halfFilledIconData: Icons.star_half,
              defaultIconData: Icons.star_border,
              starCount: 5,
              allowHalfRating: true,
              color: Colors.blue,
              borderColor: Colors.black,
              spacing: 2.0,
              onRated: (value) {
                print("rating value -> $value");
                // print("rating value dd -> ${value.truncate()}");
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Builder(
              builder: (context) {
                if (review)
                  return Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextField(
                            autocorrect: true,
                            decoration: InputDecoration(
                              hintText: 'Type Text Here...',
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                color: Colors.blue,
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 10),
                              child: Text(
                                'SUBMIT',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            onTap: () {
                              print('Submitted');
                            },
                          )
                        ],
                      ));
                else
                  return Container(
                    margin: EdgeInsets.all(10),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.sticky_note_2_sharp),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Write a review"),
                        ],
                      ),
                      onPressed: () {
                        print("RaisedButton clicked");
                        setState(
                          () {
                            review = true;
                          },
                        );
                      },
                    ),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}
