import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smile_api_new/firebase_options.dart';
import 'package:smile_api_new/screens/auth/auth_screen.dart';
import 'package:smile_api_new/screens/home/correct_screen.dart';
import 'package:smile_api_new/screens/home/play_screen.dart';
import 'package:smile_api_new/screens/intro_screen.dart';
import 'package:smile_api_new/screens/splash_screen.dart';
import 'package:smile_api_new/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: SmileTheme().theme,
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const SplashScreen(),
        '/auth': (context) => AuthScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/intro': (context) => const IntroScreen(),
        '/play': (context) => const PlayScreen(),
        '/correct': (context) => const SuccessScreen(),
      },
    );
  }
}
