

import 'package:bookspace/ui/main_view.dart';
import 'package:bookspace/ui/profile/profile_view.dart';
import 'package:bookspace/ui/publication/create_publication_view.dart';
import 'package:bookspace/ui/publication/widgets/publications_list.dart';
import 'package:flutter/material.dart';
import 'package:bookspace/globals.dart' as globals;

class BookspaceBottomBar extends StatefulWidget {
  final dynamic Function(String newView) callback;

  BookspaceBottomBar({Key key,  @required this.callback}) : super(key: key);

  @override
  _BookspaceBottomBarState createState() => _BookspaceBottomBarState();
}

class _BookspaceBottomBarState extends State<BookspaceBottomBar> {

  @override
  BottomAppBar build(BuildContext context) {
    return BottomAppBar(
       child: Container(
        height: globals.bottomBarHeight,
        // color: Colors.pink, 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget> [
            IconButton(
              icon: Icon(Icons.home),
              color: globals.secondary,
              tooltip: 'Home',
              onPressed: () { 
                widget.callback('home');
                Navigator.of(context).popUntil((route) => route.isFirst);
              }
            ),
            IconButton(
              icon: Icon(Icons.chat),
              color: globals.secondary,
              tooltip: 'Chats',
              onPressed: () => widget.callback('chatList'),
            ),
            IconButton(
              icon: Icon(Icons.text_fields),
              color: globals.secondary,
              tooltip: 'Create publication',
              onPressed: () => widget.callback('createPublication'),
            ),
            IconButton(
              icon: Icon(Icons.alternate_email),
              color: globals.secondary,
              tooltip: 'Activity',
              onPressed: () => widget.callback('activity'),
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              color: globals.secondary,
              tooltip: 'Profile',
              onPressed: () => widget.callback('profile'),
            ),
          ],
        ),
       )
    );
  }
}