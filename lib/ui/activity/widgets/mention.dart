import 'package:bookspace/utils/humanize.dart';
import 'package:flutter/material.dart';

class Mention extends StatelessWidget {
  const Mention({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Expanded(
                    flex: 8,
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
                                    '@{author.username}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                ),
                                Container(
                                  child: Text(
                                    '{author.rank}',
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
                                  //'{TimeAgo.timeAgoSinceDate(dop)}',
                                  'Hace 1 segundo',
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
                      child: Text("Life itself is an exciting gift no matter how unhappy, brutal, boring and torturing It is because without life you exist nowhere, you feel nothing and you are nothing. So, Life actually gives you the chance to go for an adventure of finding happiness for yourself and to find the happiness you have to feel the sadness of life which is the only way to find happiness. And, In between this endless cycle of happiness and sadness life exists.")
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