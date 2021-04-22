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

  int _totalUpvotes = 100;
  int _totalViews = 4;
  int _totalResponses = 2;

  bool _myVote = false;
  bool _myFavorite = false;
  bool _myResponse = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.yellow,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Container(
            //color: Colors.green[200],
            width: MediaQuery.of(context).size.width *0.25,
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
                          '${publication.totalLikes}',
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
                          '${publication.views}',
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
                          '${publication.comments}',
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
                    width: MediaQuery.of(context).size.width * 0.7,
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
                  width: MediaQuery.of(context).size.width * 0.7,
                  // color: Colors.green,
                  // would be publication.tags
                  child: Text(
                    "Tags",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ) 
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  // color: Colors.green,
                  // would be publication.name
                  child: Text(
                    "${TimeAgo.timeAgoSinceDate(publication.dop)} @${publication.author?.username}",
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