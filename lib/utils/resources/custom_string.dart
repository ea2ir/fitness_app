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
            'app_name': 'باشگاه تناسب اندام',
            'appbar_splashscreen': 'خوش آمدید',
            'appbar_introduction': 'معرفی',
            'appbar_selectLanguage': 'انتخاب زبان',
            'appbar_selectTheme': 'انتخاب تم',
            'appbar_categories': 'دسته بندی',
            'theme_default': 'تم پیشفرض',
            'theme_blue': 'تم آبی',
            'theme_red': 'تم قرمز',
            'theme_green': 'تم سبز',
            'introduction_exit': 'خروج',
            'introduction_text_1': '\n صفحه اول \nمعرفی امکانات اپلیکیشن',
            'introduction_text_2': '\n صفحه دوم \nمعرفی امکانات اپلیکیشن',
            'introduction_text_3': '\n صفحه سوم \nمعرفی امکانات اپلیکیشن',
            'introduction_text_4': '\n صفحه چهارم \nمعرفی امکانات اپلیکیشن',
            'introduction_text_5': '\n صفحه پنجم \nمعرفی امکانات اپلیکیشن',
            'introduction_text_6': '\n صفحه ششم \nمعرفی امکانات اپلیکیشن',
          };
        }
        break;
      default:
        {
          return  {
            'app_name': 'GYM Fittnes',
            'appbar_splashscreen': 'Wellcome',
            'appbar_introduction': 'Introduction',
            'appbar_selectLanguage': 'Select Language',
            'appbar_selectTheme': 'Select Theme',
            'appbar_categories': 'Categories',
            'theme_default': 'Default Theme',
            'theme_blue': 'Blue Theme',
            'theme_red': 'Red Theme',
            'theme_green': 'Green Theme',
            'introduction_exit': 'Exit',
            'introduction_text_1': '\n Page One \n Introdution Feautures Of Application.',
            'introduction_text_2': '\n Page Two \n Introdution Feautures Of Application.',
            'introduction_text_3': '\n Page Three \n Introdution Feautures Of Application.',
            'introduction_text_4': '\n Page Four \n Introdution Feautures Of Application.',
            'introduction_text_5': '\n Page Five \n Introdution Feautures Of Application.',
            'introduction_text_6': '\n Page Six \n Introdution Feautures Of Application.',
          };
        }
    }
  }
}
