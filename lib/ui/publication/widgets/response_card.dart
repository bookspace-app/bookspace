import 'package:flutter/material.dart';

class ResponseCard extends StatelessWidget {
  ResponseCard({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
       child: Container(
           padding: EdgeInsets.all(10),
            //color: Colors.blue[200],
            child: Text(
              "And even though it can be quite challenging and quite difficult to do these things, we have to make time. We have to find the strength and courage to be bring awareness into our lives and be true to ourselves, because if we don’t… if we don’t seek to find, to know and to understand the purpose of life and the reason of our existence, chances are that we will continue to live by default, betraying ourselves and thinking that it’s okay to walk on a path that is not ours to walk upon.",
              style: TextStyle(),
            )
          )
    );
  }
}