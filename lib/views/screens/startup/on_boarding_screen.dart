import 'package:flutter/material.dart';
import 'package:saviorcare/views/screens/auth/register_screen.dart';
import 'package:saviorcare/views/styles/b_style.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';

import '../../../constants/asset_path.dart';
import '../auth/sign_in_screen.dart';
import 'package:provider/provider.dart';
import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(left: 28, right: 28, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _darkTheme
                    ? const Image(image: AssetImage(AssetPath.darkLogo))
                    : const Image(image: AssetImage(AssetPath.lightLogo)),
                const SizedBox(height: 84),
                Text(
                  'Visual Health & Prescriptions',
                  textAlign: TextAlign.center,
                  style: KTextStyle.headline.copyWith(
                      color: _darkTheme ? KColor.white : KColor.maastrichtBlue),
                ),
                Text(
                  'Find best doctor for your best healthcare routine',
                  textAlign: TextAlign.center,
                  style: KTextStyle.regularText.copyWith(
                      color: _darkTheme ? KColor.darkdimgray : KColor.dimgray),
                ),
                const SizedBox(height: 60),
                Center(
                  child: CustomSlidingSegmentedControl<int>(
                    //isStretch: true,
                    padding: 40,
                    innerPadding: const EdgeInsets.all(2),
                    children: {
                      1: Text('Register',
                          textAlign: TextAlign.center,
                          style: KTextStyle.regular
                              .copyWith(color: KColor.white, fontSize: 14)),
                      2: Text('Sign In',
                          textAlign: TextAlign.center,
                          style: KTextStyle.regular
                              .copyWith(color: KColor.white, fontSize: 14)),
                    },
                    //height: 50,
                    decoration: BoxDecoration(
                      color: KColor.mediumslateblue.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    thumbDecoration: BoxDecoration(
                      color: KColor.mediumslateblue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onValueChanged: (int value) {
                      value == 1
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const RegisterScreen()))
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SignInScreen()));
                    },
                  ),
                ),
              const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
