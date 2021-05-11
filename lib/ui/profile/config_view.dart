import 'package:bookspace/controllers/user_controller.dart';
import 'package:bookspace/ui/login/sign_in.dart';
import 'package:bookspace/ui/profile/edit_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:bookspace/globals.dart' as globals;

import '../main_view.dart';

class ConfigView extends StatefulWidget {
  final int id;
  ConfigView({Key key, this.id}) : super(key: key);

  @override
  _ConfigViewState createState() => _ConfigViewState();
}

class _ConfigViewState extends State<ConfigView> {
  int idUser;

  void logout(int id) async {
    UserController.logout(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 50),
      child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Row(
            children: [
              Text(
                "Change screen mode: ",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: LiteRollingSwitch(
                  value: true,
                  textOn: "Day",
                  textOff: "Night",
                  colorOn: Colors.yellow[200],
                  colorOff: Colors.blueGrey[500],
                  iconOn: Icons.wb_sunny_outlined,
                  iconOff: FontAwesome5.moon,
                  textSize: 18,
                  onChanged: (bool position) {
                    print("the button is $position");
                  },
                ),
              ),
            ],
          ),
          Divider(thickness: 3, height: 30),
          Container(
            child: ElevatedButton(
              child: Text(
                'Log out',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                  onPrimary: Colors.black,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0))),
              onPressed: () {
                globals.id = idUser;
                print(globals.id);
                logout(globals.id);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignIn()),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
