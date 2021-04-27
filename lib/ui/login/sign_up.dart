import 'dart:developer';

import 'package:bookspace/controllers/user_controller.dart';
import 'package:bookspace/models/user.dart';
import 'package:bookspace/app_localizations.dart';
import 'package:bookspace/ui/login/sign_up2.dart';
import 'package:bookspace/ui/main_view.dart';
import 'package:bookspace/ui/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bookspace/globals.dart' as globals;

/*class Datos {
  String username;
  String name;
  String email;

  Datos(this.username, this.name, this.email);
}*/

class SignUp extends StatefulWidget {
  //Datos datos;
  //SignUp({Key key, @required this.datos}) : super(key: key);
  SignUp({Key key}) : super(key: key);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var userNameController = TextEditingController();
  var nameController = TextEditingController();
  var surNameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var passRController = TextEditingController();

  bool errorsUserName = false;
  bool errorsName = false;
  bool errorsSurName = false;
  bool errorsEmail = false;
  bool errorsPass = false;
  bool errorsPassR = false;
  bool errorsAll = false;

  User _user;
  List<User> _users = [];
  int id;
  //List<String> datos = [];

  static get username => null;

  void getALLuser() async {
    List<User> users = await UserController.getAllusers();
    if (!disposed) {
      setState(() => _users = users);
    }
    print(users);
  }

  Future<void> postUser(
      String username, String name, String email, String pass) async {
    User user = await UserController.postUser(username, name, email, pass);
    if (!disposed) {
      setState(() {
        _user = user;
        id = user.id;
      });
    }
    print(_user);
  }
  /*Future<void> postUser(
      String username, String name, String email, String pass) async {
    User user = await UserController.postUser(username, name, email, pass);
    if (!disposed) {
      setState(() => _user = user);
    }
    print(_user);
  }*/
  /*
  List<String> datosUsr() {
    return datos;
  }*/

  //Error Check
  String errorUserName() {
    if (userNameController.text.isEmpty)
      return "${AppLocalizations.of(context).translate("emptyField")}";
    else if (userNameController.text.length < 4)
      return "${AppLocalizations.of(context).translate("shortUName")}";
    else if (userNameController.text.length > 15)
      return "${AppLocalizations.of(context).translate("longUName")}";
    for (var i = 0; i < _users.length; i++) {
      if (userNameController.text == _users[i].username)
        return "${AppLocalizations.of(context).translate("usedUName")}";
    }
    return null;
  }

  String errorName() {
    if (nameController.text.isEmpty)
      return "${AppLocalizations.of(context).translate("emptyField")}";
    else if (nameController.text.length < 2)
      return "${AppLocalizations.of(context).translate("shortName")}";
    else if (nameController.text.length > 20)
      return "${AppLocalizations.of(context).translate("longName")}";
    return null;
  }

  String errorSurName() {
    if (surNameController.text.isEmpty)
      return "${AppLocalizations.of(context).translate("emptyField")}";
    else if (surNameController.text.length < 2)
      return "${AppLocalizations.of(context).translate("shortSurname")}";
    else if (surNameController.text.length > 20)
      return "${AppLocalizations.of(context).translate("longSurname")}";
    return null;
  }

  String errorEmail() {
    if (emailController.text.isEmpty)
      return "${AppLocalizations.of(context).translate("emptyField")}";
    else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text)) {
      return "${AppLocalizations.of(context).translate("invalidEmail")}";
    }
    for (var i = 0; i < _users.length; i++) {
      if (emailController.text == _users[i].email)
        return "${AppLocalizations.of(context).translate("usedEmail")}";
    }
    return null;
  }

  String errorPass() {
    if (passController.text.isEmpty)
      return "${AppLocalizations.of(context).translate("emptyField")}";
    else if (passController.text.length < 6)
      return "${AppLocalizations.of(context).translate("shortPass")}";
    else if (passController.text.length > 20)
      return "${AppLocalizations.of(context).translate("longPass")}";
    else if (!RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~?.,]).{6,}$')
        .hasMatch(passController.text)) {
      return "${AppLocalizations.of(context).translate("invalidPass")}";
    }
    return null;
  }

  String errorPassR() {
    if (passRController.text.isEmpty)
      return "${AppLocalizations.of(context).translate("emptyField")}";
    else if (passRController.text != passController.text)
      return "${AppLocalizations.of(context).translate("nomatchPass")}";
    return null;
  }

  bool disposed = false;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    disposed = true;
    userNameController.dispose();
    nameController.dispose();
    surNameController.dispose();
    emailController.dispose();
    passController.dispose();
    passRController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getALLuser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //1 Columna dividida en 8 Filas; 1 con el titulo, 6 con campo de texto, 1 con botón
        appBar: AppBar(),
        body: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(30, 30, 10, 0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //Center Row contents vertically,
                  children: <Widget>[
                    Text(
                      "Registro",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 40, 30, 15),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //Center Row contents vertically,
                  children: <Widget>[
                    Expanded(
                        child: TextFormField(
                            controller: userNameController,
                            onChanged: (text) {
                              setState(() {});
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText:
                                    'Nombre de Usuario', //to-do Emoji handling
                                prefixIcon:
                                    Icon(Icons.person), //to-do Traduciones
                                errorText: errorsAll ? errorUserName() : null,
                                suffixIcon: userNameController.text.length > 0
                                    ? IconButton(
                                        icon: Icon(Icons.clear),
                                        onPressed: () {
                                          setState(() {
                                            userNameController.clear();
                                          });
                                        })
                                    : null)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 1, 30, 15),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //Center Row contents vertically,
                  children: <Widget>[
                    Expanded(
                        child: TextFormField(
                            controller: nameController,
                            onChanged: (text) {
                              setState(() {});
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Nombre',
                                prefixIcon: Icon(Icons.person),
                                errorText: errorsAll ? errorName() : null,
                                suffixIcon: nameController.text.length > 0
                                    ? IconButton(
                                        icon: Icon(Icons.clear),
                                        onPressed: () {
                                          setState(() {
                                            nameController.clear();
                                          });
                                        })
                                    : null)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 1, 30, 15),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //Center Row contents vertically,
                  children: <Widget>[
                    Expanded(
                        child: TextFormField(
                            controller: surNameController,
                            onChanged: (text) {
                              setState(() {});
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Apellido',
                                prefixIcon: Icon(Icons.person),
                                errorText: errorsAll ? errorSurName() : null,
                                suffixIcon: surNameController.text.length > 0
                                    ? IconButton(
                                        icon: Icon(Icons.clear),
                                        onPressed: () {
                                          setState(() {
                                            surNameController.clear();
                                          });
                                        })
                                    : null)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 1, 30, 15),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //Center Row contents vertically,
                  children: <Widget>[
                    Expanded(
                        child: TextFormField(
                            controller: emailController,
                            onChanged: (text) {
                              setState(() {});
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Correo Electrónico',
                                prefixIcon: Icon(Icons.mail),
                                errorText: errorsAll ? errorEmail() : null,
                                suffixIcon: emailController.text.length > 0
                                    ? IconButton(
                                        icon: Icon(Icons.clear),
                                        onPressed: () {
                                          setState(() {
                                            emailController.clear();
                                          });
                                        })
                                    : null)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 1, 30, 15),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //Center Row contents vertically,
                  children: <Widget>[
                    Expanded(
                        child: TextFormField(
                            controller: passController,
                            onChanged: (text) {
                              setState(() {});
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Contraseña',
                                prefixIcon: Icon(Icons.lock),
                                errorText: errorsAll ? errorPass() : null,
                                suffixIcon: passController.text.length > 0
                                    ? IconButton(
                                        icon: Icon(Icons.clear),
                                        onPressed: () {
                                          setState(() {
                                            passController.clear();
                                          });
                                        })
                                    : null)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 1, 30, 15),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //Center Row contents vertically,
                  children: <Widget>[
                    Expanded(
                        child: TextFormField(
                            controller: passRController,
                            onChanged: (text) {
                              setState(() {});
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Repetir Contraseña',
                                prefixIcon: Icon(Icons.lock),
                                errorText: errorsAll ? errorPassR() : null,
                                suffixIcon: passRController.text.length > 0
                                    ? IconButton(
                                        icon: Icon(Icons.clear),
                                        onPressed: () {
                                          setState(() {
                                            passRController.clear();
                                          });
                                        })
                                    : null)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 30, 30, 30),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.end, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //Center Row contents vertically,
                  children: <Widget>[
                    SizedBox(
                        width: 150,
                        height: 35,
                        child: RaisedButton(
                            textColor: Colors.white,
                            color: Colors.blue,
                            child: Text('Siguiente'),
                            onPressed: () {
                              setState(() {
                                if (errorUserName() != null)
                                  errorsUserName = true;
                                else
                                  errorsUserName = false;
                                if (errorName() != null)
                                  errorsName = true;
                                else
                                  errorsName = false;
                                if (errorSurName() != null)
                                  errorsSurName = true;
                                else
                                  errorsSurName = false;
                                if (errorEmail() != null)
                                  errorsEmail = true;
                                else
                                  errorsEmail = false;
                                if (errorPass() != null)
                                  errorsPass = true;
                                else
                                  errorsPass = false;
                                if (errorPassR() != null)
                                  errorsPassR = true;
                                else
                                  errorsPassR = false;
                                errorsAll = errorsUserName |
                                    errorsName |
                                    errorsSurName |
                                    errorsEmail |
                                    errorsPass |
                                    errorsPassR;
                              });
                              if (!errorsAll) {
                                /*datos.add(userNameController.text);
                                datos.add(nameController.text +
                                    surNameController.text);
                                datos.add(emailController.text); */

                                postUser(
                                  userNameController.text,
                                  nameController.text +
                                      ' ' +
                                      surNameController.text,
                                  emailController.text,
                                  passController.text,
                                );
                                print(1919 + id);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp2(
                                            id: id,
                                          )),
                                );
                              }
                              /*
                          //
                          FutureBuilder<User>(
                          future: _user,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(snapshot.data.username);
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            return CircularProgressIndicator();
                          },
                        ); */
                            }))
                  ],
                ),
              ),
            ]));
  }
}
