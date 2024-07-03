
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/product_details_image_slider.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/rating_share.dart';

import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TProductImageSlider(dark: dark),
            const Padding(
              padding: EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  TRatingAndShare(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


