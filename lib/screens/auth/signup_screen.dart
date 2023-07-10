import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smile_api_new/screens/auth/signin_screen.dart';
import '../../utils/common/screen.dart';
import '../../utils/constants/font.dart';
import '../../utils/packages/email_validator.dart';
import '../../utils/widgets/inputs/app_bar.dart';
import '../../utils/widgets/inputs/app_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _passwordEditingController;
  late final TextEditingController _gamingAliasController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late String _phonePrefix;
  late DateTime _birthday;
  String? phoneError;
  String? _gender;

  @override
  void initState() {
    _passwordEditingController = TextEditingController();
    _gamingAliasController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _phonePrefix = "+94";
    _birthday = DateTime.now();

    super.initState();
  }

  @override
  void dispose() {
    _passwordEditingController.dispose();
    _gamingAliasController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Sign Up",
          automaticallyImplyLeading: false,
          actions: [
            Center(
              child: InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    AppTextField(
                      controller: _emailController,
                      title: "Email ",
                      hintText: "Enter your email here",
                      errorText: null,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 24),
                    AppTextField(
                      controller: _passwordEditingController,
                      title: "Password",
                      hintText: "Enter your password here",
                      errorText: null,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 24),
                    AppTextField(
                      controller: _gamingAliasController,
                      title: "Gaming Alias",
                      hintText: "Enter your gaming alias here",
                      errorText: null,
                      keyboardType: TextInputType.text,
                    ),
                                      
                    const SizedBox(height: 24),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignInScreen()));
                      },
                      child: const Text("Submit"),
                    ),
                    SizedBox(height: ScreenUtil.getHeight(context, 0.08)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
