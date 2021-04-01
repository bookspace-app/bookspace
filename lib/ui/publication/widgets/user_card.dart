import 'package:bookspace/models/user.dart';
import 'package:bookspace/utils/humanize.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  
  final User author;
  final DateTime dop;
  final bool principal;
  
  UserCard({
    Key key,
    this.author,
    this.dop,
    this.principal
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: principal? Colors.yellow[200]: Colors.grey[200],
          border: Border.all(
            color: principal? Colors.yellow[800] : Colors.grey[400],
          ),
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: Row(
          children: <Widget> [
            Expanded(
              flex: 5,
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
                        children: <Widget> [
                          Container(
                            child: Text(
                              '@${author.username}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ),
                          Container(
                            child: Text(
                              '${author.rank}',
                              style: TextStyle(
                                fontWeight: FontWeight.normal
                              ),
                            )
                          ),
                        ],
                      )
                    )
                  ],
                )
              )
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.only(right: 10),
                // color: Colors.red[200],
                child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget> [
                        Container(
                          child: Text(
                            'Pregunta',
                            style: TextStyle(
                              fontWeight: FontWeight.normal
                            ),
                          )
                        ),
                        Container(
                          child: Text(
                            '${TimeAgo.timeAgoSinceDate(dop)}',
                            style: TextStyle(
                              fontWeight: FontWeight.normal
                            ),
                          )
                        ),
                      ],
                    )
              )
            ),
            Expanded(
              flex: 1,
              child: Container(
                //color: Colors.blue[200],
                child: GestureDetector(
                  onTap: () { print('Tap');},
                  child: Icon(
                    Icons.more_vert,
                    size: 40,
                    color: Colors.black
                  ),
                ),
              )
            )
          ]
        )
      ),
    );
  }
}
