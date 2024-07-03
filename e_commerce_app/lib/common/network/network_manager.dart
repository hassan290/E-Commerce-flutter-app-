import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController{

  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  //On and off the connection when will network manager will be created and disposed
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  final RxList<ConnectivityResult> _connectionStatus = [ConnectivityResult.none].obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    _connectionStatus.value = result;
    if(_connectionStatus.contains(ConnectivityResult.none)){
      TLoaders.warningSnackBar(title: 'No internet connection');
    }
  }

  Future<bool> isConnected() async {
    try{
      final result = await _connectivity.checkConnectivity();
      if(result.contains(ConnectivityResult.none)){
        return false;
      }else{
        return true;
      }
    }on PlatformException catch(_){
      return false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();

  }



}