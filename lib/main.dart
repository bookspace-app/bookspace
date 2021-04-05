import 'package:bookspace/app_localizations.dart';
import 'package:bookspace/ui/login/sign_in.dart';
import 'package:bookspace/ui/login/sign_up.dart';
import 'package:bookspace/ui/login/sign_up2.dart';
import 'package:bookspace/ui/main_view.dart';
import 'package:bookspace/ui/widgets/bottom_bar.dart';
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
      home: MainView(),

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
