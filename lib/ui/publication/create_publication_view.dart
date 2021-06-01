import 'package:bookspace/app_localizations.dart';
import 'package:bookspace/controllers/publication_controller.dart';
import 'package:bookspace/controllers/tag_controller.dart';
import 'package:bookspace/controllers/user_controller.dart';
import 'package:bookspace/models/publication.dart';
import 'package:bookspace/models/tag.dart';
import 'package:bookspace/models/user.dart';
import 'package:bookspace/ui/home/home_view.dart';
import 'package:bookspace/ui/main_view.dart';
import 'package:bookspace/ui/profile/profile_view.dart';
import 'package:bookspace/utils/extract_usernames.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:smart_select/smart_select.dart';

import 'package:bookspace/globals.dart' as globals;

class CreatePublicationView extends StatefulWidget {
  final int id;
  CreatePublicationView({Key key, this.id}) : super(key: key);

  @override
  _CreatePublicationViewState createState() => _CreatePublicationViewState();
}

class _CreatePublicationViewState extends State<CreatePublicationView> {
  User _user;
  var titleController = TextEditingController();
  var descController = TextEditingController();

  bool errorsTitle = false;
  bool errorsDesc = false;
  bool errorsGenre = false;
  bool errorsAll = false;

  Publication myPublication;

  int selectedGenre = 0;

  List<String> selectedTags = [];
  //List<int> publTags;

  void getUser() async {
    User user =
        await UserController.getUser(globals.id); //TO-DO Get current user id
    if (!disposed) {
      setState(() => _user = user);
    }
  }

  void createPublication(Publication myPublication) async {

    Publication response = await PublicationController.createPublication(myPublication, globals.token);

  }

//Error Check
  String errorTitle() {
    if (titleController.text.isEmpty)
      return "${AppLocalizations.of(context).translate("noTitle")}";
    else if (titleController.text.length < 35)
      return "${AppLocalizations.of(context).translate("shortTitle")}";
    else if (titleController.text.length > 150)
      return "${AppLocalizations.of(context).translate("longTitle")}";
    return null;
  }

  String errorDesc() {
    if (descController.text.isEmpty)
      return "${AppLocalizations.of(context).translate("noContent")}";
    else if (descController.text.length > 2000)
      return "${AppLocalizations.of(context).translate("longContent")}";
    return null;
  }

  String errorGenre() {
    if (selectedGenre == 0)
      return "${AppLocalizations.of(context).translate("noGenre")}";
    return null;
  }

  bool disposed = false;
  @override
  void dispose() {
    disposed = true;
    // Clean up the controller when the widget is disposed.
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: globals.theme ? Color.fromRGBO(243, 247, 250, 1) : Color.fromRGBO(70, 72, 74, 1),
        child: ListView(children: <Widget>[
          Container(
              child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 2),
                child: Row(children: [
                  Text(
                    "${AppLocalizations.of(context).translate("titulo")}",
                    style: TextStyle(
                      color: globals.theme ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
                child: Row(children: [
                  Text(
                    "${AppLocalizations.of(context).translate("tituloDesc")}",
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 2, 15, 5),
                child: Row(children: [
                  Expanded(
                      child: TextFormField(
                          controller: titleController,
                          onChanged: (text) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText:
                                  "${AppLocalizations.of(context).translate("tituloHelpTxt")}",
                              border: OutlineInputBorder(),
                              errorText: errorsAll ? errorTitle() : null,
                              suffixIcon: titleController.text.length > 0
                                  ? IconButton(
                                      icon: Icon(Icons.clear),
                                      onPressed: () {
                                        setState(() {
                                          titleController.clear();
                                        });
                                      })
                                  : null)))
                ]),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
                child: Row(children: [
                  Text(
                    "${AppLocalizations.of(context).translate("descripcion")}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: globals.theme ? Colors.black : Colors.white,
                    ),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 2, 15, 2),
                width: 400,
                child: Text(
                  "${AppLocalizations.of(context).translate("descripcionDesc")}",
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
              ),
              Container(
                  /*                              //TO-DO Text editior toolbar (see canva reference)
                padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
                width: 400,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        CommunityMaterialIcons.format_size,
                        color: selectedType == SmartTextType.H1
                          ? Colors.teal
                          : Colors.black
                      ),
                      onPressed: () => onSelected(SmartTextType.H1)
                    ),
                    IconButton(
                      icon: Icon(
                        CommunityMaterialIcons.format_quote_open,
                        color: selectedType == SmartTextType.QUOTE
                          ? Colors.teal
                          : Colors.black
                      ),
                      onPressed: () => onSelected(SmartTextType.QUOTE)
                    ),
                    IconButton(
                      icon: Icon(
                        CommunityMaterialIcons.format_list_bulleted,
                        color: selectedType == SmartTextType.BULLET
                          ? Colors.teal
                          : Colors.black
                      ),
                      onPressed: () => onSelected(SmartTextType.BULLET)
                    )
                  ]
                )
              */
                  ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 2, 15, 5),
                child: Row(children: [
                  Expanded(
                      child: TextFormField(
                          controller: descController,
                          onChanged: (text) {
                            setState(() {});
                          },
                          keyboardType: TextInputType.multiline,
                          maxLines: 4,
                          inputFormatters: [
                            new LengthLimitingTextInputFormatter(2000),
                          ], 
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            counterText:
                                '${descController.text.length}' + '/2000',
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            errorText: errorsAll ? errorDesc() : null,
                          ))),
                ]),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
                child: Row(children: [
                  Text(
                    "${AppLocalizations.of(context).translate("genero")}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: globals.theme ? Colors.black : Colors.white,
                    ),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
                child: Row(children: [
                  Text(
                    "${AppLocalizations.of(context).translate("generoDesc")}",
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 2, 15, 0),
                child: Row(children: [
                  Expanded(  
                    child: SmartSelect<int>.single(
                      title: "",
                      modalFilter: true,
                      modalTitle: "${AppLocalizations.of(context).translate("genero")}",
                      placeholder: "",
                      modalHeaderStyle: S2ModalHeaderStyle(
                        backgroundColor: globals.primary,
                        textStyle: TextStyle(color: Colors.black),
                        iconTheme: IconThemeData(color: Colors.black, opacity: 1),
                        actionsIconTheme: IconThemeData(color: Colors.black, opacity: 1),
                        centerTitle: true,
                      ),
                      value: selectedGenre,
                      choiceItems: globals.genres.map<S2Choice<int>>((S2Choice<int> x) {
                        return S2Choice<int>(
                          value: x.value,
                          title: AppLocalizations.of(context).translate(x.title),
                        );
                      }).toList(),
                      onChange: (state) => setState(() => selectedGenre = state.value),
                    )
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(25, 0, 15, 2),
                child: Row(children: [
                  Text(
                    errorsAll ? (errorGenre() == null ? "" : errorGenre()) : "",
                    style: TextStyle(fontSize: 12.0, color: Colors.red),
                  ),
                ]),
              ), 
              Container(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
                child: Row(children: [
                  Text(
                    "Tags",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: globals.theme ? Colors.black : Colors.white,
                    ),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
                child: Row(children: [
                  Text(
                    "${AppLocalizations.of(context).translate("tagsDesc")}",
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                ]),
              ),
              Container(
                  //color: Colors.orange,
                  padding: EdgeInsets.fromLTRB(15, 2, 15, 0),
                  child: TextFieldTags(
                      initialTags: selectedTags,
                      tagsStyler: TagsStyler(
                          tagTextStyle: TextStyle(fontWeight: FontWeight.bold),
                          tagDecoration: BoxDecoration(
                            color: globals.gray,
                            //color: Colors.blue[300],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          tagCancelIcon: Icon(Icons.cancel,
                              size: 18.0, color: Colors.red),//color: Colors.blue[900]),
                          tagPadding: const EdgeInsets.all(6.0)),
                      textFieldStyler: TextFieldStyler(
                        isDense: false,
                        helperText: "",
                        hintText: "",
                        textFieldFilled: true,
                        textFieldFilledColor: Colors.white,
                      ),
                      onTag: (tag) {
                        selectedTags.add(tag);
                      },
                      onDelete: (tag) {})),
              Container(
                //color: Colors.pink,
                padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                  children: <Widget>[
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.30,
                        height: 35,
                        child: RaisedButton(
                            textColor: Colors.white,
                            color: Color.fromRGBO(250, 198, 65, 1),
                            child: Text(
                              '${AppLocalizations.of(context).translate("publicar")}',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                            ),
                            onPressed: () {
                              setState(() {
                                errorsTitle = (errorTitle() != null) ? true : false;
                                errorsDesc = (errorDesc() != null) ? true : false;
                                errorsGenre = (errorGenre() != null) ? true : false;
                                errorsAll = errorsTitle | errorsDesc | errorsGenre;
                              });
                              if (!errorsAll) {
                                myPublication = Publication();
                                myPublication.title = titleController.text;
                                myPublication.content = descController.text;
                                myPublication.authorId = globals.id;
                                myPublication.category = globals.genres[selectedGenre - 1].title;
                                myPublication.tags = selectedTags;
                                myPublication.mentions = ExtractUsernames(descController.text);

                                createPublication(myPublication); 
                                /*
                                Navigator.push(context, // TODO: pass id to PublicationView
                                  MaterialPageRoute(
                                    builder: (context) => MainView(
                                      renderIndex: 'home',
                                      view: HomeView(),
                                    )
                                  ),
                                );
                                */
                              }
                            }))
                  ],
                ),
              ),
            ],
          ))
        ]));
  }
}
