import 'package:bookspace/app_localizations.dart';
import 'package:bookspace/ui/activity/activity_view.dart';
import 'package:bookspace/ui/chat/chat_list_view.dart';
import 'package:bookspace/ui/home/home_view.dart';
import 'package:bookspace/ui/profile/profile_view.dart';
import 'package:bookspace/ui/publication/create_publication_view.dart';
import 'package:bookspace/ui/publication/publication_view.dart';
import 'package:bookspace/ui/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  final String renderIndex;
  Widget view;

  MainView({
    Key key,
    this.renderIndex,
    this.view, 
  }) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  String _rendered = "home";
  final Map<String, Widget> _views = {
    "home": HomeView(),
    "chatList": ChatListView(),
    "createPublication": CreatePublicationView(),
    "activity": ActivityView(),
    "profile": ProfileView(),
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
    setState(() {
       _rendered = newView;
      widget.view = _views[_rendered];
      _new_route = ModalRoute.of(context);
    });
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
        title: Text(AppLocalizations.of(context).translate("$_rendered").toString()),
        backgroundColor: Colors.white,
        leadingWidth: 100,
        leading: Image.asset('./assets/images/logo.png', fit: BoxFit.fitHeight),     //TO-DO: Hacer mas grande el logo de la AppBar  
        actions: (_rendered == "profile") ? 
          [ 
            IconButton(
                icon: Icon(Icons.more_vert),
                iconSize: 40, 
                color: Colors.grey,
                onPressed: () { },
            ),
          ]
        : null,
      ),
      body: widget.view ?? Container(
        // padding: EdgeInsets.all(5),
        color: Color.fromRGBO(243, 247, 250, 1),
        width: double.infinity,
        child: widget.view == null ? _views[_rendered] : widget.view
      ),
      bottomNavigationBar: BookspaceBottomBar(callback: changeView),
    );
  }
}