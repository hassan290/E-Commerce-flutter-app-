import 'package:e_commerce_app/utils/theme/custom_theme/appbar_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_theme/check_box_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_theme/chip_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_theme/out_line_bottom_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_theme/text_filed_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  ///Light Mode:
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextAppTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckBoxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonThemeData,
    outlinedButtonTheme: TOutlineButtonTheme.lightOutLineButtonTheme,
    inputDecorationTheme: TTextFiledTheme.lightInputDecorationTheme,

  );

  ///Dark Mode:
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextAppTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckBoxTheme.darkCheckBoxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonThemeData,
    outlinedButtonTheme: TOutlineButtonTheme.darkOutLineButtonTheme,
    inputDecorationTheme: TTextFiledTheme.darkInputDecorationTheme,
  );

}