import 'package:flutter/material.dart';

enum AppLocale {
  en,
  ar;

  Locale get locale {
    switch (this) {
      case en:
        return Locale('en');
      case ar:
        return Locale('ar');
      default:
        return Locale('en');
    }
  }

  String get string {
    switch (this) {
      case en:
        return 'en';
      case ar:
        return 'ar';
      default:
        return 'en';
    }
  }
}
