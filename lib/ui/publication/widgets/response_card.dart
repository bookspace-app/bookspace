import 'package:bookspace/models/comment.dart';
import 'package:bookspace/ui/main_view.dart';
import 'package:bookspace/ui/profile/profile_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bookspace/globals.dart' as globals;

class ResponseCard extends StatelessWidget {

  final Comment response;

  ResponseCard({
    Key key,
    this.response
  }) : super(key: key);

  Widget build(BuildContext context) {

    Widget ParsedContent(String content, bool atTitle) {

      RegExp usernameExp = new RegExp(r"\@\w+");
      Iterable<Match> usernameMatches = usernameExp.allMatches(content);
      List<String> usernames = [];
      usernameMatches.forEach((m)=>usernames.add(m.group(0)));
      RegExp wordsExp = new RegExp(r"[^\@\w+]|[-'a-zA-ZÀ-ÖØ-öø-ÿ-@-_]+|[!$%^&*()_+|~=`{}#@\[\]:;'’<>?,.\/"
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
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print(m.group(0));
                  Navigator.push(
                    context, // TODO: pass id to PublicationView
                    MaterialPageRoute(
                      builder: (context) => MainView(
                        renderIndex: 'home',
                        view: ProfileView(
                          username: m.group(0).substring(1),
                        ),
                      )
                    ),
                  );
                })
            : TextSpan(
              text: '${m.group(0)}', 
              style: TextStyle(
                fontWeight: atTitle? FontWeight.bold: FontWeight.normal,
                fontSize: atTitle? 20: 16,
                color: globals.theme ? Colors.black : Colors.white
              )
            )
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
       child: Container(
           padding: EdgeInsets.all(10),
            //color: Colors.blue[200],
            child: ParsedContent(response.content, false),
          )
    );
  }
}