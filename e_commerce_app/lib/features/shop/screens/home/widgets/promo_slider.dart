import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/custom_shapes/circular_container.dart';
import '../../../../../common/widgets/images_text_widgets/rounded_images.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/home_controller.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
            autoPlay: true,
            viewportFraction: 1.0,
          ),
          items: banners
              .map((url) => TRoundedImage(imageUrl: url))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < banners.length; i++)
                TCircularContainer(
                  width: 20,
                  height: 5,
                  backgroundColor: controller.carouselCurrentIndex.value == i
                      ? TColors.primary
                      : TColors.grey,
                  margin: const EdgeInsets.only(right: TSizes.sm),
                )
            ],
          ),
        ),
      ],
    );
  }
}
