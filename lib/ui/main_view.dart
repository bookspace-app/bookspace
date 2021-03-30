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
  final Widget view;

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

  dynamic changeView(String newView) {
    setState(() {
      _rendered = newView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_rendered),
        backgroundColor: Colors.white,
        leading: Image.asset('./assets/images/Logo.png', height: 1000, width: 1000),
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
        color: Colors.grey[100],
        width: double.infinity,
        child: _views[_rendered]
      ),
      bottomNavigationBar: BookspaceBottomBar(callback: changeView),
    );
  }
}