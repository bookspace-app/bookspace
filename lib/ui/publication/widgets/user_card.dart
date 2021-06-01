import 'package:bookspace/controllers/comment_controller.dart';
import 'package:bookspace/controllers/publication_controller.dart';
import 'package:bookspace/models/user.dart';
import 'package:bookspace/ui/home/home_view.dart';
import 'package:bookspace/ui/main_view.dart';
import 'package:bookspace/ui/profile/edit_profile_view.dart';
import 'package:bookspace/ui/publication/create_publication_view.dart';
import 'package:bookspace/ui/publication/edit_publication.dart';
import 'package:bookspace/ui/publication/publication_view.dart';
import 'package:bookspace/utils/humanize.dart';
import 'package:flutter/material.dart';
import 'package:bookspace/app_localizations.dart';
import 'package:bookspace/globals.dart' as globals;

class UserCard extends StatefulWidget {
  final int commentId;
  final int parentId;
  final User author;
  final DateTime dop;
  final bool principal;
  final bool isPublication;
  final Function() notifyOnChange;

  int likes;
  int dislikes;
  int replies;
  bool myVote;
  bool myVoted;
  Color color = Colors.black;

  UserCard(
      {Key key,
      this.commentId,
      this.parentId,
      this.author,
      this.dop,
      this.principal,
      this.isPublication,
      this.likes,
      this.dislikes,
      this.replies,
      this.myVote,
      this.myVoted,
      @required this.notifyOnChange})
      : super(key: key);

  @override
  _UsercardState createState() => _UsercardState();
}

class _UsercardState extends State<UserCard> {
  bool myVote = false;
  bool myVoted = false;
  List<User> _users = [];
  int likes = 0;
  int dislikes = 0;
  int replies = 0;

  void deleteP(int id) async {
    var statuscode =
        await PublicationController.deletePublication(id, globals.token);
    print(statuscode);
  }

  void deleteC(int id) async {
    var statuscode = await CommentController.deleteComment(id, globals.token);
    print(statuscode);
  }

  Future<int> like(int Pid, int Uid) async {
    var status = await CommentController.like(Pid, Uid, globals.token);
    return status;
  }

  Future<int> dislike(int Pid, int Uid) async {
    var status = await CommentController.dislike(Pid, Uid, globals.token);
    return status;
  }

  void getfav(int Pid, String action) async {
    List<User> users = await PublicationController.getfav(Pid, action);
    setState(() => _users = users);
    if (action == 'like') {
      for (var i = 0; i < _users.length; i++) {
        (globals.id == _users[i].id)
            ? setState(() => myVote = true)
            : setState(() => myVote = false);
      }
    } else if (action == 'dislike') {
      for (var i = 0; i < _users.length; i++) {
        (globals.id == _users[i].id)
            ? setState(() => myVoted = true)
            : setState(() => myVoted = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getfav(widget.commentId, 'like');
    getfav(widget.commentId, 'dislike');
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Container(
          decoration: BoxDecoration(
              color: widget.principal ? Colors.yellow[200] : Colors.grey[200],
              border: Border.all(
                color: widget.principal ? Colors.yellow[300] : Colors.grey[300],
                width: 5 + (-1 * globals.rankTrans(widget.author.rank))
              ),
              gradient: globals.rankTrans(widget.author.rank) == 2 ? LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.amber,
                  Colors.white,
                  Colors.amber,
                  Colors.white,
                  Colors.amber,
                ],
              ) : globals.rankTrans(widget.author.rank) == 4 ? LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  globals.primary,
                  Colors.white,
                ],
              ) : globals.rankTrans(widget.author.rank) == 3 ? LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.amber,
                  Colors.white,
                  Colors.amber,
                ],
              ) : globals.rankTrans(widget.author.rank) == 1 ? LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.amber,
                  globals.primary,
                ],
              ) : null,
              borderRadius: BorderRadius.all(Radius.circular(5) * globals.rankTrans(widget.author.rank))),
          child: Column(children: <Widget>[
            Container(
              height: 50,
              child: Row(children: <Widget>[
                Expanded(
                    flex: 8,
                    child: Container(
                        padding: EdgeInsets.only(left: 10),
                        // color: Colors.blue[200],
                        child: Row(
                          children: <Widget>[
                            Image.asset('./assets/images/No_pic.png'),
                            Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        child: Text(
                                      '@${widget.author.username}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                    Container(
                                        child: Text(
                                      '${widget.author.rank}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                    )),
                                  ],
                                ))
                          ],
                        ))),
                Expanded(
                    flex: 5,
                    child: Container(
                        padding: EdgeInsets.only(right: 1),
                        // color: Colors.red[200],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                                child: Text(
                              (widget.isPublication)
                                  ? 'Pregunta'
                                  : 'Comentario',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            )),
                            Container(
                                child: Text(
                              '${TimeAgo.timeAgoSinceDate(widget.dop)}',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            )),
                          ],
                        ))),

                Expanded(
                    flex: 1,
                    //color: Colors.blue[200],
                    //if (globals.id == widget.author.id){
                    child: PopupMenuButton<String>(onSelected: (value) {
                      if (value == 'Editar') {
                        if (globals.id != widget.author.id) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Permiso denegado'),
                                content: Text('No eres el autor'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else if (widget.isPublication) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainView(
                                      renderIndex: 'home',
                                      view: EditPublicationView(
                                          id: widget.commentId),
                                    )),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Acción no permitida'),
                                content: Text('No puedes editar un comentario'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      } else if (value == 'Borrar') {
                        if (globals.id == widget.author.id) {
                          if (widget.isPublication) {
                            deleteP(widget.commentId);
                            widget.notifyOnChange();
                            Navigator.pop(context);
                          } else {
                            deleteC(widget.commentId);
                            widget.notifyOnChange();
                          }
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Permiso denegado'),
                                content: Text('No eres el autor'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    }, itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          value: 'Editar',
                          child: Row(
                            children: [
                              Icon(Icons.edit),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text('Editar'),
                              )
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 'Borrar',
                          child: Row(
                            children: [
                              Icon(Icons.delete),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text('Borrar'),
                              )
                            ],
                          ),
                        ),
                      ];
                    })) //})
              ]),
            ),
            widget.principal
                ? Container()
                : Container(
                    //color: Colors.blue[200],
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              //color: Colors.orange[300],
                              padding: EdgeInsets.symmetric(vertical: 3),
                              child: Center(
                                  child: Container(
                                      width: 100,
                                      //color: Colors.blue[200],
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '${widget.likes}',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                color: (myVote)
                                                    ? Colors.green[400]
                                                    : Colors.black,
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: GestureDetector(
                                                onTap: () {
                                                  like(widget.commentId,
                                                      globals.id);
                                                  setState(() => myVote = true);
                                                  setState(
                                                      () => myVoted = false);
                                                  widget.notifyOnChange();
                                                },
                                                child: Icon(Icons.thumb_up,
                                                    color: (myVote)
                                                        ? Colors.green[400]
                                                        : Colors.black),
                                              ),
                                            )
                                          ])))),
                        ),
                        // Downvotes module
                        Expanded(
                          child: Container(
                              //color: Colors.red[300],
                              padding: EdgeInsets.symmetric(vertical: 3),
                              child: Center(
                                  child: Container(
                                      width: 100,
                                      //color: Colors.blue[200],
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '${widget.dislikes * -1}',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                color: myVoted
                                                    ? Colors.red[400]
                                                    : Colors.black,
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: GestureDetector(
                                                onTap: () {
                                                  dislike(widget.commentId,
                                                      globals.id);
                                                  setState(
                                                      () => myVote = false);
                                                  setState(
                                                      () => myVoted = true);
                                                  widget.notifyOnChange();
                                                },
                                                child: Icon(Icons.thumb_down,
                                                    color: (myVoted)
                                                        ? Colors.red[400]
                                                        : Colors.black),
                                              ),
                                            )
                                          ])))),
                        ),
                        // reply module
                        Expanded(
                          child: Container(
                              //color: Colors.red[300],
                              padding: EdgeInsets.symmetric(vertical: 3),
                              child: Center(
                                  child: Container(
                                      width: 100,
                                      //color: Colors.blue[200],
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '${widget.replies}',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                //color: _myVote ? Colors.green[400] : Colors.black,
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: GestureDetector(
                                                onTap: () {
                                                  print(
                                                      'Go to comment $widget.commentId');
                                                  Navigator.push(
                                                    context, // TODO: pass id to PublicationView
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            MainView(
                                                              renderIndex:
                                                                  'home',
                                                              view:
                                                                  PublicationView(
                                                                id: widget
                                                                    .commentId,
                                                                isPublication:
                                                                    false,
                                                              ),
                                                            )),
                                                  );
                                                },
                                                child: Icon(
                                                  Icons.reply,
                                                  //color: _myVote ? Colors.green[400] : Colors.black
                                                ),
                                              ),
                                            )
                                          ])))),
                        ),
                        Expanded(child: Container())
                      ],
                    ),
                  )
          ])),
    );
  }
}
