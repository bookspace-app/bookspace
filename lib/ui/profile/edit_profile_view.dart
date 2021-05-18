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
import 'package:smart_select/smart_select.dart';

import '../../app_localizations.dart';

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
  List<String> categories = [];
  String _path;
  List<int> selectedGenres = [0];

  //GET USER
  void getUser() async {
    User user = await UserController.getUser(globals.id);
    if (!disposed) {
      setState(() => _user = user);
      //setState(() => _tags = tags);
    }
    //Actualizar los edittext con lo de la base de datos
    setState(() {
      nameController.text = _user.name;
      usernameController.text = _user.username;
      emailController.text = _user.email;
      bioController.text = _user.description;
    });
    _id = _user.id;
  }

  //GET CATEGORIES
  void getCategories() async {
    List<String> cat = await UserController.getCategories(globals.id);
    categories = cat;
  }

  //UPDATE USER
  void putUser(String username, name, email, descrition, int id) async {
    UserController.updateUser(username, name, email, descrition, id);
  }

  //UPDATE CATEGORIES
  void updateCategories(List<String> categories, int id) {
    if (selectedGenres.length > 1) {
      categoriesToString();
    }
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
          titlePreEditText('Nombre'),
          editTextProfile(nameController, 'Nombre'),
          titlePreEditText('Nombre de Usuario'),
          editTextProfile(usernameController, 'Nombre de Usuario'),
          titlePreEditText('Email'),
          editTextProfile(emailController, 'Email'),
          titlePreEditText('Biografia'),
          editTextProfile(bioController, 'Description'),
          titlePreEditText('Categorias'),
          Container(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Row(children: [
              Text(
                "${AppLocalizations.of(context).translate("generoDesc")}",
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
              ),
            ]),
          ),

          //EDIT TEXT CATEGORIES. No lo hago con el metodo "editTextProfile" porque es distinto a los demás
          Container(
            padding: EdgeInsets.fromLTRB(15, 2, 15, 0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[700], width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(children: [
              Expanded(
                  child: SmartSelect<int>.multiple(
                modalFilter: true,
                modalTitle:
                    "${AppLocalizations.of(context).translate("genero")}",
                placeholder: 'Escoge el género literario que más se adecue',
                modalFilterHint: "HEY",
                modalHeaderStyle: S2ModalHeaderStyle(
                  backgroundColor: globals.primary,
                  textStyle: TextStyle(color: Colors.black),
                  iconTheme: IconThemeData(color: Colors.black, opacity: 1),
                  actionsIconTheme:
                      IconThemeData(color: Colors.black, opacity: 1),
                ),
                value: selectedGenres,
                choiceItems:
                    globals.genres.map<S2Choice<int>>((S2Choice<int> x) {
                  return S2Choice<int>(
                    value: x.value,
                    title: AppLocalizations.of(context).translate(x.title),
                  );
                }).toList(),
                onChange: (state) =>
                    setState(() => selectedGenres = state.value),
              )),
            ]),
          ),
          //BUTTON SUBMIT
          Container(
              alignment: Alignment.bottomCenter,
              height: 40,
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                //Cuando hacemos submit -> update de user y volvemos a la vista de profile
                onPressed: () {
                  _name = nameController.text;
                  _username = usernameController.text;
                  _email = emailController.text;
                  _password = passwordController.text;
                  _bio = bioController.text;
                  putUser(_username, _name, _email, _bio, _id);
                  updateCategories(categories, _id);
                  //updatePhoto(_path);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainView(
                              renderIndex: 'profile',
                              view: ProfileView(),
                            )),
                  );
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                child: Text('Submit',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    )),
              )),
        ],
      ),
    );
  }

  //Widget de la imagen de perfil
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

  //Ventana que te aparece cuando le das a editar foto
  Widget bottomSheet() {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Text('Escoge una foto de perfil',
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

  //Widget para tener un edit text standard y no volver a repetir siempre lo mismo
  Widget editTextProfile(TextEditingController controller, String hintText) {
    return Container(
        constraints: BoxConstraints.expand(height: 50, width: 100),
        child: TextField(
          controller: controller,
          style: TextStyle(
              fontSize: 15,
              //color: Color(0xff0962ff),
              fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: hintText,
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
        ));
  }

  //Widget para hacer un text view standard y no repetirlo siempre
  Widget titlePreEditText(String title) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 15, 0, 5),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile;
    });
    _path = pickedFile.path;
  }

  void categoriesToString() {
    categories = [];
    for (int i = 0; i < selectedGenres.length - 1; i++) {
      String title = globals.genres[selectedGenres[i + 1] - 1].title;
      categories.add(title);
    }
  }

  void categoriesToInt() {
    for (int i = 0; i < categories.length; i++) {
      selectedGenres[i + 1] = globals.genres[selectedGenres[i + 1] - 1].value;
    }
  }
}
