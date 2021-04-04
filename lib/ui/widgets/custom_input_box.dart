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
            padding: const EdgeInsets.only(left: 0.0, bottom: 8),
            child: Text(
              widget.label,
              style: TextStyle(
                fontFamily: 'Product Sans',
                fontSize: 15,
                color: Color(0xff8f9db5),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 15),
          child: TextFormField(
            obscureText: widget.label == 'Contraseña' ? true : false,
            style: TextStyle(
                fontSize: 19,
                color: Color(0xff0962ff),
                fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                hintText: widget.inputHint,
                hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[350],
                    fontWeight: FontWeight.w600),
                focusColor: Color(0xff0962ff),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Color(0xff0962ff)),
                ),
                suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        controller.clear();
                      });
                    })),
          ),
        )
      ],
    );
  }
}
