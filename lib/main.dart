import 'package:bookspace/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bookspace/globals.dart' as globals;
Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Locale _loc;

  @override
  void initState() {
    super.initState();
  }
  
  Widget build(BuildContext context) {

    String lang = 'ca';
    if (_loc != null) {
      lang = _loc.languageCode;
    }

    print(_loc);

    return MaterialApp(
      title: 'Bookspace',
      theme: ThemeData(
        primarySwatch: globals.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Bookspace app'),

      // All App's supportes locales
      supportedLocales: [
        Locale('es', 'ES'),
        Locale('ca', 'ES'),
        Locale('en', 'US'),
        Locale('en', 'UK'),
      ],

      // Make sure that the localization data
      // for the proper language is loaded.
      // Basically this thing loads the JSON files
      // from ./lang into memory.
      localizationsDelegates: [
        // A class which loads the translations from JSON files
        AppLocalizations.delegate,

        // Built-in localization of basic text for Material widgets
        // Pop-ups and similar ...
        GlobalMaterialLocalizations.delegate,

        // Built-in localizations for text direction LTR/RTL
        // For languages that change text direction.
        GlobalWidgetsLocalizations.delegate,
      ],

      // Localization logic
      // Returns a locale which will be used by the App
      localeListResolutionCallback: (locale, supportedLocales) {
        // Check whether the current device is supported
        for (Locale l in locale) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == l.languageCode &&
                supportedLocale.countryCode == l.countryCode) {
                  _loc = supportedLocale;
              return supportedLocale;
            }
          }
        }
        // If the locale of the device is not supported, use the
        // first one from the list (Catalan, in this case)
        _loc = supportedLocales.first;
        return supportedLocales.first;
      },

  
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: Text(AppLocalizations.of(context).translate("id"))
      )/*Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.access_alarm),
      ),*/
    );
  }
}


