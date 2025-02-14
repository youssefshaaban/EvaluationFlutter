import 'package:flutter/material.dart';
import 'package:evaluation/common/utils/theme/app_color_scheme.dart';

import 'app_theme.dart';

extension AppAppBarThemeData on AppTheme {
  AppBarTheme get appBarThemeData {
    return AppBarTheme(
        centerTitle: true, backgroundColor: colorScheme.onTertiary);
  }
}
