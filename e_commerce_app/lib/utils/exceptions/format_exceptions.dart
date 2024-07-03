class TFormatException implements Exception {
  final String message;

  TFormatException(
      [this.message =
          "An unexpected error has occurred. Please check your input."]);

  factory TFormatException.formMessage(String message) =>
      TFormatException(message);

  String get formattedMessage => message;

  factory TFormatException.formCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return TFormatException('The email address is badly formatted. Please enter a valid email.');
      case 'invalid-phone-number-format':
        return TFormatException('The phone number is badly formatted. Please enter a valid phone number.');
      case 'invalid-date-format':
        return TFormatException('The date is badly formatted. Please enter a valid date.');
      case 'invalid-url-format':
        return TFormatException('The URL is badly formatted. Please enter a valid date.');
      case 'invalid-credit-card-format':
        return TFormatException('The credit card is badly formatted. Please enter a valid credit card.');
      case 'invalid-numeric-format':
        return TFormatException('The input should be a valid numeric format.');
      case 'invalid-password-format':
        return TFormatException('The password is badly formatted. Please enter a valid password.');
      case 'invalid-name-format':
        return TFormatException('The name is badly formatted. Please enter a valid name.');
      default:
        return TFormatException();
    }
  }
}
