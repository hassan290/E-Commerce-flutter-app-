import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../common/network/network_manager.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../personalization/controllers/user_controller.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final userController=Get.put(UserController());

  ///Variables
  final localStorage = GetStorage();

  final email = TextEditingController();
  final password = TextEditingController();

  final rememberMe = false.obs;
  final hidePassword = true.obs;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  ///Functions
  Future<void> emailAndPasswordLogin() async{

    try{
      TFullScreenLoader.openDialog('Logging you in...', TImages.docerAnimation);

      final isConnected=await NetworkManager.instance.isConnected();
      if(! isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }


      if(! loginFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      final userCredentials = await AuthenticationRepository.instance.logInWithEmailAndPassword(email.text.trim(), password.text.trim());

      TFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();

    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }

  }

  Future<void> signInWithGoogle() async{
    try{
      TFullScreenLoader.openDialog('Logging you in...', TImages.docerAnimation);

      final isConnected=await NetworkManager.instance.isConnected();
      if(! isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      //Google authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      await userController.saveUserRecord(userCredentials);

      TFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }





}