import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.red,
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.red,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.red,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    type: BottomNavigationBarType.fixed,
    backgroundColor: HexColor('333739'),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: Colors.white
    ),
  ),
  fontFamily: 'loraReg'
);

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.red,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.red,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.red,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
    fontFamily: 'loraReg'
);