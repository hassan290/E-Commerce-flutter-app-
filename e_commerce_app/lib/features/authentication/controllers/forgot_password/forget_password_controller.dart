import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/utils/constants/images_strings.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/network/network_manager.dart';
import '../../screens/password_configration/reset_password.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try{
      //Start loading
      TFullScreenLoader.openDialog('We are processing your information...', TImages.docerAnimation);
      //Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Validate
      if(! forgotPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(title: 'Email Sent!', message: 'Please check your email for verification!');

      Get.to(()=>ResetPasswordScreen(email: email.text.trim()));

    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try{
      //Start loading
      TFullScreenLoader.openDialog('We are processing your information...', TImages.docerAnimation);
      //Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(title: 'Email Sent!', message: 'Please check your email for verification!');

    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Error has occurred in forgotten password', message: e.toString());
    }
  }

}