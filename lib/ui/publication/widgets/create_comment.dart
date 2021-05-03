import 'package:bookspace/controllers/comment_controller.dart';
import 'package:bookspace/controllers/user_controller.dart';
import 'package:bookspace/models/comment.dart';
import 'package:bookspace/models/user.dart';
import 'package:flutter/material.dart';

import 'package:bookspace/globals.dart' as globals;

class CreateComment extends StatefulWidget {

  final int id;

  CreateComment({
    Key key,
    this.id
  }) : super(key: key);

  @override
  _CreateCommentState createState() => _CreateCommentState();
}

class _CreateCommentState extends State<CreateComment> {
  User _user;
  Comment myComment;
  var contentController = TextEditingController();

  void getUser() async {
    User user =
        await UserController.getUser(globals.id); //TO-DO Get current user id
    if (!disposed) {
      setState(() => _user = user);
    }
  }

  bool disposed = false;
  @override
  void dispose() {
    disposed = true;
    // Clean up the controller when the widget is disposed.
    contentController.dispose();
    super.dispose();
  }

  void createPublication() async {
    int response = await CommentController.createComment(myComment);
    print(globals.id);
    /*
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => MainView(
                  renderIndex: 'profile',
                  view: ProfileView(),
                )),
        ModalRoute.withName('/'));
    */
  }

  
  @override
  Widget build(BuildContext context) {
    return Container(
       child: child,
    );
  }
}