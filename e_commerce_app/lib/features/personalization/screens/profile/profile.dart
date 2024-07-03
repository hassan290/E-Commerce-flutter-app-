import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/images_text_widgets/circular_images.dart';
import 'package:e_commerce_app/common/widgets/texts/section_header.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:e_commerce_app/features/personalization/screens/setting/change_name/change_name.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/images_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        showBackButton: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx((){
                      final networkImage=controller.user.value.profilePicture;
                      final image=networkImage.isNotEmpty ? networkImage : TImages.profileIcon;
                      return TCircularImage(image: image,width: 80,height: 80,isNetworkImage: networkImage.isNotEmpty,);
                    }),
                    TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: const Text('Change profile picture')),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems/2),
              const Divider(thickness: 0.5,),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeading(title: 'Profile Information'),
              TProfileMenu(title: 'Name', value: controller.user.value.fullName, onPressed: ()=>Get.to(()=>const ChangeName()),),
              TProfileMenu(title: 'Username', value: controller.user.value.userName, onPressed: () {},),

              const SizedBox(height: TSizes.spaceBtwItems/2),
              const Divider(
                thickness: 0.5,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeading(title: 'Personal Information'),
              TProfileMenu(title: 'USer ID', value: controller.user.value.id,icon: Iconsax.copy, onPressed: () {},),
              TProfileMenu(title: 'Email', value: controller.user.value.email, onPressed: () {},),
              TProfileMenu(title: 'Phone Number', value: controller.user.value.phoneNumber, onPressed: () {},),
              TProfileMenu(title: 'Gender', value: 'Male', onPressed: () {},),
              TProfileMenu(title: 'Date of Birth', value: '10 Oct 1994', onPressed: () {},),

              const Divider(
                thickness: 0.5,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(child: TextButton(onPressed: () {}, child: const Text('Close Account',style: TextStyle(color: Colors.red),)),)
            ],
          )
        ),
      ),
    );
  }
}

