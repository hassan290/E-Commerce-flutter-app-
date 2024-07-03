import 'package:flutter/material.dart';
class TColors {
  TColors._();

  ///App basic colors
  static const Color primary = Color(0xFF4b68ff);
  static const Color secondary = Color(0xFFFFE24B);
  static const Color accent = Color(0xFFb0c7ff);

  ///Gradients colors
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFff9a9e),
      Color(0xFFfad0c4),
      Color(0xFFfad0c4),
    ],
  );
  
  ///Text colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6c7570);
  static const Color textWhite = Colors.white;

  ///Background colors
  static const Color light = Color(0xFFf6f6f6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFf3f5ff);

  ///Background containers colors
  static const Color lightContainer = Color(0xFFf6f6f6);
  static Color darkContainer = TColors.white.withOpacity(0.1);

  ///Button colors
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0xFF6c757d);
  static const Color buttonDisabled = Color(0xFFc4c4c4);

  ///Border colors
  static const Color borderPrimary = Color(0xFFd9d9d9);
  static const Color borderSecondary = Color(0xFFe6e6e6);

  ///Error and validation colors
  static const Color error = Color(0xFFd32f2f);
  static const Color success = Color(0xFF388e3c);
  static const Color warning = Color(0xFFf57c00);
  static const Color info = Color(0xFF1976d2);

  ///Neutral shades
  static const Color black=Color(0xFF232323);
  static const Color darkerGrey=Color(0xFF4f4f4f);
  static const Color darkGrey=Color(0xFF939393);
  static const Color grey=Color(0xFFe0e0e0);
  static const Color softGrey=Color(0xFFf4f4f4);
  static const Color lightGrey=Color(0xFFf9f9f9);
  static const Color white=Color(0xFFFFFFFF);
}
