import 'package:evaluation/common/constants/routes.dart';
import 'package:evaluation/common/extensions/context_extension.dart';
import 'package:evaluation/features/base/presentation/widgets/app_primary_button.dart';
import 'package:evaluation/features/base/presentation/widgets/app_text_field.dart';
import 'package:evaluation/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});
  static const routeName = './register';

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isSecurePassword = true;
  bool isSecureConfirmPassword = true;
  bool isChecked = true;
  bool isOfficeSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Center(
              child: Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                "Create your account now and enjoy our services",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            AppTextField(
                controller: phoneController, fieldLabel: "Phone Number"),
            SizedBox(height: 32),
            AppTextField(
                controller: passwordController,
                fieldLabel: "Password",
                obscureText: isSecurePassword,
                suffixIcon: isSecurePassword
                    ? Assets.images.eye
                    : Assets.images.eyeSlash,
                onSuffixIconPressed: () {
                  setState(() {
                    isSecurePassword = !isSecurePassword;
                  });
                }),
            SizedBox(height: 32),
            AppTextField(
                controller: confirmPasswordController,
                fieldLabel: "Confirm Password",
                obscureText: isSecureConfirmPassword,
                suffixIcon: isSecureConfirmPassword
                    ? Assets.images.eye
                    : Assets.images.eyeSlash,
                onSuffixIconPressed: () {
                  setState(() {
                    isSecureConfirmPassword = !isSecureConfirmPassword;
                  });
                }),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isOfficeSelected = true;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: isOfficeSelected
                              ? context.colorScheme.primary
                              : Colors.grey,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                        ),
                        child: Center(
                          child: Text(
                            'Office',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isOfficeSelected = false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: !isOfficeSelected
                              ? context.colorScheme.primary
                              : Colors.grey,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                        ),
                        child: Center(
                          child: Text(
                            'Man',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    }),
                Text('I agree to the terms and conditions'),
              ],
            ),
            SizedBox(height: 20),
            AppPrimaryButton(title: "Sign Up", onPressed: () {}),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? "),
                InkWell(
                  onTap: () {
                    Navigator.of(Routes.navigatorKey.currentContext!).pop();
                  },
                  child: Text(
                    "Login now",
                    style: TextStyle(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
