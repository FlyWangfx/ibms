import 'package:shared_preferences/shared_preferences.dart';

///数据库相关的工具
class SharedPreferenceUtil {
  static const String ACCESS_TOKEN = 'access_token';
  static const String USERNAME = "username";
  static const String PASSWORD = "password";

  /// string
  static Future<bool> setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result = await prefs.setString(key, value);
    return result;
  }

  static Future<String?> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? result = prefs.getString(key);
    return result;
  }

  /// stringList
  static Future<bool> setStringList(String key, List<String> value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool result = await sharedPreferences.setStringList(key, value);
    return result;
  }

  static Future<List<String>?> getStringList(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? result = sharedPreferences.getStringList(key);
    return result;
  }

  ///
  static removeLocal(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static removeLocalAll() async {
    List<String> unRemoveKeys = [
      USERNAME,
      PASSWORD,
    ];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getKeys().forEach((String key) {
      if (!unRemoveKeys.contains(key)) {
        prefs.remove(key);
      }
    });
  }

  static clearLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static Future containsKey(text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(text);
  }
}
