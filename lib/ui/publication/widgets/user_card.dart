import 'package:flutter/material.dart';

class UserCard extends StatefulWidget {
  UserCard({Key key}) : super(key: key);

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('John'),
    );
  }
}