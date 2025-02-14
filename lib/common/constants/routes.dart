import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:evaluation/features/base/presentation/screens/app_base_screen.dart';
import 'package:evaluation/features/onboarding/screens/onboarding_screen.dart';
import 'package:evaluation/features/user_auth/presentation/screens/create_new_password_screen.dart';
import 'package:evaluation/features/user_auth/presentation/screens/forget_password_screen.dart';
import 'package:evaluation/features/user_auth/presentation/screens/login_screen.dart';
import 'package:evaluation/features/user_auth/presentation/screens/otp_screen.dart';
import 'package:evaluation/features/user_auth/presentation/screens/register_screen.dart';
import 'package:evaluation/features/user_auth/presentation/screens/success_screen.dart';
import 'package:evaluation/splash.dart';

extension Ref on GlobalKey<NavigatorState> {
  ProviderContainer? get providerScope {
    if (currentContext == null) return null;
    return ProviderScope.containerOf(currentContext!);
  }
}

class Routes {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static generateCurrent(WidgetRef ref, RouteSettings settings) {
    final name = settings.name;
    final args = settings.arguments;

    switch (name) {
      case SplashScreen.routeName:
        return SplashScreen();
      case OnboardingScreen.routeName:
        return OnboardingScreen();
      case LoginScreen.routeName:
        return LoginScreen();
      case RegisterScreen.routeName:
        return RegisterScreen();
      case ForgotPasswordScreen.routeName:
        return ForgotPasswordScreen();
      case OTPScreen.routeName:
        return OTPScreen();
      case CreateNewPasswordScreen.routeName:
        return CreateNewPasswordScreen();
      case SuccessScreen.routeName:
        return SuccessScreen();
      case AppBaseScreen.routeName:
        return AppBaseScreen();
      default:
        return SplashScreen();
    }
  }
}
