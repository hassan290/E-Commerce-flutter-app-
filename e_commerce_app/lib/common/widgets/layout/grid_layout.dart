import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';


class TGridLayout extends StatelessWidget {
  const TGridLayout(
      {super.key,
      this.mainAxisExtent=190,
      required this.itemCount,
      required this.itemBuilder}
      );

  final double? mainAxisExtent;
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: TSizes.gridSpacing,
        crossAxisSpacing: TSizes.gridSpacing,
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
