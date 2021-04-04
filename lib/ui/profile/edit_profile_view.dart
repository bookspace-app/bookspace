import 'package:bookspace/ui/profile/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bookspace/globals.dart' as globals;
import 'package:bookspace/ui/widgets/custom_input_box.dart';

class EditProfileView extends StatefulWidget {
  EditProfileView({Key key}) : super(key: key);

  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final bioController = TextEditingController();

  var _name;
  var _surname;
  var _username;
  var _password;
  var _email;
  var _bio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
            constraints: BoxConstraints.expand(height: 150.0, width: 200.0),
            child: Image(
              image: AssetImage('assets/images/No_pic.png'),
            ),
          ),
          /*
          Stack(
            children: <Widget>[
              Container(
                  constraints: BoxConstraints.expand(height: 120.0, width: 120.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: Image(
                    image: AssetImage('assets/images/google.png'),
                  ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Icon(Icons.favorite),
              )
            ],
          )
          */
          Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 5),
            child: Text(
              'Nombre',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
              constraints: BoxConstraints.expand(height: 50, width: 100),
              child: TextField(
                controller: nameController,
                style: TextStyle(
                    fontSize: 15,
                    //color: Color(0xff0962ff),
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Jaume',
                  hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[350],
                      fontWeight: FontWeight.w600),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          nameController.clear();
                        });
                      }),
                ),
              )),
          Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 5),
            child: Text(
              'Apellidos',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
              constraints: BoxConstraints.expand(height: 50, width: 100),
              child: TextField(
                controller: surnameController,
                style: TextStyle(
                    fontSize: 15,
                    //color: Color(0xff0962ff),
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Armengol Tapiolas',
                  hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[350],
                      fontWeight: FontWeight.w600),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          surnameController.clear();
                        });
                      }),
                ),
              )),
          Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 5),
            child: Text(
              'Nombre de usuario',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
              constraints: BoxConstraints.expand(height: 50, width: 100),
              child: TextField(
                controller: usernameController,
                style: TextStyle(
                    fontSize: 15,
                    //color: Color(0xff0962ff),
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'jaumearmen',
                  hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[350],
                      fontWeight: FontWeight.w600),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          usernameController.clear();
                        });
                      }),
                ),
              )),
          Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 5),
            child: Text(
              'Contraseña',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
              constraints: BoxConstraints.expand(height: 50, width: 100),
              child: TextField(
                controller: passwordController,
                style: TextStyle(
                    fontSize: 15,
                    //color: Color(0xff0962ff),
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[350],
                      fontWeight: FontWeight.w600),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          passwordController.clear();
                        });
                      }),
                ),
              )),
          Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 5),
            child: Text(
              'Email',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
              constraints: BoxConstraints.expand(height: 50, width: 100),
              child: TextField(
                controller: emailController,
                style: TextStyle(
                    fontSize: 15,
                    //color: Color(0xff0962ff),
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'jaume29at@gmail.com',
                  hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[350],
                      fontWeight: FontWeight.w600),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          emailController.clear();
                        });
                      }),
                ),
              )),
          MyCustomInputBox(
            label: 'Biografia',
            inputHint: 'Hola',
          ),
          /*Text('Biografia'),
          Container(
            constraints: BoxConstraints.expand(height: 40, width: 100),
            child: TextField(
              controller: bioController,
              decoration: InputDecoration(
                  hintText: 'Biografia',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          bioController.clear();
                        });
                      })),
            ),
          ),*/
          Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 5),
            child: Text(
              'Tags',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
              constraints: BoxConstraints.expand(height: 50, width: 100),
              child: TextField(
                //controller: emailController,
                style: TextStyle(
                    fontSize: 15,
                    //color: Color(0xff0962ff),
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Space & Aliens',
                  hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[350],
                      fontWeight: FontWeight.w600),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  /*suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          tagsController.clear();
                        });
                      }),*/
                ),
              )),
          Container(
              alignment: Alignment.bottomCenter,
              height: 40,
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _name = nameController.text;
                    _surname = surnameController.text;
                    _username = usernameController.text;
                    _email = emailController.text;
                    _password = passwordController.text;
                    _bio = bioController.text;

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileView()),
                    );
                  });
                },
                child: Text('Submit',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black, /*fontFamily: "Schyler"*/
                    )),
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    onPrimary: Colors.black,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0))),
              )),
        ],
      ),
    );
  }
}
