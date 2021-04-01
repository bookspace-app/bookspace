import 'package:bookspace/models/publication.dart';
import 'package:flutter/material.dart';

class PublicationHero extends StatelessWidget {

  final Publication publication;

  PublicationHero({
    Key key,
    this.publication
  }) : super(key: key);

  int _totalUpvotes = 100;
  int _totalViews = 4;
  int _totalResponses = 2;

  bool _myVote = true;
  bool _myFavorite = true;
  bool _myResponse = true;


  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.pink,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '${publication.title}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
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
                            '$_totalUpvotes',
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
            child: Text(
              publication.content,
              style: TextStyle(),
            )
          )
        ],
      )
    );
  }
}