import 'dart:async';
import 'package:evaluation/common/injection/user_injection_container.dart';
import 'package:evaluation/features/base/presentation/screens/app_base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:evaluation/common/constants/routes.dart';
import 'package:evaluation/features/user_auth/presentation/screens/login_screen.dart';
import 'package:evaluation/gen/assets.gen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static const routeName = './splash';

  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        // ProviderScope.containerOf(context, listen: false)
        //     .read(userProvider.notifier)
        //     .onInitAppUser();
      },
    );
    super.initState();
    Timer(Duration(seconds: 3), () {
      final currentUser = ref.read(userProvider.notifier);
      final user = currentUser.getLocalUserProfile();
      if (user != null) {
        Navigator.of(Routes.navigatorKey.currentContext!)
            .pushReplacementNamed(AppBaseScreen.routeName);
      } else {
        Navigator.of(Routes.navigatorKey.currentContext!)
            .pushReplacementNamed(AppBaseScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 235, 235),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.white,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset(Assets.images.splashScreen),
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "التقييم العقاري",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
