import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:saviorcare/views/global_components/k_app_bar.dart';
import 'package:saviorcare/views/global_components/k_button.dart';
import 'package:saviorcare/views/global_components/k_text_field.dart';
import 'package:saviorcare/views/screens/auth/reset_password_screen.dart';
import 'package:saviorcare/views/styles/b_style.dart';
import 'package:provider/provider.dart';
import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController forgetPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      extendBody: true,
      appBar: const KAppBar(title: ''),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 24, right: 24, top: 30),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forget Password?',
                  style: KTextStyle.normal.copyWith(
                      color: _darkTheme ? KColor.white : KColor.maastrichtBlue),
                ),
                const SizedBox(height: 10),
                Text('Hello There.\nYou forget your password?',
                    style: KTextStyle.normal.copyWith(
                        color:
                            _darkTheme ? KColor.white : KColor.maastrichtBlue,
                        fontWeight: FontWeight.w400)),
                const SizedBox(height: 40),
                KTextField(
                  controller: forgetPasswordController,
                  isLeftPadding: true,
                  hintText: 'Enter Your Email',
                  borderRadius: 14,
                ),
                //SizedBox(height: KSize.getHeight(context,300)),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        height: 70,
        child: Center(
          child: KButton(
            onPressedCallback: () async {
              if (forgetPasswordController.text.isEmpty) {
                Fluttertoast.showToast(
                    msg: "Enter Your Email Please",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM_LEFT,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16);
              } else if (formKey.currentState!.validate()) {
                try {
                  await FirebaseAuth.instance.sendPasswordResetEmail(
                      email: forgetPasswordController.text);
                  Navigator.pop(context);
                  Fluttertoast.showToast(
                      msg: "Check Your Mail Please",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM_LEFT,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16);
                } catch (e) {
                  print("eroooooooor $e");
                }
              }
            },
            text: 'Confirm',
            color: KColor.mediumslateblue,
            textColor: KColor.white,
          ),
        ),
      ),
    );
  }
}
