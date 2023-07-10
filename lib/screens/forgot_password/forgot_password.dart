import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smile_api_new/screens/forgot_password/forgot_password_done.dart';

import '../../utils/constants/font.dart';
import '../../utils/widgets/inputs/app_bar.dart';
import '../../utils/widgets/inputs/app_textfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController emailEditingController;

  @override
  void initState() {
    emailEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const CustomAppBar(title: "Forgot Password"),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 35),
                      child: Text(
                        "Enter your registered email address below and we’ll send you a password reset email",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: FontFamily.MontserratMedium,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    AppTextField(
                      controller: emailEditingController,
                      title: "Email",
                      hintText: "Enter your email address here",
                      errorText: null,
                      keyboardType: TextInputType.text,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 48, vertical: 20),
                      child: ElevatedButton(
                        child: const Text('Submit'),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordDoneScreen()));
                        },
                      ),
                    ),
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