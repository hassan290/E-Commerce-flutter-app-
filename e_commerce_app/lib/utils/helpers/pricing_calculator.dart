class TPricingCalculator {

  static double calculateTotalPrice(double productPrice, String location) {

    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location);

    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;

  }

  ///Calculate shipping cost
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  ///Calculate tax
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    //Look up tax rate based on location from database or API
    //return the appropriate tax rate
    return 0.10;  //Example tax rate 10%
  }

  static double getShippingCost(String location) {
    //Look up shipping cost based on location from database or API
    //return the appropriate shipping cost based on various factors like distance, weight, etc.
    return 5.00;  //Example shipping cost 5$
  }








}