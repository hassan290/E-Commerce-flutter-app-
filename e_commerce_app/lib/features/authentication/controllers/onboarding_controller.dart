import 'package:e_commerce_app/features/authentication/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {

  static OnBoardingController get instance => Get.find();

  ///Variables
  final pageController = PageController();
  final currentPageIndex = 0.obs;
  ///Update current page indicator when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  ///Jump to specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  ///Update current index & jump to next page
  void nextPage() {
    if(currentPageIndex.value < 2) {
      currentPageIndex.value++;
      final storage = GetStorage();
      storage.write('isFirstTime', false);
      pageController.jumpToPage(currentPageIndex.value);
    }else{
      Get.offAll(()=>const LoginScreen());
    }
  }

  ///Update current index & jump to last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }

}