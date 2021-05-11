import 'package:bookspace/models/mention.dart';
import 'package:bookspace/utils/humanize.dart';
import 'package:flutter/material.dart';
import 'package:bookspace/globals.dart' as globals;

class MentionCard extends StatelessWidget {

  final Mention mention;

  const MentionCard({
    Key key, 
    this.mention
  }) : super(key: key);

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
            )
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
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,//Colors.grey[400],
            ),
            borderRadius: BorderRadius.all(Radius.circular(5))
          ),
        child: Column(
          children: <Widget> [
            Container(
              height: 50,
              child: Row(
                children: <Widget> [
                  Container(
                    width: 250,
                      padding: EdgeInsets.only(left: 10),
                      // color: Colors.blue[200],
                      child: Row(
                        children: <Widget>[
                          Image.asset('./assets/images/No_pic.png'),   
                          Flexible(
                            child:Container(
                            //color: Colors.pink[200],
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget> [
                                Container(
                                  child: Text(
                                    '@${mention.author.name}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ),
                                Container(
                                  child: Text(
                                    '${mention.author.rank}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal
                                    ),
                                  )
                                ),
                              ],
                            )
                          ))
                        ],
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
                                  '${mention.type}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal
                                  ),
                                )
                              ),
                              Container(
                                child: Text(
                                  '${TimeAgo.timeAgoSinceDate(mention.dop)}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal
                                  ),
                                )
                              ),
                            ],
                          )
                    )
                  ),
                ]
              ),
            ),
            Container(
              //color: Colors.blue[200],
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: ParsedContent(mention.content, false)
                    ),
                  ),
                ],
              ),
            )
          ]
        )
      ),
    );
  }
}