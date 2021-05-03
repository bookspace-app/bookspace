import 'package:bookspace/ui/activity/widgets/mention.dart';
import 'package:flutter/material.dart';

class ActivityView extends StatefulWidget {
  final int id;
  ActivityView({Key key, this.id}) : super(key: key);

  @override
  _ActivityViewState createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromRGBO(243, 247, 250, 1),
        child: ListView(
            children: List.generate(10, (index) {
          return Column(children: <Widget>[
            //Container(height: (index == 0)?10:0),
            InkWell(
                child: Container(
                  padding: index == 0
                      ? EdgeInsets.all(15)
                      : EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: Mention(),
                ),
                onTap: () {
                  /*
                  Navigator.push(
                    context, // TODO: pass id to PublicationView
                    MaterialPageRoute(
                      builder: (context) => MainView(
                        renderIndex: 'home',
                        view: PublicationView(id: _publications[index].id),
                      )
                    ),
                  );
                }, // on tap llevar a la view de la publicacion
                */
                }),
          ]);
        })));
  }
}
