import 'package:bookspace/controllers/user_controller.dart';
import 'package:bookspace/models/user.dart';
import 'package:flutter/material.dart';



class ChatListView extends StatefulWidget {
  ChatListView({Key key}) : super(key: key);

  @override
  _ChatListViewState createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  User _user;
  List<Chat> _myChats = [];

  void getUser() async {
    User user = await UserController.getUser(1);
    if (!disposed){
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
    return Container(child: ListView(
      children: [
        for (var index = 0; index < _myChats.length; index++) Column(            //TO-DO Add left padding (15) & right padding (?) to publication cards
          children: <Widget>[
            Container(height: (index == 0)?10:0),
            InkWell(
              child: ChatCard(
                publication: _myChats[index]
              ),
              onTap: () {
                Navigator.push(
                  context, // TODO: pass id to PublicationView
                  MaterialPageRoute(
                    builder: (context) => MainView(
                      renderIndex: 'chatList',
                      view: ChatView(id: _myChats[index].id),
                    )
                  ),
                );
              }, // on tap llevar a la view de la publicacion
            ), 
            Divider() 
          ]
        )
      ],
    ));
  }
}