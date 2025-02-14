import 'package:flutter/material.dart';
import 'package:evaluation/gen/fonts.gen.dart';
import 'package:evaluation/common/utils/theme/app_app_bar_theme_data.dart';
import 'package:evaluation/common/utils/theme/app_color_scheme.dart';
import 'package:evaluation/common/utils/theme/app_navigation_bar_theme_data.dart';
import 'package:evaluation/common/utils/theme/app_text_theme_data.dart';
import 'package:evaluation/common/utils/theme/app_theme.dart';

import 'app_input_decoration_theme_data.dart';
import 'app_text_button_theme.dart';

extension AppThemeData on AppTheme {
  ThemeData get themeData {
    String fontFamily = FontFamily.apercu;
    return ThemeData(
        useMaterial3: true,
        fontFamily: fontFamily,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: colorScheme.onTertiary,
        textTheme: textThemeData,
        appBarTheme: appBarThemeData,
        bottomNavigationBarTheme: navigationBarThemeData,
        inputDecorationTheme: inputDecorationThemeData,
        textButtonTheme: textButtonThemeData,
        dividerColor: Colors.transparent);
  }
}
