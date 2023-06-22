import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class KTextStyle {
  static TextStyle splashHeadline = TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w400,
      fontFamily: GoogleFonts.sriracha().fontFamily);
  static TextStyle regularText =
      TextStyle(
        fontSize: 16, 
        fontWeight: FontWeight.w400,
        fontFamily: GoogleFonts.ibmPlexSansKr().fontFamily);
  static TextStyle regular =
       TextStyle(
        fontSize: 16,
         fontWeight: FontWeight.w500,
        fontFamily: GoogleFonts.ibmPlexSansKr().fontFamily);
  static TextStyle headline = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.ibmPlexSansKr().fontFamily
  );
  static TextStyle normal = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    fontFamily: GoogleFonts.ibmPlexSansKr().fontFamily
  );
}
