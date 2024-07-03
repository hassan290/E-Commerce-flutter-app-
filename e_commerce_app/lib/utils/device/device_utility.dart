import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TDeviceUtility {

  //hide keyboard
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  //set status bar color
  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
    ));
  }

  //check if orientation is landscape
  static bool isLandscapeOrientation(BuildContext context) {
    final viewInsets=View.of(context).viewInsets;
    return viewInsets.bottom==0;
  }

  //check if orientation is portrait
  static bool isPortraitOrientation(BuildContext context) {
    final viewInsets=View.of(context).viewInsets;
    return viewInsets.bottom!=0;
  }

  //set full screen
  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  //get screen height
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  //
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  //get pixel ratio
  static double getPixelRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }

  //get status bar height
  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  //get bottom navigation bar height
  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  //get app bar height
  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  //get keyboard height
  static double getKeyboardHeight() {
    //TODO: implement
    final viewInsets=MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }

  //check if keyboard is visible
  static Future<bool> isKeyboardVisible() async {
    //TODO: implement
    final viewInsets=View.of(Get.context!).viewInsets;
    return viewInsets.bottom!=0;
  }

  //check if physical device
  static Future<bool> isPhysicalDevice() async {
    return defaultTargetPlatform==TargetPlatform.android || defaultTargetPlatform==TargetPlatform.iOS;
  }

  //vibrate
  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () {
      HapticFeedback.vibrate();
    });
  }

  static Future<void> sharedPreferredOrientations(List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  //hide status bar
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  //show status bar
  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }

  //check if device has internet
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  //check if platform is tablet
  static bool isTablet() {
    return false;
  }

  //check if platform is ios
  static bool isIOS() {
    return Platform.isIOS;
  }

  //check if platform is android
  static bool isAndroid() {
    return Platform.isAndroid;
  }

  //launch url:
  static void launchUrl(String url) async{
    if(await launchUrlString(url)){
      await launchUrlString(url);
    }else{
      throw 'Could not launch $url';
    }
  }

}