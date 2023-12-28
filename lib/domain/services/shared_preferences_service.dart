import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  static late SharedPreferences _sharedPreferences;

  static Future init() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  static Future<bool> setList(String key, List<String> value) async =>
      await _sharedPreferences.setStringList(key, value);

  static Future<List<String>> getList(String key) async =>
      _sharedPreferences.getStringList(key) ?? [];
}
