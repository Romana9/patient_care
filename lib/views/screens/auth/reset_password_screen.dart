import 'package:flutter/material.dart';
import 'package:saviorcare/views/global_components/k_bottom_navigation_bar.dart';
import 'package:saviorcare/views/global_components/k_button.dart';
import 'package:saviorcare/views/global_components/k_text_field.dart';
import 'package:saviorcare/views/screens/auth/sign_in_screen.dart';
import 'package:saviorcare/views/styles/b_style.dart';
import 'package:provider/provider.dart';
import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';

import '../../global_components/k_app_bar.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController resetPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reset Password',
                style: KTextStyle.normal.copyWith(
                    color: _darkTheme ? KColor.white : KColor.maastrichtBlue),
              ),
              const SizedBox(height: 10),
              Text('Hey Nabil.\nRemember this time!',
                  style: KTextStyle.normal.copyWith(
                      color: _darkTheme ? KColor.white : KColor.maastrichtBlue,
                      fontWeight: FontWeight.w400)),
              const SizedBox(height: 40),
              KTextField(
                controller: resetPasswordController,
                hintText: 'Password',
                borderRadius: 14,
              ),

              SizedBox(height: KSize.getHeight(context, 20)),
              KTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                borderRadius: 14,
              ),

              
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.transparent,
        child: Center(
                child: KButton(
                    onPressedCallback: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const SignInScreen()),
                          (route) => false);
                    },
                    text: 'Confirm',
                    color: KColor.mediumslateblue,
                    textColor: KColor.white),
              )
            ,
      ),
    );
  }
}
