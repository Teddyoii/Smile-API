import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smile_api_new/screens/intro_screen.dart';
import 'package:smile_api_new/utils/common/screen.dart';
import 'package:smile_api_new/utils/widgets/inputs/app_bar.dart';
import 'package:smile_api_new/utils/widgets/inputs/more_menu_tiles.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Help",
        ),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    ScreenUtil.verticalSpace(height: 20),
                    InkWell(
                      child: MoreMenuTile(
                        icon: Icons.person,
                        title: 'Account Settings',
                      ),
                    ),

                    ScreenUtil.verticalSpace(height: 20),
                    InkWell(
                      child: MoreMenuTile(
                        icon: Icons.description,
                        title: 'Terms and Conditions',
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    // ignore: prefer_const_constructors
                    InkWell(
                        // onTap: () async {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const PrivacyPolicy(),
                        //     ),
                        //   );
                        // },
                        child: const MoreMenuTile(
                      icon: Icons.shield,
                      title: "Privacy Policy",
                    )),
                    const SizedBox(
                      height: 12,
                    ),
                    // ignore: prefer_const_constructors
                    InkWell(
                        // onTap: () async {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const AboutUs(),
                        //     ),
                        //   );
                        // },
                        child: const MoreMenuTile(
                      icon: Icons.info_rounded,
                      title: "About Us",
                    )),
                    const SizedBox(
                      height: 12,
                    ),
                    // ignore: prefer_const_constructors
                    InkWell(
                        // onTap: () async {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const ContactUs(),
                        //     ),
                        //   );
                        // },
                        child: const MoreMenuTile(
                      icon: Icons.call,
                      title: "Contact Us",
                    )),
                    SizedBox(
                      height: 14,
                    ),
                    const Spacer(),
                    ElevatedButton(
                        child: const Text('Logout'),
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushReplacementNamed(context, '/auth');
                        }),
                    const SizedBox(height: 50),
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
