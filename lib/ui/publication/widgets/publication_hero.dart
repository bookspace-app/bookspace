import 'package:bookspace/models/publication.dart';
import 'package:bookspace/ui/main_view.dart';
import 'package:bookspace/ui/profile/profile_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bookspace/globals.dart' as globals;

class PublicationHero extends StatelessWidget {

  final Publication publication;

  PublicationHero({
    Key key,
    this.publication
  }) : super(key: key);

  int _totalUpvotes = 1;
  int _totalViews = 4;
  int _totalResponses = 2;

  bool _myVote = false;
  bool _myFavorite = false;
  bool _myResponse = false;


  @override
  Widget build(BuildContext context) {

    Widget ParsedContent(String content, bool atTitle) {

      RegExp usernameExp = new RegExp(r"\@\w+");
      Iterable<Match> usernameMatches = usernameExp.allMatches(content);
      List<String> usernames = [];
      usernameMatches.forEach((m)=>usernames.add(m.group(0)));
      RegExp wordsExp = new RegExp(r"[^\@\w+]|[-'a-zA-ZÀ-ÖØ-öø-ÿ-@]+|[!$%^&*()_+|~=`{}#@\[\]:;'’<>?,.\/"
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
                fontSize: atTitle? 20: 16,
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
                        view: ProfileView(),
                      )
                    ),
                  );
                })
            : TextSpan(
              text: '${m.group(0)}', 
              style: TextStyle(
                fontWeight: atTitle? FontWeight.bold: FontWeight.normal,
                fontSize: atTitle? 20: 16,
              )
            )
          ],
        ),
      );
    }

    return Container(
      //color: Colors.pink,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: ParsedContent(publication.title,true)
                )
              )
              // TODO: tags
            ],
          ),
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
                        children: <Widget> [
                          Text(
                            '$_totalUpvotes',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: _myVote ? Colors.green[400] : Colors.black,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left:10),
                            child: GestureDetector(
                              onTap: () { print('Tap');},
                              child: Icon(
                                Icons.thumb_up,
                                color: _myVote ? Colors.green[400] : Colors.black
                              ),
                            ),
                          )
                        ]
                      )
                    )
                  )
                ),
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
                        children: <Widget> [
                          Text(
                            '$_totalUpvotes',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: _myVote ? Colors.red[400] : Colors.black,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left:10),
                            child: GestureDetector(
                              onTap: () { print('Tap');},
                              child: Icon(
                                Icons.thumb_down,
                                color: _myVote ? Colors.red[400] : Colors.black
                              ),
                            ),
                          )
                        ]
                      )
                    )
                  )
                ),
              ),
              // Views and favorite module
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
                        children: <Widget> [
                          Text(
                            '${publication.views}',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: _myVote ? Colors.yellow[800] : Colors.black,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left:10),
                            child: GestureDetector(
                              onTap: () { print('Tap');},
                              child: Icon(
                                Icons.remove_red_eye,
                                color: _myVote ? Colors.yellow[800] : Colors.black
                              ),
                            ),
                          )
                        ]
                      )
                    )
                  )
                ),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          Text(
                            '${publication.comments}',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: _myVote ? Colors.green[400] : Colors.black,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left:10),
                            child: GestureDetector(
                              onTap: () { 
                                print('Tap');
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.reply,
                                color: _myVote ? Colors.green[400] : Colors.black
                              ),
                            ),
                          )
                        ]
                      )
                    )
                  )
                ),
              ),
            ],
          ),
          // Content publication hero
         Container(
           padding: EdgeInsets.all(10),
            //color: Colors.blue[200],
            child: ParsedContent(publication.content, false)
          )
        ],
      )
    );
  }
}