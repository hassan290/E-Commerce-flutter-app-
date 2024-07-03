import 'package:e_commerce_app/utils/constants/images_strings.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/onboarding_controller.dart';
import '../widgets/onboarding_dot_navigation.dart';
import '../widgets/onboarding_next_button.dart';
import '../widgets/onboarding_page_widget.dart';
import '../widgets/onboarding_skip_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          ///Horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                  image: TImages.onBoarding1,
                  title: TText.onBoardingTitle1,
                  subTitle: TText.onBoardingSubTitle1),
              OnBoardingPage(
                  image: TImages.onBoarding2,
                  title: TText.onBoardingTitle2,
                  subTitle: TText.onBoardingSubTitle2),
              OnBoardingPage(
                  image: TImages.onBoarding3,
                  title: TText.onBoardingTitle3,
                  subTitle: TText.onBoardingSubTitle3),
            ],
          ),

          ///Skip button
          const OnBoardingSkip(),

          ///Dot navigation smoothPageIndicator
          const OnBoardingDotNavigation(),

          ///Circular button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
