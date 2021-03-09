import 'package:flutter/material.dart';

class ActivityView extends StatefulWidget {
  ActivityView({Key key}) : super(key: key);

  @override
  _ActivityViewState createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('Hello mentions'),
    );
  }
}