import 'dart:io';
import 'package:bookspace/app_localizations.dart';
import 'package:bookspace/ui/login/sign_in.dart';
import 'package:bookspace/ui/login/sign_up.dart';
import 'package:bookspace/controllers/user_controller.dart';
import 'package:bookspace/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:image_picker/image_picker.dart';

import 'package:bookspace/globals.dart' as globals;

class SignUp2 extends StatefulWidget {
  final int id;

  SignUp2({Key key, this.id}) : super(key: key);

  @override
  _SignUp2State createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  var descController = TextEditingController();

  File _image;
  final picker = ImagePicker();
  User _user;
  List<String> categories;

  void updateCategories(List<String> categories, int id) {
    UserController.updateCategories(categories, id, globals.token);
  }

  void updateDesc(String descp, int id) async {
    UserController.updateDesc(descp, id);
  }

  Future getImageCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  Future getImageGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  Future erraseImage() async {
    setState(() {
      _image = null;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('${AppLocalizations.of(context).translate("gallery")}'),
                      onTap: () {
                        getImageGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('${AppLocalizations.of(context).translate("camera")}'),
                    onTap: () {
                      getImageCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                  new ListTile(
                    leading: new Icon(Icons.clear),
                    title: new Text('${AppLocalizations.of(context).translate("errasepic")}'),
                    onTap: () {
                      erraseImage();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
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
        appBar: AppBar(),
        body: ListView(children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment:
                  CrossAxisAlignment.center, //Center Row contents vertically,
              children: <Widget>[
                Text(
                  "${AppLocalizations.of(context).translate("profilepic")}", //to-do TRADUCIONES
                  style: TextStyle(
                      color: Colors.black, //to-do Cambiar color letras
                      fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment:
                  CrossAxisAlignment.center, //Center Row contents vertically,
              children: <Widget>[
                SizedBox(
                  height: 32,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      _showPicker(context);
                    },
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: globals.primary,
                      child: _image != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.file(
                                _image,
                                width: 110,
                                height: 110,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(60)),
                              width: 110,
                              height: 110,
                              child: Icon(
                                Icons.add_a_photo,
                                size: 30,
                                color: Colors.grey[800],
                              ),
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 10, 0),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment:
                  CrossAxisAlignment.center, //Center Row contents vertically,
              children: <Widget>[
                Text(
                  "${AppLocalizations.of(context).translate("descripcion")}:", //to-do TRADUCIONES
                  style: TextStyle(
                      color: Colors.black, //to-do Cambiar color letras
                      fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: Row(
                  //width: ,
                  //height: 10,
                  children: <Widget>[
                    Expanded(
                        child: TextFormField(
                            controller: descController,
                            onChanged: (text) {
                              setState(() {});
                            },
                            keyboardType: TextInputType.multiline,
                            maxLines: 8,
                            inputFormatters: [
                              new LengthLimitingTextInputFormatter(500),
                            ],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText:
                                    "${AppLocalizations.of(context).translate("userdescdesc")}",
                                counterText:
                                    '${descController.text.length}' + '/500'))),
                  ])),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 10, 0),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment:
                  CrossAxisAlignment.center, //Center Row contents vertically,
              children: <Widget>[
                Text(
                  "${AppLocalizations.of(context).translate("favgenres")}:", //to-do TRADUCIONES
                  style: TextStyle(
                      color: Colors.black, //to-do Cambiar color letras
                      fontSize: 14),
                ),
              ],
            ),
          ),
          Container(
              //color: Colors.orange,
              padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: TextFieldTags(
                  tagsStyler: TagsStyler(
                      tagTextStyle: TextStyle(fontWeight: FontWeight.bold),
                      tagDecoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      tagCancelIcon: Icon(Icons.cancel,
                          size: 18.0, color: Colors.blue[900]),
                      tagPadding: const EdgeInsets.all(6.0)),
                  textFieldStyler: TextFieldStyler(
                      isDense: false,
                      helperText: "",
                      hintText: '${AppLocalizations.of(context).translate("favgenresdesc")}'),
                  onTag: (tag) {
                    //categories.add(tag);
                  },
                  onDelete: (tag) {
                    /*bool trobat = false;
                    for (int i = 0; i < categories.length && !trobat; i++) {
                      if (categories[i] == tag) {
                        categories.removeAt(i);
                        trobat = true;
                      }
                    }*/
                  })),
          Container(
            //color: Colors.pink,
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment:
                  CrossAxisAlignment.center, //Center Row contents vertically,
              children: <Widget>[
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: 35,
                    child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text('${AppLocalizations.of(context).translate("completeregister")}'),
                        onPressed: () {
                          print(widget.id);
                          updateDesc(descController.text, widget.id);
                          //updateCategories(categories, widget.id);
                          //TO-DO Puts descripcion, tags favoritas, profile pic
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignIn()),
                          );
                        }))
              ],
            ),
          ),
        ]));
  }
}
