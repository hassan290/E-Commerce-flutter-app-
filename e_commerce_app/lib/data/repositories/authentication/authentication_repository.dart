import 'package:e_commerce_app/features/authentication/screens/login/login_screen.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../features/authentication/screens/onboarding/onboarding_screen.dart';
import '../../../features/authentication/screens/signup/verfiy_email.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  /// Variables:
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  User? get authUser => _auth.currentUser;


  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Functions:
  screenRedirect() async {
    final user = _auth.currentUser;
    if(user != null) {
      if(user.emailVerified) {
        Get.offAll(()=>const NavigationMenu());
      }else{
        Get.offAll(()=> VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    }else{
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime')!=true ? Get.offAll(()=>const LoginScreen()) : Get.offAll(()=>const OnBoardingScreen());
    }

  }



  /*--------------------------------Email and Password sign in--------------------------------------------------*/

  ///[Email authentication] -Sign in
  Future<UserCredential> logInWithEmailAndPassword(String email, String password) async {
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw TFormatException();
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong';
    }
  }

  /// [Email authentication] -Register

  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw TFormatException();
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong';
    }

  }

  /// [Email verification] -Mail verification
  Future<void> sendEmailVerification() async {
    try{
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw TFormatException();
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong';
    }
  }

  /// [EmailAuthentication] -Forgot Password
  Future<void> sendPasswordResetEmail(String email) async {
    try{
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw TFormatException();
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong';
    }
  }

  /// [Email authentication] -Sign in with Google
  Future<UserCredential?> signInWithGoogle() async {
    try{
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credential);

    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw TFormatException();
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      if(kDebugMode) print('Something went wrong: $e');
      return null;
    }

  }








  /*--------------------------end Federated identity & social media sign in--------------------------------------------------*/
  /// [LogoutUser] -validate for any authentication
  Future<void> logout() async {
    try{
      await _auth.signOut();
      Get.offAll(()=>const LoginScreen());
    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw TFormatException();
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong';
    }
  }



}