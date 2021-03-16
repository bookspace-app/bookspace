import 'package:bookspace/app_localizations.dart';
import 'package:bookspace/ui/login/sign_up2.dart';
import 'package:bookspace/ui/main_view.dart';
import 'package:bookspace/ui/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bookspace/globals.dart' as globals;


class SignUp extends StatefulWidget {
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

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(            //1 Columna dividida en 8 Filas; 1 con el titulo, 6 con campo de texto, 1 con botón
      appBar: AppBar(),
      body: ListView( 
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Padding(
            padding: EdgeInsets.fromLTRB(30, 30, 10, 0),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
              children: <Widget>[
                Text ("Registro",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 40, 30, 15),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
              children: <Widget>[
                Expanded(child: TextFormField(
                  controller: userNameController,
                  onChanged: (text) {
                    setState(() {
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre de Usuario',
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: userNameController.text.length > 0 ?
                      IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            userNameController.clear();
                          });
                        })
                      : null   
                  )
                ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 1, 30, 15),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
              children: <Widget>[
                Expanded(child: TextFormField(
                  controller: nameController,
                  onChanged: (text) {
                    setState(() {
                      //inputText = text;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre',
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: nameController.text.length > 0 ?
                      IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            nameController.clear();
                          });
                        })
                      : null   
                  )
                ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 1, 30, 15),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
              children: <Widget>[
                Expanded(child: TextFormField(
                  controller: surNameController,
                  onChanged: (text) {
                    setState(() {
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Apellidos',
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: surNameController.text.length > 0 ?
                      IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            surNameController.clear();
                          });
                        })
                      : null   
                  )
                ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 1, 30, 15),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
              children: <Widget>[
                Expanded(child: TextFormField(
                  controller: emailController,
                  onChanged: (text) {
                    setState(() {
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Correo Electrónico',
                    prefixIcon: Icon(Icons.mail),
                    suffixIcon: emailController.text.length > 0 ?
                      IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            emailController.clear();
                          });
                        })
                      : null   
                  )
                ))
              ],
            ),
          ),       
          Padding(
            padding: EdgeInsets.fromLTRB(30, 1, 30, 15),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
              children: <Widget>[
                Expanded(child: TextFormField(
                  controller: passController,
                  onChanged: (text) {
                    setState(() {
                    });
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contraseña',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: passController.text.length > 0 ?
                      IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            passController.clear();
                          });
                        })
                      : null   
                  )
                ))
              ],
            ),
          ),      
          Padding(
            padding: EdgeInsets.fromLTRB(30, 1, 30, 15),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
              children: <Widget>[
                Expanded(child: TextFormField(
                  controller: passRController,
                  onChanged: (text) {
                    setState(() {
                    });
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Repetir Contraseña',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: passRController.text.length > 0 ?
                      IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            passRController.clear();
                          });
                        })
                      : null   
                  )
                ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 30, 30, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end, //Center Row contents horizontally,
              crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
              children: <Widget>[
                SizedBox(
                  width: 150,
                  height: 35,
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text('Siguiente'),
                      onPressed: () {
                        Navigator.push(
                          context, // TODO: pass id to PublicationView
                          MaterialPageRoute(
                            builder: (context) => SignUp2() 
                          ),
                        );
                        
                      //Hacer cosas e ir a la siguiente pantalla de registro
                    }
                  )
                )  
              ],
            ),
          ),
        ]
      )
    );  
  }
}

