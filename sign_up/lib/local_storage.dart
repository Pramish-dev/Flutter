// ignore: file_names
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

class StorageHelper {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future saveData(bool isLogin) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool('isLogin', isLogin);
  }

  Future getData() async {
    final SharedPreferences prefs = await _prefs;
    var response = prefs.getBool('isLogin') ?? false;
    return response;
  }
}
