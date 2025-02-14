import 'package:flutter/material.dart';

import 'app_color_scheme.dart';
import 'app_text_theme_data.dart';
import 'app_theme.dart';

extension AppTextButtonThemeData on AppTheme {
  TextButtonThemeData get textButtonThemeData {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: colorScheme.onPrimary,
        backgroundColor: colorScheme.primary,
        disabledForegroundColor: colorScheme.onSurface.withOpacity(1),
        disabledBackgroundColor: colorScheme.onSurface.withOpacity(0.12),
        textStyle: textThemeData.labelLarge?.copyWith(
          overflow: TextOverflow.ellipsis,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}
