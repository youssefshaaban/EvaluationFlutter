import 'package:evaluation/features/user_auth/data/models/check_human_model.dart';
import 'package:evaluation/features/user_auth/data/models/login_model.dart';

extension JsonParser on Map<String, dynamic> {
  V? parse<V>() {
    switch (V) {
      case LoginModel:
        return LoginModel.fromJson(this) as V;
      case CheckHumanModel:
        return CheckHumanModel.fromJson(this) as V;
    }
    return null;
  }
}
