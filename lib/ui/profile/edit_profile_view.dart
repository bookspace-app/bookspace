import 'dart:developer';
import 'dart:io';

import 'package:bookspace/controllers/user_controller.dart';
import 'package:bookspace/models/user.dart';
import 'package:bookspace/ui/main_view.dart';
import 'package:bookspace/ui/profile/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bookspace/globals.dart' as globals;
import 'package:bookspace/ui/widgets/custom_input_box.dart';
import 'package:image_picker/image_picker.dart';
import 'package:textfield_tags/textfield_tags.dart';

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

  bool isPasswordHiden = true;

  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  var _name;
  var _surname;
  var _username;
  var _password;
  var _email;
  var _bio;
  var _id;

  User _user;
  List<String> categories;

  void getUser() async {
    User user = await UserController.getUser(globals.id);
    if (!disposed) {
      setState(() => _user = user);
    }
    setState(() {
      nameController.text = _user.name;
      usernameController.text = _user.username;
      emailController.text = _user.email;
      bioController.text = _user.description;
    });
    _id = _user.id;
  }

  void getCategories() async {
    List<String> cat = await UserController.getCategories(globals.id);
    categories = cat;
  }

  void putUser(String username, name, email, descrition, int id) async {
    UserController.updateUser(username, name, email, descrition, id);
  }

  void updateCategories(List<String> categories, int id) {
    UserController.updateCategories(categories, id);
  }

  bool disposed = false;
  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getUser();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        children: [
          imageProfile(),
          Container(
            margin: EdgeInsets.fromLTRB(0, 25, 0, 5),
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
                  hintText: 'Nombre',
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
                  hintText: 'Nombre de usuario',
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
                  hintText: 'Email',
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
          Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 5),
            child: Text(
              'Biografia',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
              constraints: BoxConstraints.expand(height: 120, width: 100),
              child: TextFormField(
                controller: bioController,
                onChanged: (text) {
                  setState(() {});
                },
                keyboardType: TextInputType.multiline,
                maxLines: 8,
                inputFormatters: [
                  new LengthLimitingTextInputFormatter(500),
                ],
                style: TextStyle(
                    fontSize: 15,
                    //color: Color(0xff0962ff),
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Description',
                  hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[350],
                      fontWeight: FontWeight.w600),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  counterText: '${bioController.text.length}' + '/500',
                  suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          bioController.clear();
                        });
                      }),
                ),
              )),
          Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 5),
            child: Text(
              'Categories',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
              //color: Colors.orange,
              constraints: BoxConstraints.expand(height: 85, width: 100),
              child: TextFieldTags(
                  initialTags: ['hola', 'adeu'], //categories,
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
                      textFieldBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textFieldFocusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      helperText: "",
                      hintText: "put tags"),
                  onTag: (tag) {
                    categories.add(tag);
                  },
                  onDelete: (tag) {
                    bool trobat = false;
                    for (int i = 0; i < categories.length && !trobat; i++) {
                      if (categories[i] == tag) {
                        categories.removeAt(i);
                        trobat = true;
                      }
                    }
                  })),
          //BUTTON SUBMIT
          Container(
              alignment: Alignment.bottomCenter,
              height: 40,
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  //setState(() {
                  _name = nameController.text;
                  _username = usernameController.text;
                  _email = emailController.text;
                  _password = passwordController.text;
                  _bio = bioController.text;
                  putUser(_username, _name, _email, _bio, _id);
                  //updateCategories(categories, _id);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainView(
                              renderIndex: 'profile',
                              view: ProfileView(),
                            )),
                  );
                  //});
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

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: _imageFile == null
                ? AssetImage('assets/images/No_pic.png')
                : FileImage(File(_imageFile.path)),
            //AssetImage(_user.profilePicUri),
          ),
          Positioned(
              bottom: 20,
              right: 20,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: ((builder) => bottomSheet()),
                  );
                },
                child: Icon(
                  Icons.edit,
                  size: 30,
                ),
              )),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Text("Escoge una foto de perfil",
                style: TextStyle(
                  fontSize: 20,
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                    onPressed: () {
                      takePhoto(ImageSource.camera);
                      //savePhoto();
                    },
                    icon: Icon(Icons.camera_alt),
                    label: Text('Cámera')),
                SizedBox(
                  width: 20,
                ),
                TextButton.icon(
                    onPressed: () {
                      takePhoto(ImageSource.gallery);
                      //savePhoto();
                    },
                    icon: Icon(Icons.image),
                    label: Text('Galeria'))
              ],
            )
          ],
        ));
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  /*void savePhoto() async {
    SharedPreferences saveImage = await SharedPreferences.getInstance();
    print('Saved image path: ' + saveImage.toString());
  }*/
}
