class TPlatformException implements Exception {
  final String code;
  TPlatformException(this.code);

  String get message{
    switch(code){
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid email or password. Please double check and try again.';
      case 'too-many-requests':
        return 'Too many requests. Please try again later.';
      case 'invalid-argument':
        return 'Invalid argument provided to the authentication method.';
      case 'invalid-email':
        return 'Invalid email. Please double check and try again.';
      case 'invalid-password':
        return 'Invalid password. Please double check and try again.';
      case 'invalid-phone-number':
        return 'Invalid phone number. Please double check and try again.';
      case 'sign-in-failed':
        return 'Sign in failed. Please double check and try again.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please double check and try again.';
      case 'invalid-verification-id':
        return 'Invalid verification id. Please double check and try again.';
      case 'user-disabled':
        return 'User disabled. Please double check and try again.';
      case 'user-not-found':
        return 'User not found. Please double check and try again.';
      case 'wrong-password':
        return 'Wrong password. Please double check and try again.';
      case 'operation-not-allowed':
        return 'Operation not allowed. Please double check and try again.';
      case 'weak-password':
        return 'Weak password. Please double check and try again.';
      case 'email-already-in-use':
        return 'Email already in use. Please double check and try again.';
      case 'phone-number-already-in-use':
      default:
        return 'Unexpected error in platform.';
    }

  }

}