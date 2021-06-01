import 'package:bookspace/controllers/publication_controller.dart';
import 'package:bookspace/models/publication.dart';
import 'package:bookspace/models/user.dart';
import 'package:bookspace/utils/humanize.dart';
import 'package:flutter/material.dart';
import 'package:bookspace/globals.dart' as globals;

class PublicationCard extends StatefulWidget {
  // Read attributes from
  final Publication publication;

  PublicationCard({
    Key key,
    this.publication,
  }) : super(key: key);

  @override
  _PublicationCardState createState() => _PublicationCardState();
}

class _PublicationCardState extends State<PublicationCard> {
  bool _myVote = false;
  bool _myDislike = false;
  bool _myFavorite = false;
  bool _myResponse = false;
  List<User> _users = [];

  int tagsSize = 0;
  int printedTags = 0;

  void tagsSpace() {
    for (var j = 0; j < widget.publication.tags.length && tagsSize <= 24; j++) {
      printedTags = j + 1;
      tagsSize = widget.publication.tags[j].length;
      if (tagsSize > 24) printedTags = j;
    }
  }

  void getfav(int Pid, String action) async {
    List<User> users = await PublicationController.getfav(Pid, action);
    setState(() => _users = users);
    if (action == 'fav') {
      for (var i = 0; i < _users.length; i++) {
        (globals.id == _users[i].id)
            ? setState(() => _myFavorite = true)
            : setState(() => _myFavorite = false);
      }
    } else if (action == 'like') {
      for (var i = 0; i < _users.length; i++) {
        (globals.id == _users[i].id)
            ? setState(() => _myVote = true)
            : setState(() => _myVote = false);
      }
    } else if (action == 'dislike') {
      for (var i = 0; i < _users.length; i++) {
        (globals.id == _users[i].id)
            ? setState(() => _myDislike = true)
            : setState(() => _myDislike = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getfav(widget.publication.id, 'fav');
    getfav(widget.publication.id, 'like');
    getfav(widget.publication.id, 'dislike');
  }

  @override
  Widget build(BuildContext context) {
    tagsSpace();
    return Container(
      //color: Colors.yellow,
      width: double.infinity,
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              //color: Colors.green[200],
              width: MediaQuery.of(context).size.width * 0.25,
              padding: EdgeInsets.only(right: 15),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 3),
                            child: Text(
                              '${widget.publication.totalLikes}',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: _myVote
                                    ? Colors.green[400]
                                    : _myDislike
                                        ? Colors.red[400]
                                        : globals.theme
                                            ? Colors.black
                                            : Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              print('Tap');
                            },
                            child: Icon(
                              Icons.thumb_up,
                              color: _myVote
                                  ? Colors.green[400]
                                  : _myDislike
                                      ? Colors.red[400]
                                      : globals.theme
                                          ? Colors.black
                                          : Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 3),
                            child: Text(
                              '${widget.publication.views}',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: _myFavorite
                                    ? Colors.yellow[800]
                                    : globals.theme
                                        ? Colors.black
                                        : Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              print('Tap');
                            },
                            child: Icon(
                              Icons.remove_red_eye,
                              color: _myFavorite
                                  ? Colors.yellow[800]
                                  : globals.theme
                                      ? Colors.black
                                      : Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 3),
                            child: Text(
                              '${widget.publication.comments}',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: _myResponse
                                    ? Colors.green[400]
                                    : globals.theme
                                        ? Colors.black
                                        : Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  print('Tap');
                                },
                                child: Icon(
                                  Icons.reply,
                                  color: _myResponse
                                      ? Colors.green[400]
                                      : globals.theme
                                          ? Colors.black
                                          : Colors.white,
                                ))),
                      ],
                    )
                  ])),
          Container(
              //color: Colors.yellow,
              padding: EdgeInsets.symmetric(vertical: 0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    // color: Colors.orange,
                    // would be publication.name
                    child: Text(
                      widget.publication.title,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: globals.theme ? Colors.black : Colors.white),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      // color: Colors.green,
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Row(children: [
                        for (var i = 0; i < printedTags; i++)
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                              //color: globals.gray,
                              decoration: BoxDecoration(
                                  color: globals.gray,
                                  border: Border.all(color: globals.gray),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Text(
                                " ${widget.publication.tags[i]} ",
                                style: TextStyle(
                                  backgroundColor: globals.gray,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ),
                        if (tagsSize > 24)
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                              //color: globals.gray,
                              decoration: BoxDecoration(
                                  color: globals.gray,
                                  border: Border.all(color: globals.gray),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Text(
                                " ... ",
                                style: TextStyle(
                                  backgroundColor: globals.gray,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ),
                      ])),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      // color: Colors.green,
                      // would be publication.name
                      child: Text(
                        "${TimeAgo.timeAgoSinceDate(widget.publication.dop)} @${widget.publication.author?.username}",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: globals.theme ? Colors.black : Colors.white),
                      ))
                ],
              )),
        ],
      ),
    );
  }
}
