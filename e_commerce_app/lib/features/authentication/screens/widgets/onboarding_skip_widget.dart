import 'package:e_commerce_app/features/authentication/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtility.getAppBarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(
          onPressed: () =>OnBoardingController.instance.skipPage(),
          child: const Text('skip'),
        ));
  }
}
