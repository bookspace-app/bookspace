import 'package:bookspace/ui/publication/widgets/publications_list.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  final int id;
  HomeView({Key key, this.id}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _rendered = 'scifi';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: PublicationsList(Userid: null, genre: _rendered))
      ],
    );
  }
}
