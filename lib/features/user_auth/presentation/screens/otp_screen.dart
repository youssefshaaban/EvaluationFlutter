import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:evaluation/common/constants/routes.dart';
import 'package:evaluation/common/constants/strings.dart';
import 'package:evaluation/common/extensions/context_extension.dart';
import 'package:evaluation/features/base/presentation/widgets/app_primary_button.dart';
import 'package:evaluation/features/user_auth/presentation/screens/create_new_password_screen.dart';
import 'package:evaluation/gen/assets.gen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatelessWidget {
  static const routeName = './otp';

  void _onPinChanged(String value) {}

  @override
  Widget build(BuildContext context) {
    final _pinController = TextEditingController();
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
                  LocaleKeys.createNewPassword.tr(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  LocaleKeys.enterTheVerificationCode.tr(),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    controller: _pinController,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      inactiveColor: context.colorScheme.surfaceContainer,
                      activeColor: context.colorScheme.surface,
                      selectedFillColor: Colors.white,
                      selectedColor: context.colorScheme.error,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 56,
                      fieldWidth: 56,
                      inactiveFillColor: Colors.white,
                      activeFillColor: Colors.white,
                      fieldOuterPadding: const EdgeInsets.all(4),
                    ),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: true,
                    onChanged: _onPinChanged,
                    onCompleted: (v) {
                      print("Completed");
                    },
                  ),
                ),
                const SizedBox(height: 30),
                AppPrimaryButton(
                  title: LocaleKeys.next.tr(),
                  onPressed: () {
                    Navigator.of(Routes.navigatorKey.currentContext!)
                        .pushNamed(CreateNewPasswordScreen.routeName);
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
