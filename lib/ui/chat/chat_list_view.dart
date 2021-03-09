import 'package:flutter/material.dart';

class ChatListView extends StatefulWidget {
  ChatListView({Key key}) : super(key: key);

  @override
  _ChatListViewState createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('hello chat'),
    );
  }
}