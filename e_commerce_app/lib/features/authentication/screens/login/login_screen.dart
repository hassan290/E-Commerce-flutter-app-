import 'package:e_commerce_app/common/styles/spacing_styles.dart';
import 'package:e_commerce_app/common/widgets/login_signup/form_divider.dart';
import 'package:e_commerce_app/common/widgets/login_signup/social_button.dart';
import 'package:e_commerce_app/features/authentication/screens/login/widget/login_form.dart';
import 'package:e_commerce_app/features/authentication/screens/login/widget/login_header.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../../../utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///Header Section
              const TLoginHeader(),

              ///Form Section
              const TLoginForm(),

              ///Divider Section
              TFormDivider(dividerText: TText.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///Footer Section
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
