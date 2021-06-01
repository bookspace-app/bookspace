import 'package:bookspace/app_localizations.dart';
import 'package:bookspace/controllers/user_controller.dart';
import 'package:bookspace/ui/home/home_view.dart';
import 'package:bookspace/ui/login/sign_in.dart';
import 'package:bookspace/ui/profile/edit_profile_view.dart';
import 'package:bookspace/ui/profile/profile_view.dart';
import 'package:bookspace/utils/get_swatch.dart';
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

  Future<bool> logout(int id, String auth) async {
    return UserController.logout(id, auth);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
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
                "${AppLocalizations.of(context).translate("changestyle")}: ",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: LiteRollingSwitch(
                  value: globals.theme,
                  textOn: "${AppLocalizations.of(context).translate("day")}",
                  textOff: "${AppLocalizations.of(context).translate("night")}",
                  colorOn: Colors.yellow[400],
                  colorOff: Colors.blueGrey[500],
                  iconOn: Icons.wb_sunny_outlined,
                  iconOff: FontAwesome5.moon,
                  textSize: 18,
                  onChanged: (bool position) {
                    globals.theme = position ? true : false;
                    globals.theme_1 = globals.theme
                        ? getMaterial(0xFFF3F7FA)
                        : getMaterial(0xFF46484A);
                  },
                ),
              ),
            ],
          ),
          Divider(thickness: 3, height: 30),
          Container(
            child: ElevatedButton(
              child: Text(
                '${AppLocalizations.of(context).translate("logout")}',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(250, 198, 65, 1),
                  onPrimary: Color.fromRGBO(250, 198, 65, 1),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0))),
              onPressed: () {
                logout(globals.id, globals.token);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignIn()),
                );
              },
            ),
          ),
          Divider(thickness: 3, height: 30),
          Container(
            child: ElevatedButton(
              child: Text(
                'Go back',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(250, 198, 65, 1),
                  onPrimary: Color.fromRGBO(250, 198, 65, 1),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0))),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    ));
  }
}
