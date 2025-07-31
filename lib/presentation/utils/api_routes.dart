class ApiRoutes {
  //Auth
  static const String login = 'auth/login';
  static const String refreshToken = 'auth/refresh-token';
  static String changeBranch({required int branchId}) => 'user/change/branch/$branchId';
  static const String changePassword = 'user/change-password';
  static const String logout = 'auth/logout';

  //Communal
  static const String getBlocEndpoint = 'block/get';
  static const String schedule = 'communal/payment/property/schedule';
  static String debtDetail({required int id}) => 'communal/get/debt/details/$id';
  static const String debts = 'communal/search/debts';
  static const String paymentHistory = 'communal/payment/history';
  static const String payment = 'communal/create/payment';
  static String getFloor({required int blockId}) => 'block/floor/get/$blockId';
  static String getReceipt({required int id}) => 'communal/get/receipt/$id';

  //Parking
  static const String debtsParking = 'person-garage/search/debts';
  static String debtDetailParking({required int id}) => 'person-garage/get/debt/detail/$id';
  static String receiptParking({required int id}) => 'person-garage/get/receipt/$id';
  static const String paymentParking = 'person-garage/create/payment';
  static const String paymentHistoryParking = 'person-garage/payment/history';
  static const String getFields = 'field/get';
  static const String garageSchedules = 'person-garage/payment/property/schedule';
  static String getFieldsSector({required int garageFieldId}) => 'field/sector/get/by-field-id/$garageFieldId';

  //user
  static const String getBranches = 'user/branch/get';
  static const String getUser = 'user/profile';
  static const String updateUser = 'user/profile/update';
  static const String aboutUs = 'terms/about-us';
  static const String terms = 'terms/';
  static const String createFeedback = 'feedback/create';
  static String deleteUser({required int userId}) => 'user/delete/$userId';

  //Gate Barier
  static const String gateBarier = 'barrier-gate/list';
  static String gateOpen({required int id}) => 'barrier-gate/open/$id';

  //Temporary Car
  static const String  temporaryCarAdd = 'temporary-car/add';
  static const String temporaryCarList = 'temporary-car/list';
}
