import 'package:bookspace/app_localizations.dart';
import 'package:bookspace/controllers/comment_controller.dart';
import 'package:bookspace/controllers/user_controller.dart';
import 'package:bookspace/models/comment.dart';
import 'package:bookspace/models/user.dart';
import 'package:flutter/material.dart';

import 'package:bookspace/globals.dart' as globals;
import 'package:flutter/services.dart';

class CreateComment extends StatefulWidget {

  final int id;
  final commentId;
  final Function() notifyOnNewComment;

  CreateComment({
    Key key,
    this.id,
    this.commentId,
    @required this.notifyOnNewComment
  }) : super(key: key);

  @override
  _CreateCommentState createState() => _CreateCommentState();
}

class _CreateCommentState extends State<CreateComment> {
  User _user;
  Comment myComment;
  var contentController = TextEditingController();

  bool errorsContent = false;

  void getUser() async {
    User user =
        await UserController.getUser(globals.id); //TO-DO Get current user id
    if (!disposed) {
      setState(() => _user = user);
    }
  }

  @override
  void initState() { 
    super.initState();
    print("Publi id: ${widget.id}");
    print("Comment id: ${widget.commentId}");
  }

  bool disposed = false;
  @override
  void dispose() {
    disposed = true;
    // Clean up the controller when the widget is disposed.
    contentController.dispose();
    super.dispose();
  }

  void createComment() async {
    int response = await CommentController.createComment(myComment);
    print(globals.id);
  }

  String errorContent() {
    if (contentController.text.isEmpty)
      return "${AppLocalizations.of(context).translate("noContent")}";
    else if (contentController.text.length > 2000)
      return "${AppLocalizations.of(context).translate("longContent")}";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 2, 15, 5),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: contentController,
                  onChanged: (text) {
                    setState(() {});
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(2000),
                  ], //TO-DO Define length of publication's description
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    counterText:
                      '${contentController.text.length}' + '/2000',
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    errorText: errorsContent ? errorContent() : null,
                  )
                )  
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.30,
                  height: 35,
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Color.fromRGBO(250, 198, 65, 1),
                    child: Text(
                      'Publicar',
                      style: TextStyle(
                        fontSize: 18.0, color: Colors.black),
                      ),
                      onPressed: () {
                        setState(() {
                          errorsContent = (errorContent() != null) ? true : false;
                        });
                        print(errorsContent);
                        if (!errorsContent) {
                          List<int> mentionIds = [];
                          print(contentController.text);
                          print(contentController.text.toString());
                          myComment = Comment();
                          myComment.authorId = (globals.id).toInt();
                          myComment.content = contentController.text;
                          myComment.mentions = mentionIds;
                          myComment.parentId = widget.commentId;
                          myComment.publicationId = (widget.id).toInt();
                          createComment();
                          widget.notifyOnNewComment();
                        }
                      }
                    )
                )
              ],
            ), 
          )
        ]
      )
    );
  }
}