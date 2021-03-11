import 'package:bookspace/ui/publication/widgets/publication_card.dart';
import 'package:flutter/material.dart';

class PublicationsList extends StatefulWidget {

  final String genre;

  PublicationsList({
    Key key,
    this.genre
  }) : super(key: key);

  @override
  _PublicationsListState createState() => _PublicationsListState();
}

class _PublicationsListState extends State<PublicationsList> {

  // TODO: publications list
  // List<Publication> _publications = [];
  List<int> _dummyPublications = [0,1,2,3,4,5];

  void getPublications(String genre) async {
    // TODO: backend get publis
    // List<Publications> publications = await PublicationService.get ....(genre)

    // setState(() => _publications = publications);
  }


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(_dummyPublications.length, (index) {
        return Column(
          children: <Widget>[
            InkWell(
              child: PublicationCard(),
              onTap: () => {},
            ), 
            Divider()
          ]
        );
      })
    );
  }
}