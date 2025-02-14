import 'package:easy_localization/easy_localization.dart';
import 'package:evaluation/common/constants/routes.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './common/injection/injection_container.dart' as di;

class AppInit {
  static final AppInit _appInit = AppInit._internal();

  factory AppInit() {
    return _appInit;
  }

  AppInit._internal();

  Future initBeforeAppLaunching() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  void initAfterAppLaunching() {
    Future.delayed(Duration(milliseconds: 500), () {
      ProviderScope.containerOf(Routes.navigatorKey.currentContext!)
          .read(di.isConnectedProvider.notifier)
          .listenToNetworkChanges();
    });
  }
}
