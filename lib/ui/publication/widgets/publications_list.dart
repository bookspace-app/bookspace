import 'package:bookspace/app_localizations.dart';
import 'package:bookspace/controllers/publication_controller.dart';
import 'package:bookspace/controllers/user_controller.dart';
import 'package:bookspace/models/publication.dart';
import 'package:bookspace/ui/main_view.dart';
import 'package:bookspace/ui/publication/publication_view.dart';
import 'package:bookspace/ui/publication/widgets/publication_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PublicationsList extends StatefulWidget {
  final int Userid;
  final String genre;

  PublicationsList({Key key, this.Userid, this.genre}) : super(key: key);

  @override
  _PublicationsListState createState() => _PublicationsListState();
}

class _PublicationsListState extends State<PublicationsList> {
  List<Publication> _publications = [];

  final List<String> _genres = [
    'all',
    'action',
    'adventure',
    'literary',
    'contemporary',
    'black',
    'historic',
    'horror',
    'romantic',
    'erotic',
    'poetry',
    'theater',
    'terror',
    'comic',
    'SciFi',
    'fantasy',
    'children',
    'economy',
    'kitchen',
    'comedy',
    'documentary',
    'drama',
    'suspense',
    'teen',
    'adult',
    'war',
    'crime',
    'sport',
    'history',
    'biography',
    'cops',
    'family',
    'western',
    'religion',
    'futurism',
    'other'
  ];
  String _selectedGenre;

  void getPublications([String genre]) async {
    // ignore: omit_local_variable_types
    List<Publication> publications =
        await PublicationController.getPublications(null, genre);

    if (!disposed) {
      setState(() => _publications = publications);
    }
  }

  void getfavPublications([String genre]) async {
    // ignore: omit_local_variable_types
    List<Publication> publications =
        await UserController.getPublications(widget.Userid);

    if (!disposed) {
      setState(() => _publications = publications);
    }
  }

  @override
  void initState() {
    super.initState();
    (widget.Userid == null) ? getPublications() : getfavPublications();
  }

  bool disposed = false;
  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  void refresh() async {
    // ignore: unawaited_futures
    Future.delayed(Duration(milliseconds: 1500)).then((_) async {
      // ignore: omit_local_variable_types
      List<Publication> publications =
          await PublicationController.getPublications();
      setState(() => _publications = publications);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_publications != null) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Filter to select publications by genre
            Container(
              width: double.infinity,
              // color: Colors.pink,
              child: Center(
                  // Widget with a dropdown menu to filter the
                  // displayed publications by genre
                  child: DropdownButton(
                hint: Text(AppLocalizations.of(context).translate('filter')),
                value: _selectedGenre,
                onChanged: (newGenre) {
                  setState(() => _selectedGenre = newGenre);
                  if (_selectedGenre == 'all') {
                    getPublications();
                  } else {
                    getPublications(_selectedGenre);
                  }
                },
                items: _genres.map((genre) {
                  return DropdownMenuItem(
                    value: genre,
                    child: Text(AppLocalizations.of(context).translate(genre)),
                  );
                }).toList(),
              )),
            ),
            // List of publications by genre
            Expanded(
              child: ListView(
                  children: List.generate(_publications.length, (index) {
                return Column(children: <Widget>[
                  Container(height: (index == 0) ? 10 : 0),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainView(
                                  renderIndex: 'home',
                                  view: PublicationView(
                                      id: _publications[index].id,
                                      isPublication: true,
                                      notifyOnRefresh: refresh),
                                )),
                      );
                    },
                    child: PublicationCard(
                        publication: _publications[index]), // on tap llevar a la view de la publicacion
                  ),
                  Divider()
                ]);
              })),
            ),
          ]);
    } else {
      return Center(
          child: Container(
        child: Text('No hay publis aun'),
      ));
    }
  }
}
