import 'package:flutter/material.dart';

import 'app_color_scheme.dart';
import 'app_text_theme_data.dart';
import 'app_theme.dart';

extension AppInputDecorationThemeData on AppTheme {
  InputDecorationTheme get inputDecorationThemeData {
    return InputDecorationTheme(
      labelStyle: textThemeData.bodyLarge?.copyWith(
        color: colorScheme.outlineVariant,
      ),
      floatingLabelStyle: textThemeData.bodySmall?.copyWith(
        color: colorScheme.primary,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: colorScheme.primary),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: colorScheme.error),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: colorScheme.outlineVariant),
      ),
    );
  }
}
