import 'package:bookspace/ui/publication/widgets/publication_hero.dart';
import 'package:bookspace/ui/publication/widgets/response_card.dart';
import 'package:bookspace/ui/publication/widgets/user_card.dart';
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
    return ListView(
       children: <Widget>[
         PublicationHero(),
         UserCard(),
         for (var i = 0; i < 10; i++) Row(
           children: <Widget> [
             ResponseDart(),
             UserCard()
           ]
         )
       ],
    );
  }
}