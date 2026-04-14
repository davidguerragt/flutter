import 'package:maquetacion/core/const.dart';
import 'package:maquetacion/core/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalAuthenticationDataSource {
  final SharedPreferences _prefs;

  LocalAuthenticationDataSource({SharedPreferences? sharedPreferences})
    : _prefs = sharedPreferences ?? LocalStorage().prefs;

  Future<void> saveSession(String token) async {
    await _prefs.setString(Consts.sessionTokenKey, token);
  }

  Future<String?> getSessionToken() async {
    return _prefs.getString(Consts.sessionTokenKey);
  }

  Future<void> clearSession() async {
    await _prefs.remove(Consts.sessionTokenKey);
  }
}
