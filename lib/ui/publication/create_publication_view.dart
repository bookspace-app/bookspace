import 'package:bookspace/app_localizations.dart';
import 'package:bookspace/controllers/publication_controller.dart';
import 'package:bookspace/controllers/tag_controller.dart';
import 'package:bookspace/controllers/user_controller.dart';
import 'package:bookspace/models/publication.dart';
import 'package:bookspace/models/tag.dart';
import 'package:bookspace/models/user.dart';
import 'package:bookspace/ui/main_view.dart';
import 'package:bookspace/ui/profile/profile_view.dart';
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

  List<int>  selectedGenres = [0];

  List<Tag> _allTags;
  List<String> selectedTags = [];
  List<int> publTags;

  void getUser() async {
    User user = await UserController.getUser(globals.id); //TO-DO Get current user id
    if (!disposed) {
      setState(() => _user = user);
    }
  }

  void getAllTags() async {
    List<Tag> allTags = await TagController.getAllTags();
    if (!disposed) {
      setState(() => _allTags = allTags);
    }
  }

  void createTag(User user, String name, int publId) async {
    Tag tag;
    tag.authorId = user.id;
    tag.name = name;
    tag.publicationId = publId;
    int response = await TagController.createTag(tag); 
  }

  void createPublication() async {
    int response = await PublicationController.createPublication(myPublication);
    print(globals.id);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => MainView(
                  renderIndex: 'profile',
                  view: ProfileView(),
                )),
        ModalRoute.withName('/'));
  }

  void treatTags(List<String> selectedTags) {
    getAllTags();

    for (var i = 0; i < selectedTags.length; i++){
      String currentTag = selectedTags[i];
      bool created = false;
      for (var j = 0; j < _allTags.length; j++){
        if(currentTag == _allTags[j].name) {
          created = true;
          break;
        }
      }
      if (!created) createTag(_user, currentTag, myPublication.id);
    }

    for (var i = 0; i < selectedTags.length; i++){
      String currentTag = selectedTags[i];
      bool created = false;
      for (var j = 0; j < _allTags.length; j++){
        if(currentTag == _allTags[j].name) {
          publTags.add(_allTags[j].id);
          break;
        }
      }
    }

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
    if (selectedGenres.length < 2)
      return "${AppLocalizations.of(context).translate("noGenre")}";
    return "";
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromRGBO(243, 247, 250, 1),
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
                              hintText: "${AppLocalizations.of(context).translate("tituloHelpTxt")}",
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
                          ], //TO-DO Define length of publication's description
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
                    child: SmartSelect<int>.multiple(
                      modalFilter: true,
                      modalTitle: "${AppLocalizations.of(context).translate("genero")}",
                      placeholder: 'Escoge el género literario que más se adecue',
                      modalFilterHint: "HEY",
                      modalHeaderStyle: S2ModalHeaderStyle(
                          backgroundColor: globals.primary,
                          textStyle: TextStyle(color: Colors.black),
                          iconTheme: IconThemeData(color: Colors.black, opacity: 1),
                          actionsIconTheme: IconThemeData(color: Colors.black, opacity: 1),
                        ),
                      value: selectedGenres,
                      choiceItems: globals.genres.map<S2Choice<int>>((S2Choice<int> x) {
                        return S2Choice<int>(
                          value: x.value,
                          title: AppLocalizations.of(context).translate(x.title),
                        );
                      }).toList(),
                      onChange: (state) => setState(() => selectedGenres = state.value),
                    )
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(25, 0, 15, 2),
                child: Row(children: [
                  Text(
                    errorsAll ? errorGenre() : "",
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
                            color: Colors.blue[300],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          tagCancelIcon: Icon(Icons.cancel,
                              size: 18.0, color: Colors.blue[900]),
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
                      onDelete: (tag) {}
                    )
                  ),
              Container(
                //color: Colors.pink,
                padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //Center Row contents vertically,
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
                              getUser();
                              myPublication = Publication();
                              treatTags(selectedTags);
                              myPublication.title = titleController.text;
                              myPublication.content = descController.text;
                              myPublication.authorId = globals.id; //TO-DO  = _user.id; now its hardcoded
                              myPublication.category = globals.genres[selectedGenres[1]-1].title; //TO-DO Enable multi genre posting
                              myPublication.tags = publTags;
                              createPublication();
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
