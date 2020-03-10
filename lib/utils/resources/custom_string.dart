class CustomString {
  CustomString._();

  static final CustomString _ourInstance = new CustomString._();

  static CustomString getInstance() {
    return _ourInstance;
  }

  Map<String, String> selectLanguage(String selectedLanguage) {
    switch (selectedLanguage) {
      case "فارسی":
        {
          return  {
            'appbar_splashscreen': 'خوش آمدید',
            'appbar_introduction': 'معرفی',
          };
        }
        break;
      default:
        {
          return  {
            'appbar_splashscreen': 'Wellcome',
            'appbar_introduction': 'Introduction',
          };
        }
    }
  }
}
