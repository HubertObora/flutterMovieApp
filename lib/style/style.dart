import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color mainColor = const Color.fromARGB(66, 54, 53, 53);
  static Color secondColor = const Color.fromARGB(255, 26, 46, 64);
  static Color whiteColor = Colors.white;
  static TextStyle mainText = GoogleFonts.taviraj(
    fontSize: 32,
    color: Colors.white,
  );
  static TextStyle ornamentText =
      GoogleFonts.cormorantSc(fontSize: 32, color: Colors.white);
  static TextStyle normalText =
      GoogleFonts.ptSans(fontSize: 22, color: Colors.white);
  static TextStyle normalRedText =
      GoogleFonts.ptSans(fontSize: 22, color: Colors.red);
  static TextStyle normalBoldText = GoogleFonts.ptSans(
      fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold);
  static TextStyle smallText =
      GoogleFonts.ptSans(fontSize: 18, color: Colors.white);
}
