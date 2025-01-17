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
//import 'package:flutter_string_encryption/flutter_string_encryption.dart';

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
  var yearController = TextEditingController();
  var monthController = TextEditingController();
  var dayController = TextEditingController();

  String key, password;
  String encrypt, decrypt;
  //PlatformStringCryptor cryptor;

  bool errorsUserName = false;
  bool errorsName = false;
  bool errorsSurName = false;
  bool errorsEmail = false;
  bool errorsPass = false;
  bool errorsPassR = false;
  bool errorsDob_d = false;
  bool errorsDob_m = false;
  bool errorsDob_y = false;
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
  }

  Future<void> postUser(String username, String name, String email, String pass,
      String dob) async {
    User user = await UserController.postUser(username, name, email, pass, dob);
    if (!disposed) {
      setState(() {
        _user = user;
      });
    }
    setState(() {
      id = user.id;
    });
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
  String errorDob_d() {
    if (dayController.text.isEmpty) {
      return "${AppLocalizations.of(context).translate("emptyField")}";
    } else if (dayController.text.length > 2) {
      return "${AppLocalizations.of(context).translate("wrongformatdate")}";
    } else {
      return null;
    }
  }

  String errorDob_m() {
    if (monthController.text.isEmpty) {
      return "${AppLocalizations.of(context).translate("emptyField")}";
    } else if (monthController.text.length > 2) {
      return "${AppLocalizations.of(context).translate("wrongformatdate")}";
    } else {
      return null;
    }
  }

  String errorDob_y() {
    if (yearController.text.isEmpty) {
      return "${AppLocalizations.of(context).translate("emptyField")}";
    } else if (yearController.text.length != 4) {
      return "${AppLocalizations.of(context).translate("wrongformatdate")}";
    } else {
      return null;
    }
  }

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
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~?.,_-]).{6,}$')
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
                      "${AppLocalizations.of(context).translate("register")}",
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
                                    '${AppLocalizations.of(context).translate("username")}', //to-do Emoji handling
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
                                labelText: '${AppLocalizations.of(context).translate("name")}',
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
                                labelText: '${AppLocalizations.of(context).translate("surname")}',
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
                                labelText: 'Email',
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
                                labelText: '${AppLocalizations.of(context).translate("password")}',
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
                  crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
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
                                labelText: '${AppLocalizations.of(context).translate("repeatpass")}',
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
                padding: EdgeInsets.fromLTRB(30, 1, 30, 15),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //Center Row contents vertically,
                  children: <Widget>[
                    Expanded(
                      child: Text("${AppLocalizations.of(context).translate("dob")}"),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    constraints: BoxConstraints.expand(height: 50, width: 60),
                    child: TextField(
                      controller: dayController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "DD",
                        errorText: errorsAll ? errorDob_d() : null,
                      ),
                    ),
                  ),
                  Text("-"),
                  Container(
                    constraints: BoxConstraints.expand(height: 50, width: 60),
                    child: TextField(
                      controller: monthController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "MM",
                        errorText: errorsAll ? errorDob_m() : null,
                      ),
                    ),
                  ),
                  Text("-"),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    constraints: BoxConstraints.expand(height: 50, width: 100),
                    child: TextField(
                      controller: yearController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "YYYY",
                        errorText: errorsAll ? errorDob_y() : null,
                      ),
                    ),
                  )
                ],
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
                            child: Text('${AppLocalizations.of(context).translate("next")}'),
                            onPressed: () {
                              setState(() {
                                //encryption();
                                //decryption();
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
                                if (errorDob_d() != null)
                                  errorsDob_d = true;
                                else
                                  errorsDob_d = false;
                                if (errorDob_m() != null)
                                  errorsDob_m = true;
                                else
                                  errorsDob_m = false;
                                if (errorDob_y() != null)
                                  errorsDob_d = true;
                                else
                                  errorsDob_y = false;
                                errorsAll = errorsUserName |
                                    errorsName |
                                    errorsSurName |
                                    errorsEmail |
                                    errorsPass |
                                    errorsPassR |
                                    errorsDob_d |
                                    errorsDob_m |
                                    errorsDob_y;
                              });
                              if (!errorsAll) {
                                /*datos.add(userNameController.text);
                                datos.add(nameController.text +
                                    surNameController.text);
                                datos.add(emailController.text); */
                                String dob = yearController.text +
                                    "-" +
                                    monthController.text +
                                    "-" +
                                    dayController.text;
                                postUser(
                                        userNameController.text,
                                        nameController.text +
                                            ' ' +
                                            surNameController.text,
                                        emailController.text,
                                        passController.text,
                                        dob)
                                    .then((value) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp2(
                                              id: _user.id,
                                            )),
                                  );
                                });
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
/*
  void encryption() async {
    cryptor = new PlatformStringCryptor();
    final String salt = await cryptor.generateSalt();
    password = passController.text;
    key = await cryptor.generateKeyFromPassword(password, salt);
    encrypt = await cryptor.encrypt(password, key);
    print(encrypt);
    print(key);
  }

  void decryption() async {
    try {
      decrypt = await cryptor.decrypt(encrypt, key);
      print(decrypt);
    } catch (error) {}
  }*/
}
