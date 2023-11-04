import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeLanguage with ChangeNotifier {
  String _currentLanguage = 'English';
  String _currentLocale = 'en';

  //getter for getting current locale
  String get currentLocale => _currentLocale;
  //getter for getting current language
  String get currentLanguage => _currentLanguage;

  void setLanguage(String lang) async {
    _currentLocale = lang;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //saving current language to shared prefs
    prefs.setString('currentLocale', lang);
  }

  String getLanguage(SharedPreferences prefs) {
    // getting the prefs cause needed the result instantly
    return prefs.getString('currentLocale') ?? _currentLocale;
  }
}
