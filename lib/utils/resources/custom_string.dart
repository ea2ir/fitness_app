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
            'appbar_selectLanguage': 'انتخاب زبان',
            'appbar_selectTheme': 'انتخاب تم',
            'appbar_categories': 'دسته بندی',
          };
        }
        break;
      default:
        {
          return  {
            'appbar_splashscreen': 'Wellcome',
            'appbar_introduction': 'Introduction',
            'appbar_selectLanguage': 'Select Language',
            'appbar_selectTheme': 'Select Theme',
            'appbar_categories': 'Categories',
          };
        }
    }
  }
}
