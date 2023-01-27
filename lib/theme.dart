import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
const bluish = Color(0xFF4e5ae8);
const orange = Color(0xCFFF8746);
const pink = Color(0xFFff4667);
const white = Colors.white;
const black = Colors.black;
const primary = bluish;
const darkGrey = Color(0xFF121212);
const darkHeader = Color(0xFF424242);

class Themes{
  static ThemeData light = ThemeData(
      primaryColor: primary,
      brightness: Brightness.light
  );
  static ThemeData dark = ThemeData(
      primaryColor: darkGrey,
      brightness: Brightness.dark
  );
  static TextStyle get headingStyle=>GoogleFonts.lato(textStyle:  TextStyle(color: black,fontSize: 24,fontWeight: FontWeight.bold));
  static TextStyle get subHeadingStyle=>GoogleFonts.lato(textStyle:  TextStyle(color: black,fontSize: 20,fontWeight: FontWeight.bold));
  static TextStyle get titleStyle=>GoogleFonts.lato(textStyle: TextStyle(color: black,fontSize: 18,fontWeight: FontWeight.bold));
  static TextStyle get subTitleStyle=>GoogleFonts.lato(textStyle: TextStyle(color: black,fontSize: 16,fontWeight: FontWeight.w400));
  static TextStyle get bodyStyle=>GoogleFonts.lato(textStyle: TextStyle(color: black,fontSize: 14,fontWeight: FontWeight.w400));
  static TextStyle get body2Style=>GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey[200],fontSize: 14,fontWeight: FontWeight.w400));
  static TextStyle get dateTimeStyle=>GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w600));
  static TextStyle get dayTimeStyle=>GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w600));
  static TextStyle get monthTimeStyle=>GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w600));
}