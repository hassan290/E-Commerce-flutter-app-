import 'package:e_commerce_app/features/authentication/controllers/forgot_password/forget_password_controller.dart';
import 'package:e_commerce_app/features/authentication/screens/login/login_screen.dart';
import 'package:e_commerce_app/utils/constants/images_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/text_strings.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: ()=> Get.back(), icon: const Icon(CupertinoIcons.clear))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Image(image: const AssetImage(TImages.deliveredEmailIllustration),width: THelperFunctions.screenWidth()*0.6),
            const SizedBox(height: TSizes.spaceBtwSections,),
            Text(email,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Text(TText.changeYourPasswordSubtitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
            const SizedBox(height: TSizes.spaceBtwSections*2,),
            SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=> Get.to(() => const LoginScreen()), child: const Text(TText.done))),
            const SizedBox(height: TSizes.spaceBtwItems,),
            TextButton(onPressed: ()=>ForgetPasswordController.instance.resendPasswordResetEmail(email), child: const Text(TText.resendEmail)),

          ],
        ),
      ),
    );
  }
}
