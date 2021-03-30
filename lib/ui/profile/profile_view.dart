import 'package:bookspace/controllers/user_controller.dart';
import 'package:bookspace/models/user.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  User _user;

  void getUser() async {
    User user = await UserController.getUser(3);
    if (!disposed){
      setState(() => _user = user);
    }
    print(_user);
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Perfil'),
        backgroundColor: Colors.white,
        leading: Image.asset('./assets/images/Logo.png', height: 1000, width: 1000),
        actions: [
          IconButton(
              icon: Icon(Icons.more_vert),
              iconSize: 40,
              color: Colors.grey,
              onPressed: () { },
          ),
        ],
      ),
      body: ListView(
        

      )
    );
    /*
    if (_user != null) {
      return Container(
       child: Text('hello ${_user.username}'),
      );
    } else {
      return Container(
       child: Text('No hay user aun'),
      );
    }
    */
  }
}