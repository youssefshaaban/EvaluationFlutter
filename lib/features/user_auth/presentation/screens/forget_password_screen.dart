import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:evaluation/common/constants/routes.dart';
import 'package:evaluation/common/constants/strings.dart';
import 'package:evaluation/common/extensions/context_extension.dart';
import 'package:evaluation/features/base/presentation/widgets/app_primary_button.dart';
import 'package:evaluation/features/base/presentation/widgets/app_text_field.dart';
import 'package:evaluation/features/user_auth/presentation/screens/otp_screen.dart';
import 'package:evaluation/gen/assets.gen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const routeName = './forget_password';
  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController();
    return Scaffold(
      backgroundColor: context.colorScheme.onPrimary,
      appBar: _buildAppBar(),
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    Assets.images.appLogo.path,
                    height: 60,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  LocaleKeys.forgetPassword.tr(),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  LocaleKeys.dontWorry.tr(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 30),
                AppTextField(
                    controller: phoneController,
                    fieldLabel: LocaleKeys.enteryourPhoneNumber.tr()),
                const SizedBox(height: 30),
                AppPrimaryButton(
                  title: LocaleKeys.next.tr(),
                  onPressed: () {
                    Navigator.of(Routes.navigatorKey.currentContext!)
                        .pushNamed(OTPScreen.routeName);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(Routes.navigatorKey.currentContext!).pop();
          },
          child: SizedBox(
            width: 32,
            height: 32,
            child: Image.asset(
              Assets.images.back.path,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
