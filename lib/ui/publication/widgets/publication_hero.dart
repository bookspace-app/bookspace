import 'package:bookspace/controllers/publication_controller.dart';
import 'package:bookspace/controllers/user_controller.dart';
import 'package:bookspace/models/publication.dart';
import 'package:bookspace/models/user.dart';
import 'package:bookspace/ui/main_view.dart';
import 'package:bookspace/ui/profile/profile_view.dart';
import 'package:bookspace/ui/publication/publication_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bookspace/globals.dart' as globals;

class PublicationHero extends StatefulWidget {
  final publication;
  final bool isPublication;
  final Function() scrollOnReply;
  final Function() notifyOnNewVote;
  bool myLike;
  bool myDislike;

  PublicationHero({
    Key key,
    this.publication,
    this.isPublication,
    this.myLike,
    this.myDislike,
    @required this.scrollOnReply,
    @required this.notifyOnNewVote,
  }) : super(key: key);

  @override
  _PublicationHeroState createState() => _PublicationHeroState();
}

class _PublicationHeroState extends State<PublicationHero> {
  bool _myLike = false;
  bool _myDislike = false;
  bool _myVote = false;
  List<User> _users = [];

  Future<int> like(int Pid, int Uid) async {
    var status = await PublicationController.like(Pid, Uid, globals.token);
    return status;
  }

  Future<int> unlike(int Pid, int Uid) async {
    var status = await PublicationController.unlike(Pid, Uid, globals.token);
    return status;
  }

  Future<int> dislike(int Pid, int Uid) async {
    var status = await PublicationController.dislike(Pid, Uid, globals.token);
    return status;
  }

  Future<int> undislike(int Pid, int Uid) async {
    var status = await PublicationController.undislike(Pid, Uid, globals.token);
    return status;
  }

  void addfav(int Pid, int Uid) async {
    var statuscode = await PublicationController.fav(Pid, Uid, globals.token);
    print(statuscode);
  }

  void delfav(int Pid, int Uid) async {
    var statuscode =
        await PublicationController.delfav(Pid, Uid, globals.token);
    print(statuscode);
  }

  void getfav(int Pid, String action) async {
    List<User> users = await PublicationController.getfav(Pid, action);
    setState(() => _users = users);
    if (action == 'fav') {
      for (var i = 0; i < _users.length; i++) {
        (globals.id == _users[i].id)
            ? setState(() => _myVote = true)
            : setState(() => _myVote = false);
      }
    } else if (action == 'like') {
      for (var i = 0; i < _users.length; i++) {
        (globals.id == _users[i].id)
            ? setState(() => _myLike = true)
            : setState(() => _myLike = false);
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
    Widget ParsedContent(String content, bool atTitle) {
      RegExp usernameExp = new RegExp(r"\@\w+");
      Iterable<Match> usernameMatches = usernameExp.allMatches(content);
      List<String> usernames = [];
      usernameMatches.forEach((m) => usernames.add(m.group(0)));
      RegExp wordsExp = new RegExp(
          r"[^\@\w+]|[-'a-zA-ZÀ-ÖØ-öø-ÿ-@-_]+|[!$%^&*()_+|~=`{}#@\[\]:;'’<>?,.\/"
          '"”'
          "]+");
      Iterable wordsMatches = wordsExp.allMatches(content);

      /*
      for (Match m in wordsMatches) {
        print(m.group(0).trim());
      }
      */

      return RichText(
        text: TextSpan(
          //text: content,
          style: DefaultTextStyle.of(context).style,
          children: [
            for (Match m in wordsMatches)
              usernames.contains(m.group(0).trim())
                  ? TextSpan(
                      text: m.group(0),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: atTitle ? 20 : 16,
                        color: globals.primary,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print(m.group(0));
                          Navigator.push(
                            context, // TODO: pass id to PublicationView
                            MaterialPageRoute(
                                builder: (context) => MainView(
                                      renderIndex: 'home',
                                      view: ProfileView(
                                        username: m.group(0).substring(1),
                                      ),
                                    )),
                          );
                        })
                  : TextSpan(
                      text: '${m.group(0)}',
                      style: TextStyle(
                        fontWeight:
                            atTitle ? FontWeight.bold : FontWeight.normal,
                        fontSize: atTitle ? 20 : 16,
                      ))
          ],
        ),
      );
    }

    return Container(
        //color: Colors.pink,
        child: Column(
      children: <Widget>[
        (widget.isPublication)
            ? Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child: ParsedContent(widget.publication.title, true)
                      )
                  )
                ],
              )
            : Container(),
        (widget.isPublication)
          ? Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                direction: Axis.horizontal,
                children: <Widget>[
                    for (var i = 0; i < widget.publication.tags.length; i++)
                    Padding(padding: EdgeInsets.fromLTRB(2, 0, 2, 5), 
                      child: Container (
                        padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                        //color: globals.gray,
                        decoration: BoxDecoration(color: globals.gray ,border: Border.all(color: globals.gray), borderRadius: BorderRadius.all(Radius.circular(5)) ), 
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
                ],
              )
            )
          : Container(),  
        // Upvotes module
        Row(
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '${widget.publication.likes}',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: _myLike
                                        ? Colors.green[400]
                                        : Colors.black,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      if (!_myLike) {
                                        like(widget.publication.id, globals.id);
                                        setState(() => _myLike = true);
                                        setState(() => _myDislike = false);
                                        widget.notifyOnNewVote();
                                      } else {
                                        dislike(
                                            widget.publication.id, globals.id);
                                        setState(() => _myLike = false);
                                        setState(() => _myDislike = false);
                                        widget.notifyOnNewVote();
                                      }
                                    },
                                    child: Icon(Icons.thumb_up,
                                        color: _myLike
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '${widget.publication.dislikes * -1}',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: _myDislike
                                        ? Colors.red[400]
                                        : Colors.black,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      if (!_myDislike) {
                                        dislike(
                                            widget.publication.id, globals.id);
                                        setState(() => _myLike = false);
                                        setState(() => _myDislike = true);
                                        widget.notifyOnNewVote();
                                      } else {
                                        dislike(
                                            widget.publication.id, globals.id);
                                        setState(() => _myLike = false);
                                        setState(() => _myDislike = false);
                                        widget.notifyOnNewVote();
                                      }
                                    },
                                    child: Icon(Icons.thumb_down,
                                        color: _myDislike
                                            ? Colors.red[400]
                                            : Colors.black),
                                  ),
                                )
                              ])))),
            ),
            // Views and favorite module
            (widget.isPublication)
                ? Expanded(
                    child: Container(
                        //color: Colors.orange[300],
                        padding: EdgeInsets.symmetric(vertical: 3),
                        child: Center(
                            child: Container(
                                width: 100,
                                //color: Colors.blue[200],
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '${widget.publication.views}',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: _myVote
                                              ? Colors.yellow[800]
                                              : Colors.black,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: GestureDetector(
                                          onTap: () {
                                            (_myVote)
                                                ? delfav(widget.publication.id,
                                                    globals.id)
                                                : addfav(widget.publication.id,
                                                    globals.id);
                                            setState(() => _myVote = !_myVote);
                                            widget.notifyOnNewVote();
                                          },
                                          child: Icon(Icons.remove_red_eye,
                                              color: _myVote
                                                  ? Colors.yellow[800]
                                                  : Colors.black),
                                        ),
                                      )
                                    ])))),
                  )
                : Container(),
            // reply module
            Expanded(
              child: Container(
                  //color: Colors.red[300],
                  padding: (widget.isPublication)
                      ? EdgeInsets.symmetric(vertical: 3)
                      : EdgeInsets.fromLTRB(0, 20, 0, 3),
                  child: Center(
                      child: Container(
                          width: 100,
                          //color: Colors.blue[200],
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  (widget.isPublication)
                                      ? '${widget.publication.comments}'
                                      : '${widget.publication.replies}',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    // color: _myVote ? Colors.green[400] : Colors.black,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      print('Tap');
                                      widget.scrollOnReply();
                                    },
                                    child: Icon(
                                      Icons.reply,
                                      // color: _myVote ? Colors.green[400] : Colors.black
                                    ),
                                  ),
                                )
                              ])))),
            ),
          ],
        ),
        // Content publication hero
        Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            //color: Colors.blue[200],
            child: ParsedContent(widget.publication.content, false))
      ],
    ));
  }
}
