import 'dart:ui';
import 'package:flutter/material.dart';


class AppTheme{
  static const Color lightprimary = Color(0xffB7935F);
  static const Color black = Color(0xff0d0f15);
  static const Color white = Color(0xffFFFFFF);
  static const Color darkpimary = Color(0xff141A2E);
  static const Color gold = Color(0xffFACC1D);

  static ThemeData lightTheme = ThemeData(
    primaryColor: lightprimary,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize:30 ,
        fontWeight: FontWeight.bold,
        color: black,

      ),

  foregroundColor: black  ),
bottomNavigationBarTheme: BottomNavigationBarThemeData(
  backgroundColor: lightprimary,
  selectedItemColor: black,
  unselectedItemColor: white,
  type: BottomNavigationBarType.fixed,

),
    textTheme: TextTheme(headlineSmall: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w400,
      color: black,
    ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: black,
      ),

    ),
    switchTheme: SwitchThemeData(
    )
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: darkpimary,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize:30 ,
        fontWeight: FontWeight.bold,
        color: white,


      ),
    foregroundColor: white),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkpimary,
      selectedItemColor: gold,
      unselectedItemColor: white,
      type: BottomNavigationBarType.fixed,

    ),
    textTheme: TextTheme(headlineSmall: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w400,
      color: white,
    ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: gold,
      ),

    ),
  );





}