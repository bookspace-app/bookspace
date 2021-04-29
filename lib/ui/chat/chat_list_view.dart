import 'package:bookspace/controllers/user_controller.dart';
import 'package:bookspace/models/chat.dart';
import 'package:bookspace/models/message.dart';
import 'package:bookspace/models/user.dart';
import 'package:bookspace/ui/main_view.dart';
import 'package:flutter/material.dart';
import 'package:bookspace/ui/chat/widgets/chat_card.dart';

class ChatListView extends StatefulWidget {
  final int id;
  ChatListView({Key key, this.id}) : super(key: key);

  @override
  _ChatListViewState createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  User _user;

  List<Chat> _myChats = [
    //Dummy chats
    Chat(
        title: 'Pelicanos',
        creationDate: DateTime.parse("2021-04-18"),
        participants: [
          User(username: 'Alf'),
          User(username: 'Paul'),
          User(username: 'Gabi'),
          User(username: 'Keo')
        ],
        messages: [
          Message(
              author: User(username: 'Gabi'),
              content: 'Este chat funciona increible, no tengo dudas',
              creationDate: DateTime.parse("2021-04-17 09:10:11"))
        ],
        groupChat: true),

    Chat(
        title: 'individual test',
        creationDate: DateTime.parse("2021-04-18"),
        participants: [User(username: 'Alf'), User(username: 'Keo')],
        messages: [
          Message(
              author: User(username: 'Keo'),
              content:
                  'Este es un test de mensaje largo, este es un test de mensaje largo, este es un test de mensaje largo, este es un test de mensaje largo, ',
              creationDate: DateTime.parse("2021-04-17 22:33:44"))
        ],
        groupChat: false),
  ];

  void getUser() async {
    User user = await UserController.getUser(1);
    if (!disposed) {
      setState(() => _user = user);
    }
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  bool disposed = false;
  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromRGBO(243, 247, 250, 1),
        child: ListView(
          children: [
            for (var index = 0; index < _myChats.length; index++)
              Column(children: <Widget>[
                Container(height: (index == 0) ? 10 : 0),
                InkWell(
                  child: ChatCard(chat: _myChats[index]),
                  onTap: () {
                    /*
                Navigator.push( 
                  context, // TODO: render ChatView
                  MaterialPageRoute(
                    builder: (context) => MainView(
                      renderIndex: 'chatList',
                      view: ChatView(id: _myChats[index].id),
                    )
                  ),
                );
                */
                  },
                ),
                Divider()
              ])
          ],
        ));
  }
}
