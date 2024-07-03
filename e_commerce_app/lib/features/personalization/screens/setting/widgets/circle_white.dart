import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class TCircleWhite extends StatelessWidget {
  const TCircleWhite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200 ,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        color: TColors.white.withOpacity(0.2  ),
      ),
    );
  }
}
