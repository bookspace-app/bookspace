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
            constraints: BoxConstraints.expand(height: 40, width: 100),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: 'Nombre',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          nameController.clear();
                        });
                      })),
            ),
          ),
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
            constraints: BoxConstraints.expand(height: 40, width: 100),
            child: TextField(
              controller: surnameController,
              decoration: InputDecoration(
                  hintText: 'Apellidos',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          surnameController.clear();
                        });
                      })),
            ),
          ),
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
            constraints: BoxConstraints.expand(height: 40, width: 100),
            child: TextField(
              controller: usernameController,
              decoration: InputDecoration(
                  hintText: 'Nombre de usuario',
                  border: OutlineInputBorder(),
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
            margin: EdgeInsets.fromLTRB(0, 15, 0, 5),
            child: Text(
              'Contraseña',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints.expand(height: 40, width: 100),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'Contraseña',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          passwordController.clear();
                        });
                      })),
            ),
          ),
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
            constraints: BoxConstraints.expand(height: 40, width: 100),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          emailController.clear();
                        });
                      })),
            ),
          ),
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
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tags',
                border: OutlineInputBorder(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
