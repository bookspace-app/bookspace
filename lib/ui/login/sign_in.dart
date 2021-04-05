import 'package:bookspace/controllers/user_controller.dart';
import 'package:bookspace/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bookspace/globals.dart' as globals;

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String password = '';
  bool isPasswordHiden = true;

  User _user;
  List<User> _users = [];
  int id;
  void getALLuser() async {
    List<User> users = await UserController.getAllusers();
    if (!disposed){
      setState(() => _users = users);
    }
    print(users);
  }

  void getUser(int id) async {
    User user = await UserController.getUser(id);
    if (!disposed){
      setState(() => _user = user);
    }
  }

  String errorUserName() {
    if (usernameController.text.isEmpty) return "Rellena este campo";
    for (var i = 0; i < _users.length; i++){
      if(usernameController.text == _users[i].username){
        id=_users[i].id;
        return null;
      }
    }
    return "No existe usuario, por favor regístrese primero";
  }

  String errorPass() {
    getUser(id);
    if (passwordController.text.isEmpty) return "Rellena este campo";
    //user.password check
    if (passwordController.text != _user.id) return "Contraseña incorrecta";
    return null;
  }

  bool disposed = false;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    disposed = true;
    usernameController.dispose();
    passwordController.dispose();
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
      backgroundColor: Color(0xf3f3f3f3),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 40.0, 0, 0),
              constraints: BoxConstraints.expand(
                height: 200.0,
              ),
              child: Image(
                image: AssetImage('assets/images/logo.png'),
              ),
            ),
            Container(
              constraints: BoxConstraints.expand(height: 50),
              child: TextField(
                controller: usernameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'Nombre de Usuario',
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            usernameController.clear();
                          });
                        })),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                constraints: BoxConstraints.expand(height: 50),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: isPasswordHiden,
                  decoration: InputDecoration(
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                          icon: isPasswordHiden
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              isPasswordHiden = !isPasswordHiden;
                            });
                          })),
                )),
            Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.grey.withOpacity(0.3),
                highlightColor: Colors.grey.withOpacity(0.3),
                onTap: () {
                  print('Inkwell');
                },
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.blue[200],
                    ),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Iniciar sesión con'),
                          Container(
                            constraints: BoxConstraints.expand(
                                height: 40.0, width: 60.0),
                            child: Image(
                              image: AssetImage('assets/images/google.png'),
                            ),
                          ),
                        ])),
              ),
            ),
            Container(
                height: 40,
                child: ElevatedButton(
                  onPressed: () => print('Inici de sessió'),
                  child: Text('Iniciar Sesión',
                      style: TextStyle(
                        color: Colors.black, /*fontFamily: "Schyler"*/
                      )),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orangeAccent,
                      onPrimary: Colors.black,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0))),
                )),
            Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  TextButton(
                      onPressed: () => print('Anar a recupesrar contrasenya'),
                      child: Text(
                        '¿Olvidaste tu contrasenya?',
                        style: TextStyle(color: Colors.black),
                      )),
                  TextButton(
                      onPressed: () => print('Registrarse'),
                      child: Text(
                        'Registrarse',
                        style: TextStyle(color: Colors.black),
                      ))
                ]))
          ]),
    );
  }
}
