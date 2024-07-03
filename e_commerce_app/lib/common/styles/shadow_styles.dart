import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';

class TShadowStyles {
  static final verticalProductShadow = BoxShadow(
    color: TColors.darkerGrey.withOpacity(0.1),
    spreadRadius: 7,
    blurRadius: 50,
    offset: const Offset(0, 2), // changes position of shadow
  );

  static final horizontalProductShadow = BoxShadow(
    color: TColors.darkerGrey.withOpacity(0.1),
    spreadRadius: 7,
    blurRadius: 50,
    offset: const Offset(2, 0), // changes position of shadow
  );
}