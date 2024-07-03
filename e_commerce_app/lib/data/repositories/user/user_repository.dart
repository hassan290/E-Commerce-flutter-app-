import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/features/authentication/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async{
    try{
      await _db.collection('users').doc(user.id).set(user.toJson());
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw TFormatException();
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong when save user record in the database. Please try again';
    }
  }

  ///Function to fetch user record from the database based on user id
  Future<UserModel> fetchUserDetails() async{
    try{
      final documentSnapshot = await _db.collection('users').doc(AuthenticationRepository.instance.authUser?.uid).get();
      if(documentSnapshot.exists){
        return UserModel.fromJson(documentSnapshot);
      }else{
        return UserModel.empty();
      }
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw TFormatException();
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong when save user record in the database. Please try again';
    }
  }

  //Function to update user record in the database(Firestore)
  Future<void> updateUserDetails(UserModel updatedUser) async{
    try{
      await _db.collection('users').doc(updatedUser.id).update(updatedUser.toJson());
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw TFormatException();
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong when save user record in the database. Please try again';
    }
  }

  //Function to update any field in specific Users collection
  Future<void> updateSingleField(Map<String, dynamic> json) async{
    try{
      await _db.collection('users').doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw TFormatException();
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong when save user record in the database. Please try again';
    }
  }

  //Function to remove user record from the database(Firestore)
  Future<void> removeUserRecord(String userId) async{
    try{
      await _db.collection('users').doc(userId).delete();
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw TFormatException();
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong when save user record in the database. Please try again';
    }
  }

  //Function to upload any image
  Future<String> uploadImage(String path, XFile image) async{
    try{
      final ref=FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw TFormatException();
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong when upload image. Please try again';
    }
  }








}