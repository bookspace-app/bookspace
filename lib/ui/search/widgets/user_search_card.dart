import 'package:bookspace/models/user.dart';
import 'package:flutter/material.dart';
import 'package:bookspace/globals.dart' as globals;

class UserSearchCard extends StatelessWidget {
  final User user;
  const UserSearchCard({
    Key key,
    this.user
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: globals.theme ? Color.fromRGBO(243, 247, 250, 1) : Color.fromRGBO(117, 121, 125, 1),//Color.fromRGBO(243, 247, 250, 1),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Container(      //chat pic container
            color: globals.theme ? Color.fromRGBO(243, 247, 250, 1) : Color.fromRGBO(117, 121, 125, 1),//Colors.green[200],
            width: MediaQuery.of(context).size.width *0.25,
            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      './assets/images/No_pic.png',         //TO-DO show chat pic
                      height: 75,
                      width: 75,
                      fit: BoxFit.fill,  
                    ),
                  )
                ),
              ]
            )
          ),
          Container(
            color: globals.theme ? Color.fromRGBO(243, 247, 250, 1) : Color.fromRGBO(117, 121, 125, 1),
            padding: EdgeInsets.fromLTRB(0, 5, 15, 5),
            height: MediaQuery.of(context).size.width * 0.22, //85,
            child: Column(
              children: <Widget> [
                 Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    // color: Colors.orange,
                    child: Row(
                      children: <Widget> [
                        Text(
                          '@${user.username}',
                          style: TextStyle(
                            fontSize: 19.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                          //maxLines: 3,
                        ),
                        Spacer(),
                        Text(
                          "${user.rank}",
                          style: new TextStyle(
                          fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    )
                 ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 5, 0),
                  width: MediaQuery.of(context).size.width * 0.7,
                  //color: Colors.green,
                  child: Text(
                    '${user.description}',
                    //"${chat.messages[chat.messages.length-1].author.username} : ${chat.messages[chat.messages.length-1].content}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ) 
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}