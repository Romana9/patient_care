import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/controller/theme.dart';
import 'package:saviorcare/views/global_components/k_bottom_navigation_bar.dart';
import 'package:saviorcare/views/global_components/k_button.dart';
import 'package:saviorcare/views/screens/auth/forget_password_screen.dart';
import 'package:saviorcare/views/screens/auth/register_screen.dart';
import 'package:saviorcare/views/styles/b_style.dart';

import '../../../controller/theme/them_notifier.dart';
import '../../global_components/k_app_bar.dart';
import '../../global_components/k_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      extendBody: true,
      appBar: const KAppBar(title: ''),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(left: 24, right: 24, top: 30),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Let’s sign you in',
                    style: KTextStyle.normal.copyWith(
                        color:
                            _darkTheme ? KColor.white : KColor.maastrichtBlue),
                  ),
                  const SizedBox(height: 10),
                  Text('Welcome back.\nYou’ve been missed!',
                      style: KTextStyle.normal.copyWith(
                          color:
                              _darkTheme ? KColor.white : KColor.maastrichtBlue,
                          fontWeight: FontWeight.w400)),
                  const SizedBox(height: 40),
                  KTextField(
                    borderRadius: 14,
                    hintText: 'Email',
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 20),
                  KTextField(
                    borderRadius: 14,
                    hintText: 'Password',
                    textInputType: TextInputType.visiblePassword,
                    controller: passwordController,
                    isPasswordField: true,
                  ),

                  const SizedBox(height: 30),
                  Container(
                    margin: const EdgeInsets.only(left: 100),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ForgetPasswordScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Forget Password?',
                        textAlign: TextAlign.center,
                        style: KTextStyle.regularText.copyWith(
                            fontSize: 14,
                            color: _darkTheme
                                ? KColor.white
                                : KColor.maastrichtBlue),
                      ),
                    ),
                  ),
                  SizedBox(height: KSize.getHeight(context, 150)),
                  Container(
                    margin: const EdgeInsets.only(left: 50),
                    child: RichText(
                      text: TextSpan(
                        text: 'Don’t have account? ',
                        style: KTextStyle.regular.copyWith(
                            color: _darkTheme
                                ? KColor.darkdimgray
                                : KColor.slategray,
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts.ibmPlexSansKr().fontFamily),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Register',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const RegisterScreen(),
                                  ),
                                );
                              },
                            style: KTextStyle.regular.copyWith(
                                color: KColor.mediumslateblue,
                                fontFamily:
                                    GoogleFonts.ibmPlexSansKr().fontFamily),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Center(
                  //   child: KButton(
                  //     onPressedCallback: () {
                  //      Navigator.of(context).pushAndRemoveUntil(
                  //             MaterialPageRoute(
                  //                 builder: (context) => const KBottomNavigationBar( )),
                  //             (route) => false);
                  //     },
                  //     color: KColor.mediumslateblue,
                  //     textColor: KColor.white,
                  //     text: 'Sign In',
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 24, right: 24),
        height: 70,
        color: Colors.transparent,
        child: KButton(
          text: 'Sign In',
          color: KColor.mediumslateblue,
          textColor: KColor.white,
          onPressedCallback: () {
            if (emailController.text.isEmpty ||
                passwordController.text.isEmpty) {
              Fluttertoast.showToast(
                  msg: "Please complete the required information",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM_LEFT,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16);
            } else if (formKey.currentState!.validate()) {
              signIn();
            }
          },
        ),
      ),
    );
  }

  signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const KBottomNavigationBar()),
          (route) => false);
      Fluttertoast.showToast(
          msg: 'Welcome to Patient Care',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_LEFT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: 'No user found for that email',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM_LEFT,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16);
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
            msg: 'Wrong password provided for that email',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM_LEFT,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16);
      }
    }
  }
}
