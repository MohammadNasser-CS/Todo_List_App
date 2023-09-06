import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/core/constants/cache_keys.dart';

class SharedPreferenceClass {
  SharedPreferences? _sharedPreferences;
  Future<void> initialize() async {
    if (_sharedPreferences != null) {
      return;
    }
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setOnBoardingPage() async {
    try {
      if (_sharedPreferences == null) return;
      await _sharedPreferences!.setBool(CacheKeys.onBoarding, true);
    } catch (e) {
      return;
    }
  }

  Future<bool> getOnBoardingPage() async {
    try {
      if (_sharedPreferences == null) return false;
      final result = _sharedPreferences!.getBool(CacheKeys.onBoarding);
      return result ?? false;
    } catch (e) {
      return false;
    }
  }
}
