import 'package:bookspace/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:bookspace/globals.dart' as globals;

class SearchView extends StatefulWidget {
  SearchView({Key key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  bool selectedPublis = true;

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
  
  @override
  Widget build(BuildContext context) {

    Widget btnPublis = SizedBox(
      height: double.infinity,
      width: MediaQuery.of(context).size.width * 0.5,
      child: RaisedButton(
        color: selectedPublis? globals.primary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        onPressed: () {
          setState(() => selectedPublis = true);
        },
        child: Text(AppLocalizations.of(context).translate('all')),
      ),
    );

    

    Widget btnUsers = SizedBox(
      height: double.infinity,
      width: MediaQuery.of(context).size.width * 0.5,
      child: RaisedButton(
        color: !selectedPublis? globals.primary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        onPressed: () {
          setState(() => selectedPublis = false);
        },
        child: Text(AppLocalizations.of(context).translate('all')),
        /*onPressed: () {
          setState(() => sponsorized = true);
          getItems();

        },*/
      ),
    );

    Widget tabBar = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        btnPublis,
        btnUsers,
      ]
    );


    return Column (
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        // Tab bar to choose the entity to search upon
        SizedBox(
          height: 50,
          child: tabBar,
        ),
        // Search input bar
        Container(
          //color: Colors.yellow[200],
          child: Row( 
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(	
                //width: MediaQuery.of(context).size.width * 0.5,	
                padding: EdgeInsets.only(top:10, bottom: 10, left:10),
                child: TextField(
                  autofocus: true,
                  textAlignVertical: TextAlignVertical.center, 
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    hintStyle: TextStyle(
                      //fontWeight: FontWeight.bold, 
                      fontSize: 20,
                    ),
                    //hintText: AppLocalizations.of(context).translate("search-bar"),
                  ),
                  onChanged: (text) {
                    //addSugestion(text);
                    print("First text field: $text");
                  },
                ),		
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(10),
                child: DropdownButton(
                  hint: Text(AppLocalizations.of(context).translate('filter')),
                  value: _selectedGenre,
                  onChanged: (newGenre) {
                    setState(() =>_selectedGenre = newGenre);
                    if (_selectedGenre == 'all') {
                      //getPublications();
                    } else {
                      //getPublications(_selectedGenre);
                    }
                  },
                  items: _genres.map((genre) {
                    return DropdownMenuItem(
                      value: genre,
                      child: Text(AppLocalizations.of(context).translate(genre)),
                    );
                  }).toList(),
                ),
              )
            )
            ]
          ),	
        ),
        

        /*Expanded(
          child: CustomScrollView(
            slivers: <Widget>[
              ItemsGrid(items: items)
            ],
            
          ), 
        ), */     
      ]
    );
  }
}