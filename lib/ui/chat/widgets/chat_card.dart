import 'package:bookspace/models/chat.dart';
import 'package:bookspace/utils/humanize.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {

  final Chat chat;

  ChatCard({
    Key key,
    this.chat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(243, 247, 250, 1),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Container(      //chat pic container
            //color: Colors.green[200],
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
            //color: Colors.yellow,
            padding: EdgeInsets.fromLTRB(0, 5, 15, 5),
            height: 85,
            child: Column(
              children: <Widget> [
                 Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    // color: Colors.orange,
                    child: Row(
                      children: <Widget> [
                        Text(
                        chat.groupChat ? "${chat.title}" : "${chat.participants[1].username}", //TO-DO When it's not a group chat show username of the other user
                        style: TextStyle(
                          fontSize: 19.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        ),
                        Spacer(),
                        Text(
                        "${TimeAgo.timeAgoSinceDate(chat.messages[chat.messages.length-1].creationDate)}",
                        //"${chat.messages[chat.messages.length-1].creationDate}",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0
                        ),
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
                    "${chat.messages[chat.messages.length-1].author.username} : ${chat.messages[chat.messages.length-1].content}",
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