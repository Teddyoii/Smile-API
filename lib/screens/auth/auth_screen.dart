import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:smile_api_new/screens/home_screen.dart';
import 'package:smile_api_new/screens/intro_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providerConfigs: [EmailProviderConfiguration()],
            headerBuilder: (context, constraints, _) {
              return Container(
                  color: Theme.of(context).colorScheme.primary,
                  width: 400,
                  height: 600,
                  child: Image.asset(
                    "assets/images/logo/smile_api.png",
                    fit: BoxFit.cover,
                  ));
            },
          );
        }

        // Render your application if authenticated
        return HomeScreen();
      },
    );
  }
}
