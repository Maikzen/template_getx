import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/src/contracts/local_data_interface.dart';
import 'package:template/src/providers/constants.dart';

class PreferencesService implements LocalDataInterface{

  late Future<SharedPreferences> _prefs;

  @override
  PreferencesService() {
    _prefs = SharedPreferences.getInstance();
  }

  @override
  Future<bool> clearAllData() async {
    SharedPreferences preferences = await _prefs;
    return preferences.clear();
  }

  @override
  Future<String?> getToken() async {
    SharedPreferences preferences = await _prefs;
    return preferences.getString(Constants.token);
  }

  @override
  Future<bool> setToken(String token) async {
    SharedPreferences preferences = await _prefs;
    return preferences.setString(Constants.token, token);
  }

}