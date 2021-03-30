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
    User user = await UserController.getUser(1);
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
    if (_user != null) {
      return ListView( 
        children: <Widget> [
          Container(),
          Container(),
        ]
      );
      /*Container(
       child: Text('hello ${_user.username}'),
      );*/
    } else {
      return Container(
       child: Center(
         child: CircularProgressIndicator()
       )
      );
    }
  }
}