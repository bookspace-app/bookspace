import 'package:flutter/material.dart';

class PublicationView extends StatefulWidget {
  final int id;
  PublicationView({
    Key key,
    this.id
  }) : super(key: key);

  @override
  _PublicationViewState createState() => _PublicationViewState();
}

class _PublicationViewState extends State<PublicationView> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('hi'),
    );
  }
}