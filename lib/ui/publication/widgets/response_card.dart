import 'package:bookspace/models/comment.dart';
import 'package:flutter/material.dart';

class ResponseCard extends StatelessWidget {

  final Comment response;

  ResponseCard({
    Key key,
    this.response
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
       child: Container(
           padding: EdgeInsets.all(10),
            //color: Colors.blue[200],
            child: Text(
              response.content,
              style: TextStyle(),
            )
          )
    );
  }
}