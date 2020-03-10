class CustomString {
  CustomString._();

  static final CustomString _ourInstance = new CustomString._();

  static CustomString getInstance() {
    return _ourInstance;
  }
  String get mainAppbarTitle => "Flutter State Manager";

  String get blocBtnTitle => "Bloc";

  String get confirmTitle => "Confirm";

  String get detailTitle => "Detail";
}
