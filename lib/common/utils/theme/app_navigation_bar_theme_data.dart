import 'package:flutter/material.dart';
import 'package:evaluation/common/utils/theme/app_color_scheme.dart';
import 'package:evaluation/common/utils/theme/app_theme.dart';

extension AppNavigationBarThemeData on AppTheme {
  BottomNavigationBarThemeData get navigationBarThemeData {
    return BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(fill: 1, color: colorScheme.primary),
        unselectedIconTheme: IconThemeData(color: colorScheme.scrim));
  }
}
