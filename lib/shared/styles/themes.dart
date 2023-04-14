import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/constants.dart';

// ThemeData lightMode = ThemeData(
//   primarySwatch: defaultColorLight,
//   floatingActionButtonTheme:
//       FloatingActionButtonThemeData(backgroundColor: defaultColorLight),
//   scaffoldBackgroundColor: Colors.white,
//   appBarTheme: const AppBarTheme(
//     actionsIconTheme: IconThemeData(color: Colors.black),
//     backgroundColor: Colors.white,
//     elevation: 0,
//     backwardsCompatibility: false,
//     systemOverlayStyle: SystemUiOverlayStyle(
//         statusBarColor: Colors.grey, statusBarBrightness: Brightness.dark),
//     titleTextStyle: TextStyle(
//         color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
//     centerTitle: true,
//   ),
//   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       backgroundColor: Colors.white,
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: defaultColorLight,
//       unselectedItemColor: Colors.black),
//   textTheme: TextTheme(
//     headline6: TextStyle(
//         fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
//   ),
// );

ThemeData darkMode = ThemeData(
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Color.fromRGBO(0, 0, 0, 1),
  appBarTheme: const AppBarTheme(
    actionsIconTheme: IconThemeData(color: Color(0xFFB8DBD9)),
    backgroundColor: Color.fromRGBO(0, 0, 0, 1),
    elevation: 0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color.fromRGBO(0, 0, 0, 1),
        statusBarBrightness: Brightness.light),
    titleTextStyle: TextStyle(
        color: Color(0xFFB8DBD9), fontSize: 20, fontWeight: FontWeight.bold),
    centerTitle: true,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color.fromRGBO(1, 41, 102, 1)),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Color(0xFFB8DBD9)),
  textTheme: TextTheme(
    headline6: TextStyle(
        fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
  ),
);
