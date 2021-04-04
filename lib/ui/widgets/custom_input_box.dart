import 'package:flutter/material.dart';

class MyCustomInputBox extends StatefulWidget {
  String label;
  String inputHint;

  MyCustomInputBox({this.label, this.inputHint});
  @override
  _MyCustomInputBoxState createState() => _MyCustomInputBoxState();
}

class _MyCustomInputBoxState extends State<MyCustomInputBox> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
            child: Text(
              widget.label,
              style: TextStyle(
                fontFamily: 'Product Sans',
                fontSize: 15,
                //color: Color(0xff8f9db5),
              ),
            ),
          ),
        ),
        TextFormField(
          obscureText: widget.label == 'Contraseña' ? true : false,
          style: TextStyle(
              fontSize: 15,
              //color: Color(0xff0962ff),
              fontWeight: FontWeight.bold),
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: widget.inputHint,
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
                      controller.clear();
                    });
                  })),
        ),
      ],
    );
  }
}
