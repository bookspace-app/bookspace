import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bookspace/globals.dart' as globals;

class SignIn extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String password = '';
  bool isPasswordHiden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xf3f3f3f3),
      body: ListView(children: [
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
          margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 0),
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
                    icon: Icon(Icons.close),
                    onPressed: () => usernameController.clear())),
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
            constraints: BoxConstraints.expand(height: 50),
            child: TextField(
              controller: passwordController,
              obscureText: isPasswordHiden,
              decoration: InputDecoration(
                  labelText: 'Contraseña',
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () => _togglePasswordView())),
            )),
      ]),
    );
  }

  void _togglePasswordView() {
    isPasswordHiden = !isPasswordHiden;
  }
}
