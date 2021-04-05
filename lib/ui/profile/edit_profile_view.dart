import 'package:bookspace/controllers/user_controller.dart';
import 'package:bookspace/models/user.dart';
import 'package:bookspace/ui/profile/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bookspace/globals.dart' as globals;
import 'package:bookspace/ui/widgets/custom_input_box.dart';
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

  var _name;
  var _surname;
  var _username;
  var _password;
  var _email;
  var _bio;

  User _user;

  void getUser() async {
    User user = await UserController.getUser(1);
    if (!disposed) {
      setState(() => _user = user);
    }
  }

  bool disposed = false;
  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

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
                  hintText: 'Name', //_user.name,
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
                  hintText: 'Apellidos',
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
                  hintText: 'username', //_user.username,
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
                obscureText: isPasswordHiden,
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
                        icon: isPasswordHiden
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: () {
                          setState(() {
                            isPasswordHiden = !isPasswordHiden;
                          });
                        })),
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
                  hintText: 'email', //_user.email,
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
                  hintText: 'bio', //_user.description,
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
              'Tags',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
              //color: Colors.orange,
              constraints: BoxConstraints.expand(height: 85, width: 100),
              child: TextFieldTags(
                  initialTags: ['hola', 'adeu'], //_user.tags,
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
                  onTag: (tag) {},
                  onDelete: (tag) {})),
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
