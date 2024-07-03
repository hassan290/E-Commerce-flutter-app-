import 'package:e_commerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_commerce_app/utils/constants/images_strings.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/custom_shapes/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/search_container.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/texts/section_header.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  THomeAppMar(),
                  SizedBox(height: TSizes.spaceBtwSections),
                  TSearchContainer(text: TText.search),
                  SizedBox(height: TSizes.spaceBtwSections),
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TSectionHeading(
                          title: TText.popularCategories,
                          textColor: Colors.white,
                          showActionButton: false,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),
                        THomeCategories()
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3,
                      TImages.promoBanner4
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(title: 'Popular Products',showActionButton: true,onPressed: (){},),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TGridLayout(
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int int) =>
                          const TProductCardVertical()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
