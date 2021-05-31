import 'package:bookspace/utils/get_swatch.dart';
import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';

Color primary = getMaterial(0xFFFAC640);
Color secondary = getMaterial(0xFF314211);
Color tertiary = getMaterial(0xFF313211);
Color gray = getMaterial(0xFFD9D9D9);

Color day_1 = getMaterial(0xFFFAC640);
Color day_2 = getMaterial(0xFF314211);
Color day_3 = getMaterial(0xFF313211);

int id = 1;
String token;
double bottomBarHeight = 60.0;

List<S2Choice<int>> genres = [
  S2Choice<int>(value: 1, title: 'action'),
  S2Choice<int>(value: 2, title: 'adventure'),
  S2Choice<int>(value: 3, title: 'literary'),
  S2Choice<int>(value: 4, title: 'contemporary'),
  S2Choice<int>(value: 5, title: 'black'),
  S2Choice<int>(value: 6, title: 'historic'),
  S2Choice<int>(value: 7, title: 'horror'),
  S2Choice<int>(value: 8, title: 'erotic'),
  S2Choice<int>(value: 9, title: 'poetry'),
  S2Choice<int>(value: 10, title: 'theater'),
  S2Choice<int>(value: 11, title: 'terror'),
  S2Choice<int>(value: 12, title: 'comic'),
  //S2Choice<int>(value: 13, title: 'Manga'),
  S2Choice<int>(value: 13, title: 'SciFi'),
  S2Choice<int>(value: 14, title: 'fantasy'),
  S2Choice<int>(value: 15, title: 'children'),
  S2Choice<int>(value: 16, title: 'economy'),
  S2Choice<int>(value: 17, title: 'kitchen'),
  S2Choice<int>(value: 18, title: 'comedy'),
  S2Choice<int>(value: 19, title: 'documentary'),
  S2Choice<int>(value: 20, title: 'drama'),
  S2Choice<int>(value: 21, title: 'suspense'),
  S2Choice<int>(value: 22, title: 'teen'),
  S2Choice<int>(value: 23, title: 'adult'),
  S2Choice<int>(value: 24, title: 'war'),
  S2Choice<int>(value: 25, title: 'crime'),
  S2Choice<int>(value: 26, title: 'sport'),
  S2Choice<int>(value: 27, title: 'history'),
  S2Choice<int>(value: 28, title: 'biography'),
  S2Choice<int>(value: 29, title: 'cops'),
  S2Choice<int>(value: 30, title: 'family'),
  S2Choice<int>(value: 31, title: 'western'),
  S2Choice<int>(value: 32, title: 'religion'),
  S2Choice<int>(value: 33, title: 'futurism'),
  S2Choice<int>(value: 34, title: 'romantic'),
  S2Choice<int>(value: 35, title: 'other'),
];
