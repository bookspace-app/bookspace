import 'package:bookspace/controllers/publication_controller.dart';
import 'package:bookspace/controllers/user_controller.dart';
import 'package:bookspace/models/publication.dart';
import 'package:bookspace/models/user.dart';
import 'package:bookspace/ui/main_view.dart';
import 'package:bookspace/ui/publication/publication_view.dart';
import 'package:bookspace/ui/publication/widgets/publication_card.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  User _user;
  List<Publication> _publications = [
    Publication(title: 'Hola', content: 'Hola2', dop: DateTime.parse("2021-03-30")),
    Publication(title: 'Hola', content: 'Hola2', dop: DateTime.parse("1999-04-30")),
    Publication(title: 'The New Age typically adopts a belief n a holistic form of divinity that imbues all of the universe, including human beings themselves. There is thus a strong emphasis on the spiritual authority of the self.', content: 'Theologically, the New Age typically adopts a belief in a holistic form of divinity that imbues all of the universe, including human beings themselves. There is thus a strong emphasis on the spiritual authority of the self.', dop: DateTime.parse("2020-12-30"))
  ];

  void getUser() async {
    User user = await UserController.getUser(1);
    if (!disposed){
      setState(() => _user = user);
    }
    print(_user);
  }

  void getPublications(String genre) async {
    // TODO: backend get publis
    List<Publication> publications = await PublicationController.getPublications();
    print('LAS PUBLIS');
    print(publications);
    if (!disposed){
      //setState(() => _publications = publications);
    }
    _publications.sort((a,b) {
      return -a.dop.compareTo(b.dop);
    });
    print(_publications);
  }

  @override
  void initState() { 
    super.initState();
    getUser();
    getPublications('h');
  }

  bool disposed = false;
  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_user != null) {
      return ListView( 
        children: <Widget> [
          Container(),
          Container(
            child: Text('Mis publicaciones')
          ),
          for (var index = 0; index < _publications.length; index++) Column(
            children: <Widget>[
              Container(height: (index == 0)?10:0),
              InkWell(
                child: PublicationCard(
                  publication: _publications[index]
                ),
                onTap: () {
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
              ), 
              Divider() 
            ]
          )
        ]
      );
      /*Container(
       child: Text('hello ${_user.username}'),
      );*/
    } else {
      return Container(
       child: Center(
         child: CircularProgressIndicator()
       )
      );
    }
  }
}