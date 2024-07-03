import 'package:e_commerce_app/common/widgets/layout/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/common/widgets/texts/section_header.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TBrandShowcase(
                images: [TImages.jacket1, TImages.jacket2, TImages.jacket3],
              ),
              const TSectionHeading(title: 'You might like',showActionButton: true),
              const SizedBox(height: TSizes.spaceBtwItems),
              TGridLayout(itemCount: 8, itemBuilder: (_, index) => const TProductCardVertical()),
              const SizedBox(height: TSizes.spaceBtwItems),
            ],
          ),
        )
      ],
    );
  }
}
