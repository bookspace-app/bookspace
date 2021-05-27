import 'package:bookspace/app_localizations.dart';
import 'package:bookspace/controllers/publication_controller.dart';
import 'package:bookspace/controllers/user_controller.dart';
import 'package:bookspace/models/publication.dart';
import 'package:bookspace/models/user.dart';
import 'package:bookspace/ui/publication/widgets/publication_card.dart';
import 'package:bookspace/ui/search/widgets/user_search_card.dart';
import 'package:flutter/material.dart';
import 'package:bookspace/globals.dart' as globals;

class SearchView extends StatefulWidget {
  SearchView({Key key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  bool selectedPublis = true;
  List<Publication> _publications = [];
  List<User> _users = [];

  List<Publication> _selected = [];
  List<User> _selectedUsers = [];

  String query = '';

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

  // Call to get publications
  void getPublications([String genre]) async {
    // ignore: omit_local_variable_types
    List<Publication> publications = await PublicationController.getPublications(null, genre);
    
    if (!disposed){
      setState(() => _publications = publications);
      setState(() => _selected = _publications);
    }
  }

  // Call to get users
  void getUsers() async {
    // ignore: omit_local_variable_types
    List<User> users = await UserController.getAllusers();
    
    if (!disposed){
      setState(() => _users = users);
      setState(() => _selectedUsers = _users);
    }
  }

  void search(String text) {
    print('Searching $text...');
    // ignore: omit_local_variable_types
    // ignore: valid_regexps
    // Expression containing search query
    RegExp regExp = RegExp(r''+text+'', caseSensitive: false);
    if ((_publications != null) && selectedPublis) {
      // Temp array to store selected publis
      List<Publication> selected = [];
      if (text != '') {
        for (final publi in _publications){
          // If content or text has query add to selected
          if (regExp.hasMatch(publi.content) || regExp.hasMatch(publi.title)) {
            selected.add(publi);
          }
        }
        setState(() => _selected = selected);
      } else {
        setState(() => _selected = _publications);
      }
    } else if ((_users != null) && !selectedPublis) {
      // Temp array to store selected users
      List<User> selectedUsers = [];
      if (text != '') {
        for (final u in _users){
          // If username has query add to selected
          if (regExp.hasMatch(u.username)) {
            selectedUsers.add(u);
          }
        }
        setState(() => _selectedUsers = selectedUsers);
      } else {
        setState(() => _selectedUsers = _users);
      }
    }
  }

  @override
  void initState() { 
    super.initState();
    getPublications();
    getUsers();
  }

  bool disposed = false;
  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }
  
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
        child: Text(AppLocalizations.of(context).translate('publications')),
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
        child: Text(AppLocalizations.of(context).translate('users')),
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
                padding: (selectedPublis)
                ? EdgeInsets.only(top:10, bottom: 10, left:10)
                : EdgeInsets.all(10),
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
                    setState(() => query = text);
                    search(query);
                  },
                ),		
              ),
            ),
            (selectedPublis)
            ? Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(10),
                child: DropdownButton(
                  hint: Text(AppLocalizations.of(context).translate('filter')),
                  value: _selectedGenre,
                  onChanged: (newGenre) {
                    setState(() =>_selectedGenre = newGenre);
                    if (_selectedGenre == 'all') {
                      getPublications();
                      //await Future.delayed(Duration(milliseconds: 200));
                      search(query);
                    } else {
                      getPublications(_selectedGenre);
                      //await Future.delayed(Duration(milliseconds: 200));
                      search(query);
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
            ):Container()
            ]
          ),	
        ),
        
        // List of publications of users by genre
          Expanded(
            child: ListView(
              children: List.generate(
                (selectedPublis)
                ? _selected.length
                : _selectedUsers.length, (index) {
                return Column(
                  children: <Widget>[
                    Container(height: (index == 0) ? 10 : 0),
                    InkWell(
                      onTap: () {
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainView(
                              renderIndex: 'home',
                              view: PublicationView(
                                id: _publications[index].id,
                                isPublication: true,
                                //notifyOnRefresh: 
                              ),
                            )
                          )
                        );*/
                      },
                      child: (selectedPublis)
                      ? PublicationCard(
                        publication: _selected[index]
                      ) : UserSearchCard(
                        user: _selectedUsers[index]
                      ), // on tap llevar a la view de la publicacion
                    ), 
                    Divider() 
                  ]
                );
              })
            ),
          ),   
      ]
    );
  }
}