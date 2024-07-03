import 'package:e_commerce_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/widgets/terms_and_condition_checkbox.dart';
import 'package:e_commerce_app/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signUpFormKey,
      child: Column(
        children: [
          Row(
            children: [
              ///First Name
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      TValidator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: TText.firstName,
                  ),
                ),
              ),

              const SizedBox(width: TSizes.sm),

              ///Last Name
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      TValidator.validateEmptyText('Last name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: TText.lastName,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: TSizes.spaceBetweenInputFields),

          /// User Name
          TextFormField(
            controller: controller.userName,
            validator: (value) =>
                TValidator.validateEmptyText('user name', value),
            expands: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user_edit),
              labelText: TText.userName,
            ),
          ),

          const SizedBox(height: TSizes.spaceBetweenInputFields),

          ///Email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct),
              labelText: TText.email,
            ),
          ),

          const SizedBox(height: TSizes.spaceBetweenInputFields),

          ///Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => TValidator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: TText.phoneNumber,
            ),
          ),

          const SizedBox(height: TSizes.spaceBetweenInputFields),

          ///Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validatePassword(value),
              expands: false,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye)),
                labelText: TText.password,
              ),
            ),
          ),

          const SizedBox(height: TSizes.spaceBetweenInputFields),

          const TTermsAndConditionCheckBox(),

          const SizedBox(height: TSizes.spaceBetweenInputFields),

          ///Sign Up
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signUp(),
                  child: const Text(TText.createAccount))),
        ],
      ),
    );
  }
}
