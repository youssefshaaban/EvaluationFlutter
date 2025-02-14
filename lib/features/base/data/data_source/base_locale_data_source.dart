import 'package:evaluation/common/constants/keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseLocaleDataSource {
  SharedPreferences preferences;

  BaseLocaleDataSource(this.preferences);

  Future setOnBoarding() async {
    await preferences.setBool(Keys.boarded, true);
  }

  bool retrieveOnBoarding() {
    return preferences.getBool(Keys.boarded) ?? false;
  }

  Future setEmail({required String email}) async {
    await preferences.setString(Keys.email, email);
  }

  String? retrieveEmail() {
    return preferences.getString(Keys.email);
  }

  Future setPassword({required String password}) async {
    await preferences.setString(Keys.password, password);
  }

  String? retrievePassword() {
    return preferences.getString(Keys.password);
  }

  Future setisFaceIdEnabled() async {
    await preferences.setBool(Keys.faceId, true);
  }

  bool retrieveFaceId() {
    return preferences.getBool(Keys.faceId) ?? false;
  }
}
