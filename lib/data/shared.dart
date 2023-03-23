import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static SharedPreferences? shared;
  static initShared() async {
    shared = await SharedPreferences.getInstance();
  }

  static Future<bool?> setbool(String key, bool value) async {
    return await shared!.setBool(key, value);
  }

  static getbool(String key) {
    return shared!.getBool(key);
  }
}
