import 'dart:ffi';

import 'package:bookspace/app_localizations.dart';
import 'package:bookspace/ui/activity/activity_view.dart';
import 'package:bookspace/ui/chat/chat_list_view.dart';
import 'package:bookspace/ui/home/home_view.dart';
import 'package:bookspace/ui/profile/config_view.dart';
import 'package:bookspace/ui/profile/edit_profile_view.dart';
import 'package:bookspace/ui/profile/favspub.dart';
import 'package:bookspace/ui/profile/profile_view.dart';
import 'package:bookspace/ui/publication/create_publication_view.dart';
import 'package:bookspace/ui/publication/edit_publication.dart';
import 'package:bookspace/ui/publication/publication_view.dart';
import 'package:bookspace/ui/search/search_view.dart';
import 'package:bookspace/ui/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:bookspace/globals.dart' as globals;

class MainView extends StatefulWidget {
  final String renderIndex;
  Widget view;
  final int id;

  MainView({Key key, this.renderIndex, this.view, this.id}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  String _rendered = 'home';
  Map<String, Widget> _views = {
    'home': HomeView(),
    'chatList': ChatListView(),
    'createPublication': CreatePublicationView(),
    'activity': ActivityView(),
    'profile': ProfileView(),
    'search': SearchView(),
  };

  @override
  void initState() {
    super.initState();
    if (widget.renderIndex != null) {
      setState(() {
        _rendered = widget.renderIndex;
      });
    }
  }

  dynamic changeView(String newView) async {
    String _old_rendered = _rendered;
    var _old_route = ModalRoute.of(context);
    var _new_route;
    /*setState(() {
      _rendered = newView;
      if (_rendered == "createPublication") {
        print(widget.id);
        widget.view = CreatePublicationView(id: widget.id);
      } else if (_rendered == "profile") {
        print(widget.id);
        print(globals.id);
        widget.view = ProfileView(id: widget.id);
      } else if (_rendered == "home") {
        widget.view = HomeView(id: widget.id);
      } else if (_rendered == "chatList") {
        widget.view = ChatListView(id: widget.id);
      } else if (_rendered == "activity") {
        widget.view = ActivityView(id: widget.id);
      }
      _new_route = ModalRoute.of(context);
    });*/
    setState(() {
      _rendered = newView;
      widget.view = _views[_rendered];
      _new_route = ModalRoute.of(context);
    });
    print(widget.id);
    print('OLD VIEW: $_old_rendered, ${_old_route.settings.name}');
    print('NEW VIEW: $_rendered, ${_new_route.settings.name}');
    await Future.delayed(Duration(milliseconds: 200));
    if (_old_rendered == _rendered) {
      Navigator.popUntil(context, ModalRoute.withName('/'));
    } else {
      //if (level != 1) {
      //  Navigator.popUntil(context, ModalRoute.withName('/'));
      //  Navigator.pushNamed(context, '/$_rendered');
      //}
    }
    /*
    if ((_old_rendered != _rendered) || (_rendered != 'home')) {
      Navigator.pushNamed(context, '/$_rendered');
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            AppLocalizations.of(context).translate('$_rendered').toString()),
        backgroundColor: Colors.white,
        leadingWidth: 100,
        leading: Image.asset('./assets/images/logo.png',
            fit: BoxFit
                .fitHeight), //TO-DO: Hacer mas grande el logo de la AppBar
        actions: (_rendered == "profile")
            ? [
                PopupMenuButton<String>(onSelected: (value) {
                  if (value == "Editar perfil") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfileView()),
                    );
                  } else if (value == "Configuration") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ConfigView()),
                    );
                  } else if (value == "Publicaciones favoritas") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainView(
                                renderIndex: 'home',
                                view: Favspub(id: globals.id),
                              )),
                    );
                  }
                }, itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Icon(Icons.edit),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(AppLocalizations.of(context)
                                .translate("editProfile")),
                          )
                        ],
                      ),
                      value: "Editar perfil",
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Icon(Icons.brightness_low_rounded),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            //child: Text(AppLocalizations.of(context)
                            //    .translate("configuration")),
                            child: Text("Configuration"),
                          )
                        ],
                      ),
                      value: "Configuration",
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Icon(Icons.remove_red_eye),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            /*child: Text(AppLocalizations.of(context)
                                .translate("favPubs")), */
                            child: Text("Favorites"),
                          )
                        ],
                      ),
                      value: "Publicaciones favoritas",
                    ),
                  ];
                }),
              ]
            : ((_rendered == 'home')
                ? [
                    IconButton(
                      icon: Icon(Icons.search),
                      color: globals.secondary,
                      onPressed: () {
                        changeView('search');
                      },
                    )
                  ] //
                : null),
      ),
      body: widget.view ??
          Container(
              // padding: EdgeInsets.all(5),
              color: Color.fromRGBO(243, 247, 250, 1),
              width: double.infinity,
              //child: widget.view == null ? _views[_rendered] : widget.view),
              child: widget.view = _views[_rendered]),
      bottomNavigationBar: BookspaceBottomBar(callback: changeView),
    );
  }
}
