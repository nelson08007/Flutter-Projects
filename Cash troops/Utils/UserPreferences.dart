
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

    static SharedPreferences _preferences;



   static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

   static Future setUser(bool mode) async {
    await _preferences.setBool('user', mode);
  }

    static getUser() {
    final mode = _preferences.getBool('user');
    return mode;

  }
}