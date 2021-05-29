import 'package:bookspace/ui/publication/widgets/publications_list.dart';
import 'package:flutter/material.dart';

class Favspub extends StatefulWidget {
  final int id;
  Favspub({Key key, this.id}) : super(key: key);

  @override
  _FavspubState createState() => _FavspubState();
}

class _FavspubState extends State<Favspub> {
  String _rendered = 'scifi';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: PublicationsList(Userid: widget.id, genre: _rendered))
      ],
    );
  }
}
