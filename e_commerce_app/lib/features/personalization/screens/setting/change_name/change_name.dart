import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../controllers/update_user_name_controller.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: TAppBar(
        showBackButton: true,
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Use real name for easy verification. This name will be shown publicly.',
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: TSizes.spaceBtwSections),
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value)=> TValidator.validateEmptyText('first name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TText.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                  const SizedBox(height: TSizes.spaceBetweenInputFields),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value)=> TValidator.validateEmptyText('last Name', value),

                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TText.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ],

              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
                width: double.infinity,
                child:
                    ElevatedButton(onPressed: () =>controller.updateUserName(), child: const Text('Save')))
          ],
        ),
      ),
    );
  }
}
