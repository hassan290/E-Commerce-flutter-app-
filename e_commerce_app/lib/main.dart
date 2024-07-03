import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';
import 'app.dart';

Future<void> main() async {
  ///--Widgets Binding
  final WidgetsBinding widgetsBinding=WidgetsFlutterBinding.ensureInitialized();
  ///-- GetX Local Storage
  await GetStorage.init();
  ///-- Await Native Splash Screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Todo: Initialize Firebase
  // Todo: Initialize Authentication
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  //Todo: Run app
  runApp(const App());

}
