import 'package:bookspace/models/publication.dart';
import 'package:bookspace/utils/humanize.dart';
import 'package:flutter/material.dart';

class PublicationCard extends StatelessWidget {
  // Read attributes from
  final Publication publication;

  PublicationCard({
    Key key,
    this.publication,
  }) : super(key: key);

  int _totalUpvotes = 10;
  int _totalViews = 4;
  int _totalResponses = 2;

  bool _myVote = true;
  bool _myFavorite = true;
  bool _myResponse = true;


  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.yellow,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Container(
            // color: Colors.green[200],
            width: 85,
            padding: EdgeInsets.only(right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        child: Text(
                          '$_totalUpvotes',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: _myVote ? Colors.green[400] : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () { print('Tap');},
                        child: Icon(
                          Icons.thumb_up,
                          color: _myVote ? Colors.green[400] : Colors.black
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        child: Text(
                          '$_totalViews',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: _myFavorite ? Colors.yellow[800] : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () { print('Tap');},
                        child: Icon(
                          Icons.remove_red_eye,
                          color: _myFavorite ? Colors.yellow[800] : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        child: Text(
                          '$_totalResponses',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: _myResponse ? Colors.green[400] : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () { print('Tap');},
                        child: Icon(
                          Icons.reply,
                          color: _myResponse ? Colors.green[400] : Colors.black,
                        )
                      )
                    ),
                  ],
                )
              ]
            )
          ),
          Container(
            //color: Colors.yellow,
            padding: EdgeInsets.symmetric(vertical: 0),
            child: Column(
              children: <Widget> [
                 Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    // color: Colors.orange,
                    // would be publication.name
                    child: Text(
                      publication.title,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ), 
                 ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  // color: Colors.green,
                  // would be publication.name
                  child: Text(
                    "Tag",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ) 
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  // color: Colors.green,
                  // would be publication.name
                  child: Text(
                    "${TimeAgo.timeAgoSinceDate(publication.dop)} @{publication.author}",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ) 
                )
              ],
            )
          )
        ],
      ),
    );
  }
}