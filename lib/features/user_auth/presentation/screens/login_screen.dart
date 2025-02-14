import 'package:evaluation/common/constants/routes.dart';
import 'package:evaluation/common/extensions/context_extension.dart';
import 'package:evaluation/features/base/presentation/widgets/app_primary_button.dart';
import 'package:evaluation/features/base/presentation/widgets/app_text_field.dart';
import 'package:evaluation/features/user_auth/presentation/screens/register_screen.dart';
import 'package:evaluation/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  static const routeName = './login';

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool isSecure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Center(
              child: Text(
                "Login Here",
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
                "Welcome back!",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 40),

            AppTextField(
                controller: phoneController, fieldLabel: "Phone Number"),

            const SizedBox(height: 16),

            AppTextField(
              controller: passwordController,
              fieldLabel: "Password",
              suffixIcon: isSecure ? Assets.images.eye : Assets.images.eyeSlash,
              obscureText: isSecure,
              onSuffixIconPressed: () {
                setState(() {
                  isSecure = !isSecure;
                });
              },
            ),

            const SizedBox(height: 16),
            InkWell(
              onTap: () {},
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                    color: context.colorScheme.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ),

            const SizedBox(height: 24),

            AppPrimaryButton(
              title: "Login",
              onPressed: () {},
            ),

            const SizedBox(height: 32),

            // Sign Up Option
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                InkWell(
                  onTap: () {
                    Navigator.of(Routes.navigatorKey.currentContext!)
                        .pushNamed(RegisterScreen.routeName);
                  },
                  child: Text(
                    "Create a new account",
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
