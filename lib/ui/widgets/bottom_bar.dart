

import 'package:bookspace/ui/main_view.dart';
import 'package:bookspace/ui/publication/create_publication_view.dart';
import 'package:flutter/material.dart';
import 'package:bookspace/globals.dart' as globals;

class BookspaceBottomBar extends StatefulWidget {
  BookspaceBottomBar({Key key}) : super(key: key);

  @override
  _BookspaceBottomBarState createState() => _BookspaceBottomBarState();
}

class _BookspaceBottomBarState extends State<BookspaceBottomBar> {
  @override
  BottomAppBar build(BuildContext context) {
    return BottomAppBar(
       child: Container(
        height: globals.bottomBarHeight,
        color: Colors.pink, 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget> [
            IconButton(
              icon: Icon(Icons.home),
              color: globals.secondary,
              tooltip: 'Home',
              onPressed: () {
                // TODO: navigation home
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainView(renderIndex: 0)),
                  (Route<dynamic> route) => false,
                );
              }, 
            ),
            IconButton(
              icon: Icon(Icons.chat),
              color: globals.secondary,
              tooltip: 'Chats',
              onPressed: () {
                // TODO: navigation chat
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainView(renderIndex: 1)),
                  (Route<dynamic> route) => false,
                );
              }, 
            ),
            IconButton(
              icon: Icon(Icons.text_fields),
              color: globals.secondary,
              tooltip: 'Create publication',
              onPressed: () {
                // TODO: navigation create publication
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainView(renderIndex: 2)),
                );
              }, 
            ),
            IconButton(
              icon: Icon(Icons.atm),
              color: globals.secondary,
              tooltip: 'Activity',
              onPressed: () {
                // TODO: navigation activity
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainView(renderIndex: 3)),
                  (Route<dynamic> route) => false,
                );
              }, 
            ),
            IconButton(
              icon: Icon(Icons.verified_user),
              color: globals.secondary,
              tooltip: 'Profile',
              onPressed: () {
                // TODO: navigation profile
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainView(renderIndex: 4)),
                  (Route<dynamic> route) => false,
                );
              }, 
            ),
          ],
        ),
       )
    );
  }
}