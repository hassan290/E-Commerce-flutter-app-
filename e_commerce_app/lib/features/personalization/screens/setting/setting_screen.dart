import 'package:e_commerce_app/common/widgets/texts/section_header.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce_app/features/personalization/screens/setting/widgets/card_setting.dart';
import 'package:e_commerce_app/features/personalization/screens/setting/widgets/circle_white.dart';
import 'package:e_commerce_app/features/personalization/screens/setting/widgets/clipath_header.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/text_strings.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  // final controller = UserController.instance;
  //final controller = Get.put(UserController.instance);
  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: ClipPath(
                clipper: THeaderClipper(),
                child: Container(
                  color: TColors.primary,
                  child: Stack(
                    children: [
                      ClipPath(
                        clipper: THeaderClipper(),
                        child: Container(
                          color: TColors.primary,
                        ),
                      ),
                      const Positioned(
                        top: 0,
                        left: 280,
                        child: TCircleWhite(),
                      ),
                      const Positioned(
                        top: 120,
                        left: 320,
                        child: TCircleWhite(),
                      ),
                      Positioned(
                        top: 50,
                        left: 30,
                        child: Text(
                          'Account',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      Positioned(
                        top: 100,
                        left: 10,
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 25,
                              child: Image(
                                  image: AssetImage(TImages.profileIcon),
                                  fit: BoxFit.fill),
                            ),
                            const SizedBox(width: 10),
                            Obx(
                              () => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.user.value.fullName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    controller.user.value.email,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 120),
                            IconButton(
                              onPressed: () =>
                                  Get.to(() => const ProfileScreen()),
                              icon: const Icon(
                                Iconsax.edit,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Text(TText.accountSettings,
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Column(
              children: [
                const TCardSetting(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subtitle: TText.shoppingAddress),
                const SizedBox(height: TSizes.spaceBtwItems),
                const TCardSetting(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subtitle: TText.cartSettings),
                const SizedBox(height: TSizes.spaceBtwItems),
                const TCardSetting(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subtitle: TText.orderSettings),
                const SizedBox(height: TSizes.spaceBtwItems),
                const TCardSetting(
                    icon: Iconsax.bank,
                    title: 'Bank account',
                    subtitle: TText.bankAccount),
                const SizedBox(height: TSizes.spaceBtwItems),
                const TCardSetting(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subtitle: TText.couponsSetting),
                const SizedBox(height: TSizes.spaceBtwItems),
                const TCardSetting(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subtitle: TText.notificationSettings),
                const SizedBox(height: TSizes.spaceBtwItems),
                const TCardSetting(
                    icon: Iconsax.security_card,
                    title: 'Account privacy',
                    subtitle: TText.accountPrivacy),
                const SizedBox(height: TSizes.spaceBtwSections),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                  child: TSectionHeading(title: 'App Settings'),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                const TCardSetting(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subtitle: 'Upload data to your cloud firebase'),
                const SizedBox(height: TSizes.spaceBtwItems),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () async =>
                          await AuthenticationRepository.instance.logout(),
                      child: const Text('Logout')),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
