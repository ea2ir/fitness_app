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
            'appbar_categories': 'دسته بندی حرکات',
            'appbar_exercise_list': 'لیست حرکات',
            'appbar_exercise': 'نحوه اجرای حرکت',
            'text_confirm': 'تائید',
            'text_are_you_sure': 'آیا اطمینان دارید ؟',
            'text_you_want_exit': 'میخواهید از برنامه خارج شوید',
            'text_yes': 'بله',
            'text_no': 'خیر',
            'text_exercise_description': 'جزئیات اجرای حرکت',
            'text_exercise_photos': 'نمایش تصاویر',
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
            'appbar_categories': 'Category Of Exercises',
            'appbar_exercise_list': 'List Of Exercises',
            'appbar_exercise': 'How To Exercise',
            'text_confirm': 'Confirm',
            'text_are_you_sure': 'Are You Sure?',
            'text_you_want_exit': 'Do You Want Exit From App',
            'text_yes': 'Yes',
            'text_no': 'No',
            'introduction_exit': 'Exit',
            'text_exercise_description': 'Show Exercise Descriptions',
            'text_exercise_photos': 'Show Photo\'s',
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
