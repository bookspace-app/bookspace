import 'package:bookspace/ui/login/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:textfield_tags/textfield_tags.dart';



class SignUp2 extends StatefulWidget {
  SignUp2({Key key}) : super(key: key);

  @override
  _SignUp2State createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  var descController = TextEditingController();

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
      body: ListView( 
      children: <Widget> [
        Padding(
          padding: EdgeInsets.fromLTRB(30, 30, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
            children: <Widget>[
                Text ("Foto de Perfil",                                                           //to-do TRADUCIONES
                  style: TextStyle(
                    color: Colors.black,                                                        //to-do Cambiar color letras
                    fontSize: 14
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
            children: <Widget>[
                CircleAvatar(
                  radius: 60.0,
                  backgroundColor: const Color(0xFF77BBBB)
                  //to-do Tratamiento imagenes
                )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 30, 10, 0),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
            children: <Widget>[
                Text ("Descripción:",                                                           //to-do TRADUCIONES
                  style: TextStyle(
                    color: Colors.black,                                                        //to-do Cambiar color letras
                    fontSize: 14
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
          child: SizedBox(
            //width: ,
            //height: 10,
            child: Expanded(child: TextFormField(
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
                hintText: "Explicanos quién eres y que te gusta",
                //labelText: descController.text.length > 0 ? 'Descripción' : null,
                counterText: '${descController.text.length}' + '/500'
              )
            )),
          )
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 20, 10, 0),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
            children: <Widget>[
                Text ("Tags favoritos:",                                                           //to-do TRADUCIONES
                  style: TextStyle(
                    color: Colors.black,                                                        //to-do Cambiar color letras
                    fontSize: 14
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
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
              hintText: 'Escribe los temas que más te interesan'
            ),
            onTag: (tag) {},
            onDelete: (tag) {}
          )
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 30, 30, 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
            children: <Widget>[
              SizedBox(
                width: 150,
                height: 35,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Completar registro'),
                    onPressed: () {

                    //Hacer cosas e ir a la siguiente pantalla de registro
                  }
                )
              )  
            ],
          ),
        ),
        ]
      )
    );
  }
}
