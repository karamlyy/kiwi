part of 'navigation.dart';

enum RouteName {
  login('login'),
  main('main'),
  confirmPayment('confirmPayment'),
  confirmPaymentParking('confirmPaymentParking'),
  payment('payment'),
  debugPage("debugPage"),
  paymentHistory('paymentHistory'),
  parkingPaymentHistory('parkingPaymentHistory'),
  changePassword('changePassword'),
  adoptPayment('adoptPayment'),
  adoptPaymentParking('adoptPaymentParking'),
  receipt('receipt'),
  passcode('passcode'),
  profileInformation('profileInformation'),
  settings('settings'),
  contact('contact'),
  about('about'),
  termsAndConditions("termsAndConditions"),
  complaintAndSuggestions("complaintAndSuggestions"),
  temporaryCar("temporaryCar"),
  gateBarier("gateBarier"),
  none('none');

  const RouteName(this.route);

  final String route;

  static RouteName? fromString(String? route) {
    return RouteName.values.firstWhere((element) => element.route == route);
  }
}
