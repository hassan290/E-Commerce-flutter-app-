import 'package:e_commerce_app/data/repositories/user/user_repository.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce_app/utils/constants/images_strings.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../common/network/network_manager.dart';

class UpdateNameController extends GetxController{
  static UpdateNameController get instance => Get.find();

  final firstName=TextEditingController();
  final lastName=TextEditingController();
  final userController=UserController.instance;
  final userRepository=Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey=GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text=userController.user.value.firstName;
    lastName.text=userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try{
      TFullScreenLoader.openDialog('We are processing your information...', TImages.docerAnimation);
      final isConnected=await NetworkManager.instance.isConnected();
      if(!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if(!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name={'FirstName': firstName.text.trim(), 'lastName':lastName.text.trim()};

      await userRepository.updateSingleField(name);

      userController.user.value.firstName=firstName.text.trim();
      userController.user.value.lastName=lastName.text.trim();

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your name has been updated');

      Get.off(() => const ProfileScreen());

    } catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'On snap!', message: e.toString());
    }


  }











}