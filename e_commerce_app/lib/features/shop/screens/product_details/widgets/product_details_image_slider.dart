import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../../common/widgets/images_text_widgets/rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.light,
        child: Stack(
          children: [
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(child: Image(image: AssetImage(
                    TImages.jacket2))),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: 8,
                  itemBuilder: (_, index) {
                    return TRoundedImage(
                      width: 80,
                      fit: BoxFit.contain,
                      imageUrl: TImages.jacket1,
                      backgroundColor:dark ? TColors.dark : TColors.light,
                      border: Border.all(color: TColors.primary),
                    );
                  },
                  separatorBuilder: (_, index) {
                    return const SizedBox(
                      width: TSizes.spaceBtwItems,
                    );
                  },
                ),
              ),
            ),
            const TAppBar(
              showBackButton: true,
              actions: [
                TCircularIcon(icon: Iconsax.heart5,color: Colors.red,),
              ],
            )
          ],
        ),
      ),
    );
  }
}