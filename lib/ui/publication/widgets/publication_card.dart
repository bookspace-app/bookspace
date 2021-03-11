import 'package:flutter/material.dart';

class PublicationCard extends StatefulWidget {
  PublicationCard({Key key}) : super(key: key);

  @override
  _PublicationCardState createState() => _PublicationCardState();
}

class _PublicationCardState extends State<PublicationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      width: double.infinity,
      height: 150,
      child: Row(
        children: <Widget> [
          Container(
            //color: Colors.green[200],
            width: 75,
            padding: EdgeInsets.only(right: 20),
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
                          '1',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: Icon(Icons.thumb_up),
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
                          '2',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: Icon(Icons.remove_red_eye),
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
                          '3',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: Icon(Icons.reply),
                        onPressed: () => {},
                      ),
                    ),
                  ],
                )
              ]
            )
          ),
          Container(
            child: Text('bye')
          )
        ],
      ),
    );
  }
}