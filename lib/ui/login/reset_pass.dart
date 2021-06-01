import 'package:bookspace/app_localizations.dart';
import 'package:bookspace/ui/login/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookspace/globals.dart' as globals;

class Reset extends StatefulWidget {
  Reset({Key key}) : super(key: key);

  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final String text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
        selection:
        TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                Icons.vpn_key_sharp,
                color: globals.primary,
                size: 80.0,
              ),
              Text(
                '${AppLocalizations.of(context).translate("forgotpass")}',
                style: TextStyle(
                  fontSize: 20,
                  color: globals.secondary,
                ),
              ),
              Text(
                '${AppLocalizations.of(context).translate("resetdesc")}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email_outlined),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.backspace_rounded),
                      onPressed: () => _controller.clear(),
                  ),
                  hintText: '${AppLocalizations.of(context).translate("resetemaildesc")}',
                  labelText: 'Email *',
                ),
                /* onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                }, */
                /*validator: (String value) {
                  return (value != null && !value.contains('@')) ? 'Correo inválido' : null;
                },*/
                onSubmitted: (String value) async {
                  await showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('${AppLocalizations.of(context).translate("ty")}!'),
                        content: Text(
                            '${AppLocalizations.of(context).translate("resetconfirm1")} "$value" ${AppLocalizations.of(context).translate("resetconfirm2")}'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()),
                              );
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('${AppLocalizations.of(context).translate("ty")}!'),
                          content: Text(
                              '${AppLocalizations.of(context).translate("resetconfirm1")} ${AppLocalizations.of(context).translate("resetconfirm2")}'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                _controller.clear();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                  );
                  //TODO:navigation to user gmail?
                },
                child: Text('${AppLocalizations.of(context).translate("send")}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
