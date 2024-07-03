import 'package:intl/intl.dart';

class TFormatter {
  static String formDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MM-YYYY')
        .format(date); //Customize Date Format as needed. Ex: 21-07-2022
  }

  static String formatCurrency(double value) {
    return NumberFormat.currency(locale: 'en-US', symbol: '\$')
        .format(value); //Customize Currency Format as needed. Ex: $123.45
  }

  static String formatPhoneNumber(String phoneNumber) {
    //Assumes 10 or 11 digit US phone number format: (123) 456-7890
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)}-${phoneNumber.substring(7)}';
    } else {
      return phoneNumber;
    }
  }

  static String internalPhoneNumber(String phoneNumber) {
    //Remove all non-digits characters from the phone number
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    //Extract the country code
    String countryCode = '+${digitsOnly.substring(2)}';
    digitsOnly = digitsOnly.substring(2);

    //Add the remaining digits
    final formattedNumber = StringBuffer();
    formattedNumber.write(countryCode);
    int i = 0;
    while (i < digitsOnly.length) {
      int groupLength = 2;
      if (i == 0 && countryCode == '+1') {
        groupLength = 3;
      }

      int end = i + groupLength;
      formattedNumber.write(digitsOnly.substring(i, end));

      if (end < digitsOnly.length) {
        formattedNumber.write('');
      }

      i = end;
    }
    return formattedNumber.toString();
  }
}
