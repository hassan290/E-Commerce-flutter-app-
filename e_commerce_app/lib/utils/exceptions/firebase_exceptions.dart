class TFirebaseException implements Exception {
  final String code;

  TFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown Firebase error occurred. Please try again.';
      case 'invalid-custom-token':
        return 'The custom token format is incorrect. Please check the documentation.';
      case 'custom-token-mismatch':
        return 'The custom token corresponds to a different audience.';
      case 'user-disabled':
        return 'The Firebase user account has been disabled.';
      case 'user-not-found':
        return 'There is no user corresponding to the given email or UID.';
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'wrong-password':
        return 'The password is invalid or the user does not have a password.';
      case 'weak-password':
        return 'The password is too weak. Please use a stronger password.';
      case 'provider-already-linked':
        return 'The provider has already been linked to the user.';
      default:
        return 'Something went wrong in firebase.';
    }
  }
}
