import 'package:flutter/material.dart';

class PublicationCard extends StatefulWidget {
  PublicationCard({Key key}) : super(key: key);

  @override
  _PublicationCardState createState() => _PublicationCardState();
}

class _PublicationCardState extends State<PublicationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Text("Hello"),
    );
  }
}