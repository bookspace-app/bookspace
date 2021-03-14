import 'package:flutter/material.dart';

class PublicationHero extends StatefulWidget {
  PublicationHero({Key key}) : super(key: key);

  @override
  _PublicationHeroState createState() => _PublicationHeroState();
}

class _PublicationHeroState extends State<PublicationHero> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('hero'),
    );
  }
}