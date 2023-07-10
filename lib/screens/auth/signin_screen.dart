import 'package:flutter/gestures.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:smile_api_new/screens/auth/signup_screen.dart';
import 'package:smile_api_new/screens/forgot_password/forgot_password.dart';
import 'package:smile_api_new/screens/home_screen.dart';

import '../../utils/common/screen.dart';
import '../../utils/constants/font.dart';
import '../../utils/widgets/inputs/app_bar.dart';
import '../../utils/widgets/inputs/app_textfield.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController passwordEditingController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    passwordEditingController = TextEditingController();
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordEditingController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const CustomAppBar(title: "Sign In"),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(
                      height: ScreenUtil.getHeight(context, 0.1),
                    ),
                    SizedBox(
                      width: ScreenUtil.getWidth(context, 0.9),
                      child: Container(
                        height: 100,
                        width: 100,
                        child: Image.asset(
                          "assets/images/logo/smile_api_intro.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                     SizedBox(
                      height: ScreenUtil.getHeight(context, 0.05),
                    ),
                    AppTextField(
                      controller: _emailController,
                      title: "Email",
                      hintText: "Type your email here",
                      errorText: null,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      controller: passwordEditingController,
                      title: "Password",
                      hintText: "Type your password here",
                      obscureText: true,
                      errorText: null,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Forgot Password?",
                          style: TextStyle(
                            fontFamily: FontFamily.MontserratMedium,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordScreen(),
                                ),
                              );
                            },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 48, vertical: 8),
                      child: ElevatedButton(
                        child: const Text('Sign In'),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const HomeScreen()));
                        },
                      ),
                    ),
                    const Spacer(),
                    RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.onBackground),
                        children: [
                          TextSpan(
                            text: "Sign Up",
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.primary,
                                fontFamily: FontFamily.MontserratMedium),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                             Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SignUpScreen()));
                              },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
