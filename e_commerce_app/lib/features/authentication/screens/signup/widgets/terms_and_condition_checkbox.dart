import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/signup/signup_controller.dart';

class TTermsAndConditionCheckBox extends StatelessWidget {
  const TTermsAndConditionCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignUpController>();
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(width: 24,height: 24,child: Obx(()=>Checkbox(value: controller.privacyPolicyAccepted.value, onChanged: (value) { controller.privacyPolicyAccepted.value = !controller.privacyPolicyAccepted.value;})) ),
        const SizedBox(width: TSizes.sm),
        Text.rich(TextSpan(children: [
          TextSpan(text: TText.isAgree,style: Theme.of(context).textTheme.bodySmall),
          TextSpan(text: TText.privacyPolicy,style: Theme.of(context).textTheme.bodyMedium!.apply(color: dark ? TColors.white : TColors.primary,decoration: TextDecoration.underline)),
          TextSpan(text: TText.and,style: Theme.of(context).textTheme.bodySmall),
          TextSpan(text: TText.termsOfUse,style: Theme.of(context).textTheme.bodyMedium!.apply(color: dark ? TColors.white : TColors.primary,decoration: TextDecoration.underline)),
        ],),),
      ],
    );
  }
}