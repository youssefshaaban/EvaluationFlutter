import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:evaluation/common/constants/routes.dart';
import 'package:evaluation/common/constants/strings.dart';
import 'package:evaluation/common/extensions/context_extension.dart';
import 'package:evaluation/features/base/presentation/widgets/app_primary_button.dart';
import 'package:evaluation/features/user_auth/presentation/screens/login_screen.dart';
import 'package:evaluation/gen/assets.gen.dart';

class SuccessScreenArguments {
  final String title;
  final String description;
  SuccessScreenArguments({required this.title, required this.description});
}

class SuccessScreen extends StatefulWidget {
  static const routeName = './success';

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  SuccessScreenArguments get args {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null, 'No arguments provided');
    assert(args is SuccessScreenArguments,
        'The arguments provided are not the right type');
    return args as SuccessScreenArguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.onPrimary,
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 50,
            left: 0,
            right: 100,
            bottom: 0,
            child: Image.asset(
              Assets.images.bgImage.path,
              fit: BoxFit.contain,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        Assets.images.appLogo.path,
                        height: 50,
                      ),
                      const SizedBox(height: 24),
                      Image.asset(
                        Assets.images.successmark.path,
                        height: 153,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        args.title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        args.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 32),
                      AppPrimaryButton(
                        title: LocaleKeys.backToLogin.tr(),
                        onPressed: () {
                          Navigator.of(Routes.navigatorKey.currentContext!)
                              .pushReplacementNamed(LoginScreen.routeName);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
