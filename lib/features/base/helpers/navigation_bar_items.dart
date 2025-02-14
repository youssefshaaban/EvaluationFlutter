import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:evaluation/common/constants/strings.dart';
import 'package:evaluation/features/home_page/presentation/screens/home_screen.dart';
import 'package:material_symbols_icons/symbols.dart';

enum NavigationBarTab {
  home,
  history;

  IconData get icon {
    switch (this) {
      case home:
        return Symbols.home;
      case history:
        return Symbols.history;
      default:
        return Symbols.home;
    }
  }

  String get title {
    switch (this) {
      case home:
        return LocaleKeys.start.tr();
      case history:
        return LocaleKeys.start.tr();
      default:
        return LocaleKeys.start.tr();
    }
  }

  Widget get page {
    switch (this) {
      case home:
        return HomePage();
      case history:
        return Container(
          child: Center(child: Text("History")),
        );
      default:
        return Container();
    }
  }

  static NavigationBarTab itemFromIndex(int ind) {
    switch (ind) {
      case 0:
        return NavigationBarTab.home;
      case 1:
        return NavigationBarTab.history;
      default:
        return NavigationBarTab.home;
    }
  }

  GlobalKey<NavigatorState>? get navigatorKey {
    switch (this) {
      case home:
        return null;
      case history:
        return null;
    }
  }

  Function? get onTapPop {
    switch (this) {
      case home:
        null;
      case history:
        null;
    }
    return null;
  }
}
