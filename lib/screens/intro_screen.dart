import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smile_api_new/screens/auth/signin_screen.dart';
import 'package:smile_api_new/screens/auth/signup_screen.dart';
import 'package:smile_api_new/screens/home_screen.dart';
import '../../utils/common/screen.dart';
import '../../utils/constants/font.dart';
import '../../utils/widgets/inputs/app_bar.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        automaticallyImplyLeading: false,
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            fillOverscroll: true,
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: ScreenUtil.getHeight(context, 0.10),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset(
                      "assets/images/logo/smile_api_intro.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 48, vertical: 50),
                    child: ElevatedButton(
                      child: const Text('Sign Up'),
                      onPressed: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUpScreen()));
                      },
                    ),
                  ),
                  
                  const Spacer(),
                  RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Explore as a Guest",
                          style: TextStyle(
                            fontFamily: FontFamily.MontserratMedium,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const HomeScreen()));
                            },
                        ),
                      ),
                  SizedBox(height: ScreenUtil.getHeight(context, 0.05),),
                  RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onBackground),
                      children: [
                        TextSpan(
                          text: "Sign In",
                          style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.primary,
                              fontFamily: FontFamily.MontserratMedium),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                             Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignInScreen()));
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


