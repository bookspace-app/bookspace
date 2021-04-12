

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
              icon: Icon(Icons.home_rounded),
              color: globals.secondary,
              iconSize: 40,
              tooltip: 'Home',
              onPressed: () { 
                widget.callback('home');
                Navigator.of(context).popUntil((route) => route.isFirst);
              }
            ),
            IconButton(
              icon: Icon(Icons.chat_rounded),
              color: globals.secondary,
              iconSize: 40,
              tooltip: 'Chats',
              onPressed: () => widget.callback('chatList'),
            ),
            IconButton(
              icon: Icon(Icons.text_fields),
              color: globals.secondary,
              iconSize: 50,
              tooltip: 'Create publication',
              onPressed: () => widget.callback('createPublication'),
            ),
            IconButton(
              icon: Icon(Icons.alternate_email_rounded),
              color: globals.secondary,
              iconSize: 40,
              tooltip: 'Activity',
              onPressed: () => widget.callback('activity'),
            ),
            IconButton(
              icon: Icon(Icons.account_circle_rounded),
              color: globals.secondary,
              iconSize: 40,
              tooltip: 'Profile',
              onPressed: () => widget.callback('profile'),
            ),
          ],
        ),
       )
    );
  }
}