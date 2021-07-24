import 'package:bilibili/http/core/hi_error.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 全局缓存封装
/// ⚠️ 必须先调用 `HiCache.preInit()` 完成依赖库的异步初始化
/// ```dart
/// void main() {
///   runApp(
///     MyApp(),
///   );
/// }
/// Future<void> init() async {
///   await HiCache.preInit();
/// }
///
/// final MyApp = () => FutureBuilder(
///       future: init(),
///       builder: (BuildContext context, AsyncSnapshot snapshot) {
///         if (snapshot.connectionState == ConnectionState.done) { // loaded !!!
///           return GetMaterialApp(
///             title: "Application",
///             initialRoute: AppPages.INITIAL,
///             getPages: AppPages.routes,
///             theme: AppThemes.light,
///           );
///         } else { // loading ...
///           return MaterialApp(
///             home: Scaffold(
///               appBar: AppBar(),
///               body: Container(
///                 child: Text('loading ...'),
///               ),
///             ),
///           );
///         }
///       },
///     );
/// ```
class HiCache {
  /// 真正的 `shared_preferences` 实例
  SharedPreferences? prefs;
  HiCache._() {
    init();
  }
  HiCache._pre(this.prefs) {}

  /// 初始化 `HiCache`
  /// ⚠️ 必须在使用之前调用 `HiCache.preInit()` 以确保底层实例存在
  /// 在获取 `HiCache` 之前要先异步获取的 `chared_preferences` 实例
  static preInit() async {
    if (_instance == null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _instance = HiCache._pre(prefs);
    }
  }

  /// 单例
  static HiCache? _instance;
  static HiCache getInstance() {
    return _instance ?? (_instance = HiCache._());
  }

  /// 教程中的写法
  /// 这里不应该再使用异步操作, 因为已经约定好必须先调用 `HiCache.preInit()` 初始化
  /// 所以改成了未初始化时直接抛出异常
  // void init() async {
  //   if (prefs == null) prefs = await SharedPreferences.getInstance();
  // }

  /// 初始化操作 `@diff`
  /// 这里只判断了是否调用了 `HiCache.preInit()` 并等待初始化完成
  void init() {
    if (prefs == null)
      throw NoInit(details: '请先调用 `HiCache.preInit()` 完成异步初始化', tag: 'HiCache');
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
