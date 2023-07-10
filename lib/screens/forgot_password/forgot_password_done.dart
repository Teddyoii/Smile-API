import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utils/constants/font.dart';
import '../../utils/widgets/inputs/app_bar.dart';

class ForgotPasswordDoneScreen extends StatefulWidget {
  const ForgotPasswordDoneScreen({super.key});

  @override
  State<ForgotPasswordDoneScreen> createState() => _ForgotPasswordDoneScreenState();
}

class _ForgotPasswordDoneScreenState extends State<ForgotPasswordDoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Forgot Password",),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              children: [
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 35),
                    child: Text(
                      "Please Check Your Email",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    child: Text(
                      "A password reset link has been sent to your dedicated email",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: FontFamily.MontserratMedium,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: RichText(
                      text: TextSpan(
                        text: "Didn’t receive the link? ",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontFamily: FontFamily.MontserratMedium,
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                        children: [
                          TextSpan(
                            text: "Resend",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontFamily: FontFamily.MontserratMedium,
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () async {
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}