import 'package:bookspace/utils/get_swatch.dart';
import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';

Color primary = getMaterial(0xFFFAC640);
Color secondary = getMaterial(0xFF314211);
Color tertiary = getMaterial(0xFF313211);
int id = 1;
double bottomBarHeight = 60.0;

List<S2Choice<int>> genres = [
    S2Choice<int>(value: 1, title: 'Accion'),
    S2Choice<int>(value: 2, title: 'Aventura'),
    S2Choice<int>(value: 3, title: 'Literaria'),
    S2Choice<int>(value: 4, title: 'Contemporanea'),
    S2Choice<int>(value: 5, title: 'Negra'),
    S2Choice<int>(value: 6, title: 'Historica'),
    S2Choice<int>(value: 7, title: 'Romantica'),
    S2Choice<int>(value: 8, title: 'Erotica'),
    S2Choice<int>(value: 9, title: 'Poesia'),
    S2Choice<int>(value: 10, title: 'Teatro'),
    S2Choice<int>(value: 11, title: 'Terror'),
    S2Choice<int>(value: 12, title: 'Comic'),
    S2Choice<int>(value: 13, title: 'Manga'),
    S2Choice<int>(value: 14, title: 'SciFi'),
    S2Choice<int>(value: 15, title: 'Fantasia'),
    S2Choice<int>(value: 16, title: 'Infantil'),
    S2Choice<int>(value: 17, title: 'Economia'),
    S2Choice<int>(value: 18, title: 'Cocina'),
    S2Choice<int>(value: 19, title: 'Comedia'),
    S2Choice<int>(value: 20, title: 'Documental'),
    S2Choice<int>(value: 21, title: 'Drama'),
    S2Choice<int>(value: 22, title: 'Suspense'),
    S2Choice<int>(value: 23, title: 'Juvenil'),
    S2Choice<int>(value: 24, title: 'Adulto'),
    S2Choice<int>(value: 25, title: 'Belico'),
    S2Choice<int>(value: 26, title: 'Crimen'),
    S2Choice<int>(value: 27, title: 'Deporte'),
    S2Choice<int>(value: 28, title: 'Historia'),
    S2Choice<int>(value: 29, title: 'Biografia'),
    S2Choice<int>(value: 30, title: 'Policiaco'),
    S2Choice<int>(value: 31, title: 'Familiar'),
    S2Choice<int>(value: 32, title: 'Western'),
    S2Choice<int>(value: 33, title: 'Religion'),
    S2Choice<int>(value: 34, title: 'Futurismo'),
    S2Choice<int>(value: 35, title: 'Otro'),
  ];