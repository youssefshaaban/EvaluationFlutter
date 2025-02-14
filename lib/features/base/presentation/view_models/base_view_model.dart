import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:evaluation/common/constants/routes.dart';
import 'package:evaluation/common/constants/strings.dart';
import 'package:evaluation/common/extensions/context_extension.dart';
import 'package:evaluation/features/base/data/helpers/base_error.dart';

mixin BaseViewModel {
  void handleError({BaseApiError? error}) {
    if (error == null ||
        error.errorMessage == null ||
        error.errorType == DioExceptionType.unknown) {
      showToastMessage(LocaleKeys.generalError.tr());
    } else if (error.errorType == DioExceptionType.connectionError) {
      showToastMessage(LocaleKeys.noNetworkError.tr());
    } else {
      showToastMessage(error.errorMessage ?? '');
    }
  }

  showToastMessage(
    String message, {
    String? actionTitle,
    void Function()? onActionPressed,
    bool actionBtnInSameRow = true,
  }) {
    final context = Routes.navigatorKey.currentContext;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: actionTitle != null
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      message,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.onInverseSurface,
                      ),
                    ),
                  ),
                  if (actionTitle != null && actionBtnInSameRow)
                    GestureDetector(
                      onTap: onActionPressed,
                      child: Text(
                        actionTitle,
                        style: context.textTheme.labelLarge?.copyWith(
                          color: context.colorScheme.inversePrimary,
                        ),
                      ),
                    ),
                ],
              ),
              if (actionTitle != null && !actionBtnInSameRow)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: onActionPressed,
                      child: Text(
                        actionTitle,
                        style: context.textTheme.labelLarge?.copyWith(
                          color: context.colorScheme.inversePrimary,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: context.colorScheme.inverseSurface,
        ),
      );
    }
  }

  void showCustomDialog(Dialog dialog) {
    showDialog(
        context: Routes.navigatorKey.currentContext!, builder: (_) => dialog);
  }

  void navigateToScreen(WidgetBuilder screen,
      {bool removeTop = false, bool replace = false, Function? onReturn}) {
    hideKeyboard();
    if (removeTop) {
      Routes.navigatorKey.currentState
          ?.pushAndRemoveUntil(
              MaterialPageRoute(builder: screen), (route) => false)
          .then((value) => onReturn != null ? onReturn() : null);
    } else if (replace) {
      Routes.navigatorKey.currentState
          ?.pushReplacement(MaterialPageRoute(builder: screen))
          .then((value) => onReturn != null ? onReturn() : null);
    } else {
      Routes.navigatorKey.currentState
          ?.push(MaterialPageRoute(builder: screen))
          .then((value) => onReturn != null
              ? (value != null ? onReturn(value) : onReturn())
              : null);
    }
  }

  void navigateToScreenNamed(
    String routeName, {
    bool removeTop = false,
    bool replace = false,
    Function? onReturn,
    dynamic arguments,
    GlobalKey<NavigatorState>? navigatorKey,
  }) {
    if (removeTop) {
      (navigatorKey ?? Routes.navigatorKey)
          .currentState
          ?.pushNamedAndRemoveUntil(
              routeName, arguments: arguments, (route) => false)
          .then((value) => onReturn != null ? onReturn() : null);
    } else if (replace) {
      (navigatorKey ?? Routes.navigatorKey)
          .currentState
          ?.pushReplacementNamed(routeName, arguments: arguments)
          .then((value) => onReturn != null ? onReturn() : null);
    } else {
      (navigatorKey ?? Routes.navigatorKey)
          .currentState
          ?.pushNamed(routeName, arguments: arguments)
          .then((value) => onReturn != null ? onReturn(value) : null);
    }
  }

  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
