import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smile_api_new/screens/auth/signin_screen.dart';
import 'package:smile_api_new/screens/home/help.dart';
import 'package:smile_api_new/screens/home/leaderboard.dart';
import 'package:smile_api_new/screens/home/play_screen.dart';
import 'package:smile_api_new/utils/common/screen.dart';
import 'package:smile_api_new/utils/widgets/inputs/app_bar_image.dart';

import '../utils/constants/font.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    User user = FirebaseAuth.instance.currentUser!;
    FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .set({'email': user.email, 'points': FieldValue.increment(0)});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: CustomImageTitleAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ScreenUtil.verticalSpace(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Welcome to Smile API\n Game",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    height: 2,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: FontFamily.MontserratMedium,
                  ),
                ),
              ),
              ScreenUtil.verticalSpace(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PlayScreen()));
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.play_arrow_rounded,
                              size: 70,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            Text(
                              'Quick Play',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: FontFamily.MontserratMedium,
                                  fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ScreenUtil.verticalSpace(height: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const LeaderboardScreen()));
                      },
                      child: Container(
                        height: 100,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.leaderboard_rounded,
                              size: 70,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            Text(
                              'Leaderboard',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: FontFamily.MontserratMedium,
                                  fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HelpScreen()));
                      },
                      child: Container(
                        height: 100,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.help_rounded,
                              size: 70,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            Text(
                              'Help',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: FontFamily.MontserratMedium,
                                  fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
