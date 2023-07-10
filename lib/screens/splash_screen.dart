import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    new Timer(const Duration(seconds: 1),
        () => Navigator.pushNamed(context, '/auth'));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
        child: Center(
          child: Stack(children: [
            Center(
              child: Image.asset(
                "assets/images/logo/smile_api.png",
                height: 500,
                width: 500,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
