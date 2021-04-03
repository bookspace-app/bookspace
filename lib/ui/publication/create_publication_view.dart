import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:textfield_tags/textfield_tags.dart';

class CreatePublicationView extends StatefulWidget {
  CreatePublicationView({Key key}) : super(key: key);

  @override
  _CreatePublicationViewState createState() => _CreatePublicationViewState();
}

class _CreatePublicationViewState extends State<CreatePublicationView> {

  var titleController = TextEditingController();
  var descController = TextEditingController();

  @override
  void dispose() {
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
    return ListView(
      children: <Widget> [
        Container(
          color: Color.fromRGBO(243, 247, 250, 1),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 2),
                child: Row(
                  children: [
                    Text(
                    "Título",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,),
                    ),
                  ]
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
                child: Row(
                  children: [
                    Text(
                    "Sé específico a la hora de preguntar",
                    style: TextStyle(fontSize: 14.0, color:Colors.grey),
                    ),
                  ]
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 2, 15, 5),
                child: Row( 
                  children: [
                    Expanded(child: TextFormField(
                      controller: titleController,
                      onChanged: (text) {
                        setState(() {
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Escribe tu pregunta aquí...",
                        border: OutlineInputBorder(),
                        suffixIcon: titleController.text.length > 0 ?
                          IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              setState(() {
                                titleController.clear();
                              });
                            })
                          : null   
                      )
                    ))
                  ]
                ),
              ), 
              Container(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
                child: Row(
                  children: [
                    Text(
                    "Descripción",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,),
                    ),
                  ]
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
                width: 400,
                child: Text(
                  "Incluye toda la información necesaria para que los demás usuarios puedan dar una respuesta ",
                  style: TextStyle(fontSize: 14.0, color:Colors.grey),
                  ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
                width: 400,
                child: Text(
                  "PLACEHOLDER text options bar",
                  ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 2, 15, 5),
                child: Row(
                  children: [
                    Expanded(child: TextFormField(
                      controller: descController,
                      onChanged: (text) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(500),
                      ],                                                          //TO-DO Define length of publication's description
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        counterText: '${descController.text.length}' + '/500'
                      )
                    )),
                  ]
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
                child: Row(
                  children: [
                    Text(
                    "Género",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,),
                    ),
                  ]
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
                child: Row(
                  children: [
                    Text(
                    "Escoge el género literario que más se adecue",
                    style: TextStyle(fontSize: 14.0, color:Colors.grey),
                    ),
                  ]
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 2, 15, 5),
                child: Row(
                  children: [
                    Expanded(child: TextFormField(
                      controller: titleController,
                      onChanged: (text) {
                        setState(() {
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "PLACHOLDER genre picker",
                        border: OutlineInputBorder(),
                        suffixIcon: titleController.text.length > 0 ?
                          IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              setState(() {
                                titleController.clear();
                              });
                            })
                          : null   
                      )
                    ))
                  ]
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
                child: Row(
                  children: [
                    Text(
                    "Tags",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,),
                    ),
                  ]
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
                child: Row(
                  children: [
                    Text(
                    "Pon las etiquetas que describan mejor tu pregunta",
                    style: TextStyle(fontSize: 14.0, color:Colors.grey),
                    ),
                  ]
                ),
              ),
              Container(
                //color: Colors.orange,
                padding: EdgeInsets.fromLTRB(15, 2, 15, 0),
                child: TextFieldTags(
                  tagsStyler: TagsStyler(
                    tagTextStyle: TextStyle(fontWeight: FontWeight.bold),
                    tagDecoration: BoxDecoration(color: Colors.blue[300], borderRadius: BorderRadius.circular(8.0), ),
                    tagCancelIcon: Icon(Icons.cancel, size: 18.0, color: Colors.blue[900]),
                    tagPadding: const EdgeInsets.all(6.0)
                  ),
                  textFieldStyler: TextFieldStyler(
                    isDense: false,
                    helperText: "",
                    hintText: "",
                    textFieldFilled: true,
                    textFieldFilledColor: Colors.white,
                    
                  ),
                  onTag: (tag) {},
                  onDelete: (tag) {}
                )
              ),
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
                        child: Text('Publicar', style: TextStyle(fontSize: 18.0, color: Colors.black),),
                          onPressed: () {

                          //Publicar post
                        }
                      )
                    )  
                  ],
                ),
              ),                               
            ],
          )
        )
      ]
    );
  }
}