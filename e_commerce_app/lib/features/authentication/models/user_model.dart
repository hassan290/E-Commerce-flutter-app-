import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../utils/formatters/formatter.dart';

class UserModel{
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture
  });

  //Helper function to get the full name of the user
  String get fullName => '$firstName $lastName';

  //Helper function to format the phone number
  String get formattedPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);

  //static function to split the full name into first and last name
  static List<String> nameParts(String fullName) => fullName.split(' ');

  static String generateUserName(fullName){
    List<String> nameParts = fullName.split(' ');
    String firstName= nameParts[0].toLowerCase();
    String lastName = nameParts.length>1 ? nameParts[1].toLowerCase() : '';

    String camelCaseUserName="$firstName$lastName";
    String userNameWithPrefix="cwt_$camelCaseUserName";
    return userNameWithPrefix;
  }

  //static function to create an empty user
  static UserModel empty() => UserModel(id: '', firstName: '', lastName: '', userName: '', email: '', phoneNumber: '', profilePicture: '');

  //convert model to json structure for storing data in Firebase
  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'userName': userName,
    'email': email,
    'phoneNumber': phoneNumber,
    'profilePicture': profilePicture
  };

  //factory method to create a user model from a Firebase document snapshot
  factory UserModel.fromJson(DocumentSnapshot<Map<String, dynamic>> document){
    if(document.data() !=null){
      final data=document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        userName: data['userName'] ?? '',
        email: data['email'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        profilePicture: data['profilePicture'] ?? '',
      );
    }
    return UserModel.empty();
  }


}



