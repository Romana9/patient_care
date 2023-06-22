import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/views/styles/b_style.dart';

import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';
import 'on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
            (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return SafeArea(
      child: Scaffold(
        // backgroundColor: KColor.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Patient Care',
                  style: KTextStyle.splashHeadline
                      .copyWith(color: KColor.mediumslateblue),
                ),
                Text(
                  'Your Health Partner',
                  style: KTextStyle.regularText
                      .copyWith(color:_darkTheme ?KColor.darkdimgray: KColor.dimgray, letterSpacing: 2),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(bottom: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Coded by FCIS",
                style:
                    KTextStyle.regularText.copyWith(color:_darkTheme ?KColor.white: KColor.maastrichtBlue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
