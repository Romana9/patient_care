import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:radio_group_v2/radio_group_v2.dart';
import 'package:saviorcare/views/screens/auth/sign_in_screen.dart';
import 'package:saviorcare/views/styles/b_style.dart';
import '../../global_components/k_app_bar.dart';
import '../../global_components/k_button.dart';
import '../../global_components/k_text_field.dart';
import 'package:provider/provider.dart';
import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final myGroupKey = GlobalKey<RadioGroupState>();
  RadioGroupController myController = RadioGroupController();
  var hidePassword = true;
  var ishidePassword = true;
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
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
                    'Let’s Create a account!',
                    style: KTextStyle.normal.copyWith(
                        color:
                            _darkTheme ? KColor.white : KColor.maastrichtBlue),
                  ),
                  const SizedBox(height: 10),
                  Text('Welcome.\nHope your’re doing well!',
                      style: KTextStyle.normal.copyWith(
                          color:
                              _darkTheme ? KColor.white : KColor.maastrichtBlue,
                          fontWeight: FontWeight.w400)),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RadioGroup(
                        controller: myController,
                        key: myGroupKey,
                        values: const ["Patient", "Doctor"],
                        indexOfDefault: 0,
                        orientation: RadioGroupOrientation.horizontal,
                        decoration: RadioGroupDecoration(
                          spacing: 50,
                          labelStyle: TextStyle(
                            color: _darkTheme ? KColor.white : KColor.maastrichtBlue,
                          ),
                          activeColor: KColor.mediumslateblue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  KTextField(
                    controller: nameController,
                    hintText: 'Name',
                    borderRadius: 14,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: 20),
                  KTextField(
                    controller: emailController,
                    hintText: 'Email',
                    borderRadius: 14,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 12),
                  KTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    borderRadius: 14,
                    textInputType: TextInputType.visiblePassword,
                    isPasswordField: true,
                  ),
                  const SizedBox(height: 20),
                  KTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    borderRadius: 14,
                    textInputType: TextInputType.visiblePassword,
                    isPasswordField: true,
                  ),
                  const SizedBox(height: 80),
                  Container(
                    margin: const EdgeInsets.only(left: 50),
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have account? ',
                        style: KTextStyle.regular.copyWith(
                            color:
                                _darkTheme ? KColor.dimgray : KColor.slategray,
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts.ibmPlexSansKr().fontFamily),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign In',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const SignInScreen(),
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
                  // const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.transparent,
        child: Center(
          child: KButton(
              onPressedCallback: () {
                if (nameController.text.isEmpty ||
                    emailController.text.isEmpty ||
                    passwordController.text.isEmpty ||
                    confirmPasswordController.text.isEmpty) {
                  Fluttertoast.showToast(
                      msg: "Please complete the required information",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM_LEFT,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16);
                } else if (passwordController.text.length < 8) {
                  Fluttertoast.showToast(
                      msg: 'Password is smaller than 8 char',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM_LEFT,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16);
                } else if (passwordController.text !=
                    confirmPasswordController.text) {
                  Fluttertoast.showToast(
                      msg: 'Password not match',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM_LEFT,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16);
                } else if (formKey.currentState!.validate()) {
                  register();
                }
              },
              color: KColor.mediumslateblue,
              text: 'Register',
              textColor: KColor.white),
        ),
      ),
    );
  }

  register() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const SignInScreen(),
        ),
      );
      Fluttertoast.showToast(
          msg: 'Signed Up Successfully',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_LEFT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
            msg: 'The password provided is too weak',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM_LEFT,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16);
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account already exists for that email',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM_LEFT,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Something went wrong, Please try again',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_LEFT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16);
    }
  }
}
