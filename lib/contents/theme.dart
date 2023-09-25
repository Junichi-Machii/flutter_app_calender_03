import 'package:flutter/material.dart';
import 'package:flutter_clendar_app03/contents/color.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static final light = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: ThemeColors.white,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
    primaryColor: ThemeColors.primaryClr,
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
      primaryColor: ThemeColors.darkGreyClr,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(background: ThemeColors.darkGreyClr));
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.grey[400] : Colors.grey));
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.white : Colors.black));
}

TextStyle get dateTimeStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: ThemeColors.grey,
  ));
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Get.isDarkMode ? Colors.white : Colors.black));
}

TextStyle get subTitleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[600]));
}
