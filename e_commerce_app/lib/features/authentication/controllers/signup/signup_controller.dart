import 'package:e_commerce_app/common/network/network_manager.dart';
import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/verfiy_email.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/popups/loaders.dart';
import '../../models/user_model.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  ///Variables
  final hidePassword = true.obs;
  final privacyPolicyAccepted = true.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  ///SignUp

  void signUp() async {
    try {
      //Start loading:
      TFullScreenLoader.openDialog('We are processing your information....',
          TImages.signUpLoaderAnimation);

      //Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if (!signUpFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Privacy Policy check
      if (!privacyPolicyAccepted.value) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
          title: 'Please accept privacy policy',
          message: 'In order to create account you must accept our privacy policy'
        );
        return;
      }

      //Register user in the firebase auth & save user data in the firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      //Save user data in the firebase firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);

      //Remove loader
      TFullScreenLoader.stopLoading();

      //Show success message
      TLoaders.successSnackBar(title: 'Congregations!', message: 'Your account has been created successfully! Please verify your email to continue.');

      //Move to verify email screen
      Get.to(()=> VerifyEmailScreen(email: email.text.trim(),));

    } catch (e) {
      //Remove loader
      TFullScreenLoader.stopLoading();

      //Show some generic error to the user
      TLoaders.errorSnackBar(title: 'On snap', message: e.toString());
    }
  }
}
