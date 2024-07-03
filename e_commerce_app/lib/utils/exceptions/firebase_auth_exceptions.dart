class TFirebaseAuthException implements Exception {
  final String code;

  TFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already in registered. Please use another email address.';
      case 'invalid-email':
        return 'The email address provided is not valid. Please enter a valid email address.';
      case 'weak-password':
        return 'The password is too weak. Please use a stronger password.';
      case 'user-disabled':
        return 'The user account has been disabled. Please contact support.';
      case 'user-not-found':
        return 'Invalid login details. User not found.';
      case 'wrong-password':
        return 'The password is invalid or the user does not have a password.';
      case 'invalid-verification-code':
        return 'Invalid verification ID. Please request a new verification code.';
      case 'quota-exceeded':
        return 'The SMS quota for the project has been exceeded. Please retry later.';
      case 'email-already-exists':
        return 'The email address is already exists. Please use another email address.';
      case 'provider-already-linked':
        return 'The email address is already linked to another account. Please use another email address.';
      case 'requires-recent-login':
        return 'The user must be signed in recently. Please sign in again.';
      case 'credential-already-in-use':
        return 'The email address is already in use. Please use another email address.';
      case 'user-mismatch':
        return 'The user mismatched. Please try again.';
      default:
        return 'An undefined Error happened in firebase auth.';
    }
  }
}
