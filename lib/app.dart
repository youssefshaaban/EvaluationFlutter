import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:evaluation/app_init.dart';
import 'package:evaluation/common/constants/routes.dart';
import 'package:evaluation/common/injection/base_injection_container.dart';
import 'package:evaluation/splash.dart';
import 'package:evaluation/common/utils/theme/app_theme.dart';
import 'package:evaluation/common/utils/theme/app_theme_data.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EvaluationApp extends StatefulWidget {
  @override
  State<EvaluationApp> createState() => _EvaluationAppState();
}

class _EvaluationAppState extends State<EvaluationApp> {
  @override
  void initState() {
    super.initState();
    AppInit().initAfterAppLaunching();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return ResponsiveSizer(
      builder: (ctx, _, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light.themeData,
        // darkTheme: AppTheme.dark.themeData,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        initialRoute: SplashScreen.routeName,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => WillPopScope(
              onWillPop: () {
                var currentTab =
                    ProviderScope.containerOf(context).read(currentTabProvider);
                if ((currentTab.navigatorKey?.currentState?.canPop() ??
                        false) &&
                    (!Routes.navigatorKey.currentState!.canPop())) {
                  Navigator.of(currentTab.navigatorKey!.currentContext!).pop();
                  return Future.value(false);
                }
                return Future.value(true);
              },
              child: Consumer(
                builder: (_, ref, __) =>
                    Routes.generateCurrent(ref, routeSettings),
              ),
            ),
          );
        },
        navigatorKey: Routes.navigatorKey,
      ),
    );
  }
}
