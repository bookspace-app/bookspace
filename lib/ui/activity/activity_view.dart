import 'package:bookspace/controllers/mention_controller.dart';
import 'package:bookspace/models/mention.dart';
import 'package:bookspace/ui/activity/widgets/mention_card.dart';
import 'package:bookspace/ui/main_view.dart';
import 'package:bookspace/ui/publication/publication_view.dart';
import 'package:flutter/material.dart';
import 'package:bookspace/globals.dart' as globals;

class ActivityView extends StatefulWidget {
  final int id;
  ActivityView({Key key, this.id}) : super(key: key);

  @override
  _ActivityViewState createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> {

  // Mentions list
  List<Mention> _mentions = [];

  void getMentionsForCurrentUser(int id) async {
    // Backend get mentions
    List<Mention> mentions = await MentionController.getMentionsbyUserId(id);
    
    if (!disposed){
      setState(() => _mentions = mentions);
    }
  }

  @override
  void initState() { 
    super.initState();
    print('ID is ${globals.id}');
    if (globals.id != null) {
      getMentionsForCurrentUser(globals.id);
    } else {
      print('Calling dummy user [DEBUG MODE]');
      getMentionsForCurrentUser(1);
    }
  }

  bool disposed = false;
  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_mentions != null) {
      return Container(
        color: Color.fromRGBO(243, 247, 250, 1),
        child: ListView(
          children: List.generate(_mentions.length, (index) {
          return Column(children: <Widget>[
            //Container(height: (index == 0)?10:0),
            InkWell(
                child: Container(
                  padding: index == 0
                      ? EdgeInsets.all(15)
                      : EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: MentionCard(mention: _mentions[index]),
                ),
                onTap: () {
                  Navigator.push(
                    context, // TODO: pass id to PublicationView
                    MaterialPageRoute(
                      builder: (context) => MainView(
                        renderIndex: 'home',
                        view: PublicationView(
                          id: _mentions[index].id,
                          isPublication: (_mentions[index].type == 'publication'),
                        ),
                      )
                    ),
                  );
                }, 
              ),
          ]);
        })));
    } else {
      return Center(
        child: Container(
          child: Text('No hay mentions aun'),
        )
      );
    }
  }
}
