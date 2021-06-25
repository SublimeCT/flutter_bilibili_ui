import 'package:shared_preferences/shared_preferences.dart';

class HiCache {
  SharedPreferences? prefs;
  HiCache._() {
    init();
  }
  HiCache._pre(this.prefs) {}
  static preInit() async {
    if (_instance == null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _instance = HiCache._pre(prefs);
    }
  }

  static HiCache? _instance;
  static HiCache getInstance() {
    return _instance ?? (_instance = HiCache._());
  }

  void init() async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
  }

  setString(String key, String value) => prefs?.setString(key, value);
  setDouble(String key, double value) => prefs?.setDouble(key, value);
  setInt(String key, int value) => prefs?.setInt(key, value);
  setBool(String key, bool value) => prefs?.setBool(key, value);
  setStringList(String key, List<String> value) =>
      prefs?.setStringList(key, value);

  getString(String key, [String defuaultVal = '']) =>
      prefs?.getString(key) ?? defuaultVal;
  getDouble(String key, [double defuaultVal = 0.0]) =>
      prefs?.getDouble(key) ?? defuaultVal;
  getInt(String key, [int defuaultVal = 0]) =>
      prefs?.getInt(key) ?? defuaultVal;
  getBool(String key, [bool defuaultVal = false]) =>
      prefs?.getBool(key) ?? defuaultVal;
  getStringList(String key, [List<dynamic> defuaultVal = const []]) =>
      prefs?.getStringList(key) ?? defuaultVal;
}
