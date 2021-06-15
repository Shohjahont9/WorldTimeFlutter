import 'package:CountryTime/pages/home.dart';
import 'package:CountryTime/pages/choose_location.dart';
import 'package:CountryTime/pages/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home':(context) => Home(),
    '/location': (context) => Choose_location(),
  },
));