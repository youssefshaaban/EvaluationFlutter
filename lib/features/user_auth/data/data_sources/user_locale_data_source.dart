import 'dart:convert';
import 'package:evaluation/features/user_auth/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/constants/keys.dart';

class UserLocaleDataSource {
  SharedPreferences preferences;

  UserLocaleDataSource(this.preferences);

  void saveLocalUser(LoginModel userData) async {
    String userJson = jsonEncode(userData.toJson());
    preferences.setString(Keys.cachedUser, userJson);
  }

  LoginModel? getLocalUser() {
    var userData = preferences.getString(Keys.cachedUser);

    if (userData != null) {
      Map<String, dynamic> userMap = jsonDecode(userData);
      return LoginModel.fromJson(userMap);
    }
    return null;
  }

  Future<void> removeLocalUser() async {
    preferences.remove(Keys.cachedUser);
  }
}
