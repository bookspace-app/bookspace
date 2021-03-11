import 'package:flutter/material.dart';

class PublicationCard extends StatefulWidget {
  // Read attributes from
  // final Publication publication;

  PublicationCard({Key key}) : super(key: key);

  @override
  _PublicationCardState createState() => _PublicationCardState();
}

class _PublicationCardState extends State<PublicationCard> {

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
      height: 150,
      child: Row(
        children: <Widget> [
          Container(
            //color: Colors.green[200],
            width: 85,
            padding: EdgeInsets.only(right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                    Expanded(
                      child: Container(
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
                      child: IconButton(
                        icon: Icon(Icons.thumb_up),
                        color: _myVote ? Colors.green[400] : Colors.black,
                        onPressed: () => {},
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
                      child: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        color: _myFavorite ? Colors.yellow[800] : Colors.black,
                        onPressed: () => {},
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
                      child: IconButton(
                        icon: Icon(Icons.reply),
                        color: _myResponse ? Colors.green[400] : Colors.black,
                        onPressed: () => {},
                      ),
                    ),
                  ],
                )
              ]
            )
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: <Widget> [
                 Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  // color: Colors.orange,
                  // would be publication.name
                  child: Text(
                    "¿Cómo establecer una embajada alienígena en la Tierra?",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
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
                    "Hace 8 horas @john",
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