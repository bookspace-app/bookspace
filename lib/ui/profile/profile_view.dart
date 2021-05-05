import 'package:bookspace/controllers/publication_controller.dart';
import 'package:bookspace/controllers/user_controller.dart';
import 'package:bookspace/models/publication.dart';
import 'package:bookspace/models/user.dart';
import 'package:bookspace/ui/main_view.dart';
import 'package:bookspace/ui/publication/publication_view.dart';
import 'package:bookspace/ui/publication/widgets/publication_card.dart';
import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:bookspace/globals.dart' as globals;
import 'package:intl/intl.dart';

class ProfileView extends StatefulWidget {
  final int id;
  ProfileView({Key key, this.id}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  User _user;
  List<Publication> _myPublications = [];

  void getUser() async {
    User user = await UserController.getUser(globals.id);
    if (!disposed) {
      setState(() => _user = user);
      getPublications(_user);
      print(globals.id);
    }
  }

  void getPublications(User user) async {
    // TODO: backend get publis
    List<Publication> myPublications =
        await PublicationController.getPublications(user.myPublicationsUri);
    if (!disposed) {
      setState(() => _myPublications = myPublications);
    }
    _myPublications.sort((a, b) {
      return -a.dop.compareTo(b.dop);
    });
  }

  @override
  void initState() {
    super.initState();
    getUser();
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
      return ListView(children: <Widget>[
        Container(
          //TO-DO Test containers paddings with different lenght fields
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.fromLTRB(15, 15, 10, 2),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                './assets/images/No_pic.png', //TO-DO if userpic == null show No_pic else userpic
                                height: 170,
                                width: 170,
                                fit: BoxFit.fill,
                              ),
                            )),
                      ]),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 15, 5, 0),
                        child: Text(
                          "@" + "${_user.username}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                          child: Text(
                            "${_user.name}",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                          //color: Colors.orange,
                          width: 185,
                          height:
                              100, //TO-DO Reducir tamaño maximo de la descripcion
                          child: Text("${_user.description}",
                              //"Soy vividor, soñador, amante de las novelas policíacas y el dramatismo.",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.0,
                              ))),
                      Container(
                          padding: EdgeInsets.fromLTRB(5, 20, 5,
                              0), //TO-DO Fix the container to a position no matter description length
                          child: RichText(
                            text: new TextSpan(
                              style: new TextStyle(
                                color: Colors.grey,
                              ),
                              children: <TextSpan>[
                                new TextSpan(
                                    text: "${_user.rank}",
                                    style: new TextStyle(
                                        fontWeight: FontWeight
                                            .bold)), //TO-DO Añadir fecha registro
                                new TextSpan(
                                    text: " · " +
                                        "Se unió al día\n" +
                                        "${DateFormat.yMd().format(_user.dor)}"),
                              ],
                            ),
                          ))
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    //color: Colors.orange,
                    padding: EdgeInsets.fromLTRB(15, 5, 10, 0),
                    child: Text(
                      "Tags favoritos",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    //color: Colors.orange,
                    padding: EdgeInsets.fromLTRB(15, 5, 10,
                        0), //Para cada tag recibida de la api un campo de texto con fondo gris y letras blancas, padding entre ellos
                    child: Text(
                      "Tag box placeholder",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
            child: Text(
              'Mis publicaciones',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            )),
        for (var index = 0; index < _myPublications.length; index++)
          Column(
              //TO-DO Add left padding (15) & right padding (?) to publication cards
              children: <Widget>[
                Container(height: (index == 0) ? 10 : 0),
                InkWell(
                  child: PublicationCard(publication: _myPublications[index]),
                  onTap: () {
                    Navigator.push(
                      context, // TODO: pass id to PublicationView
                      MaterialPageRoute(
                          builder: (context) => MainView(
                                renderIndex: 'profile',
                                view: PublicationView(
                                    id: _myPublications[index].id),
                              )),
                    );
                  }, // on tap llevar a la view de la publicacion
                ),
                Divider()
              ])
      ]);
      /*Container(
       child: Text('hello ${_user.username}'),
      );*/
    } else {
      return Container(child: Center(child: CircularProgressIndicator()));
    }
  }
}
