import 'package:bookspace/controllers/publication_controller.dart';
import 'package:bookspace/models/publication.dart';
import 'package:bookspace/ui/main_view.dart';
import 'package:bookspace/ui/publication/publication_view.dart';
import 'package:bookspace/ui/publication/widgets/publication_card.dart';
import 'package:flutter/foundation.dart';
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
  List<Publication> _publications = [];
  // List<int> _dummyPublications = [0,1,2,3,4,5];

  void getPublications(String genre) async {
    // TODO: backend get publis
    List<Publication> publications = await PublicationController.getPublications();
    
    if (!disposed){
      setState(() => _publications = publications);
    }
  }

  @override
  void initState() { 
    super.initState();
    getPublications('LOVE');
  }

  bool disposed = false;
  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_publications != null) {
      return ListView(
        children: List.generate(_publications.length, (index) {
          return Column(
            children: <Widget>[
              Container(height: (index == 0)?10:0),
              InkWell(
                child: PublicationCard(
                  publication: _publications[index]
                ),
                onTap: () {
                  Navigator.push(
                    context, // TODO: pass id to PublicationView
                    MaterialPageRoute(
                      builder: (context) => MainView(
                        renderIndex: 'home',
                        view: PublicationView(
                          id: _publications[index].id,
                          isPublication: true,
                        ),
                      )
                    ),
                  );
                }, // on tap llevar a la view de la publicacion
              ), 
              Divider() 
            ]
          );
        })
      );
    } else {
      return Container(
       child: Text('No hay publis aun'),
      );
    }
  }
}