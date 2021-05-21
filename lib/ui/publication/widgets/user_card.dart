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

class UserCard extends StatelessWidget {
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

  void deleteP(int id) async {
    var statuscode =
        await PublicationController.deletePublication(id, globals.token);
    print(statuscode);
  }

  /*void addfav(int Pid, int Uid) async {
    var statuscode = await PublicationController.fav(Pid, Uid);
    print(statuscode);
  }

  void delfav(int Pid, int Uid) async {
    var statuscode = await PublicationController.delfav(Pid, Uid);
    print(statuscode);
  }*/

  void deleteC(int id) async {
    var statuscode = await CommentController.deleteComment(id);
    print(statuscode);
  }

  Future<int> like(int Pid, int Uid) async {
    var status = await CommentController.like(Pid, Uid);
    return status;
  }

  Future<int> dislike(int Pid, int Uid) async {
    var status = await CommentController.dislike(Pid, Uid);
    return status;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Container(
          decoration: BoxDecoration(
              color: principal ? Colors.yellow[200] : Colors.grey[200],
              border: Border.all(
                color: principal ? Colors.yellow[300] : Colors.grey[300],
              ),
              borderRadius: BorderRadius.all(Radius.circular(5))),
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
                                      '@${author.username}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                    Container(
                                        child: Text(
                                      '${author.rank}',
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
                              (isPublication) ? 'Pregunta' : 'Comentario',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            )),
                            Container(
                                child: Text(
                              '${TimeAgo.timeAgoSinceDate(dop)}',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            )),
                          ],
                        ))),
                Expanded(
                    flex: 1,
                    //color: Colors.blue[200],
                    child: PopupMenuButton<String>(onSelected: (value) {
                      if (value == 'Editar') {
                        if (globals.id != author.id) {
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
                        } else if (isPublication) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainView(
                                      renderIndex: 'home',
                                      view: EditPublicationView(id: commentId),
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
                        if (globals.id == author.id) {
                          if (isPublication) {
                            deleteP(commentId);
                            notifyOnChange();
                            Navigator.pop(context);
                          } else {
                            deleteC(commentId);
                            notifyOnChange();
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
                      /*else if (value == 'Fav') {
                        if (!isPublication) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Acción no permitida'),
                                content: Text(
                                    'No puedes añadir a favoritas un comentario, añada a favoritas la publicación'),
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
                        } else {
                          if (color == Colors.black) {
                            color = Colors.yellow;
                            addfav(commentId, globals.id);
                          } else {
                            color = Colors.black;
                            delfav(commentId, globals.id);
                          }
                        }
                      }*/
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
                        /* PopupMenuItem(
                          value: 'Fav',
                          child: Row(
                            children: [
                              Icon(Icons.star, color: color),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text('Añadir a favoritos'),
                              )
                            ],
                          ),
                        ),*/
                      ];
                    }))
              ]),
            ),
            principal
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
                                              '$likes',
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
                                                  like(commentId, globals.id);
                                                  myVote = true;
                                                  myVoted = false;
                                                  notifyOnChange();
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
                                              '$dislikes',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                //color: _myVote ? Colors.red[400] : Colors.black,
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: GestureDetector(
                                                onTap: () {
                                                  dislike(
                                                      commentId, globals.id);
                                                  myVote = false;
                                                  myVoted = true;
                                                  notifyOnChange();
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
                                              '$replies',
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
                                                      'Go to comment $commentId');
                                                  Navigator.push(
                                                    context, // TODO: pass id to PublicationView
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            MainView(
                                                              renderIndex:
                                                                  'home',
                                                              view:
                                                                  PublicationView(
                                                                id: commentId,
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
