import 'package:flutter/material.dart';
import 'package:saviorcare/views/global_components/k_bottom_navigation_bar.dart';
import 'package:saviorcare/views/global_components/k_button.dart';
import 'package:saviorcare/views/styles/b_style.dart';
import 'package:provider/provider.dart';
import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';

import '../../global_components/k_app_bar.dart';
import 'component/k_otp.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      appBar: const KAppBar(title: ''),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(left: 24, right: 24, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Verification!',
                  style: KTextStyle.normal.copyWith(
                      color: _darkTheme ? KColor.white : KColor.maastrichtBlue),
                ),
                const SizedBox(height: 10),
                Text('Hey Eslam.\nLet’s verify your account!',
                    style: KTextStyle.normal.copyWith(
                        color:
                            _darkTheme ? KColor.white : KColor.maastrichtBlue,
                        fontWeight: FontWeight.w400)),
                const SizedBox(height: 14),
                Text(
                  'Verification code sent on nas*****mail.com',
                  style: KTextStyle.regularText.copyWith(
                      fontSize: 14,
                      color: _darkTheme ? KColor.darkdimgray : KColor.dimgray),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    KOtp(first: true, last: false),
                    KOtp(first: false, last: false),
                    KOtp(first: false, last: false),
                    KOtp(first: false, last: true),
                  ],
                ),
                const SizedBox(height: 26),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Resend ',
                      style: KTextStyle.regularText.copyWith(
                          color:
                              _darkTheme ? KColor.darkdimgray : KColor.dimgray,
                          fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'in 01:30',
                          style: KTextStyle.regularText.copyWith(
                              color: _darkTheme
                                  ? KColor.darkdimgray
                                  : KColor.dimgray,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                //const SizedBox(height: 298),
               
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        height: 70,
        child:  Center(
                    child: KButton(
                        onPressedCallback: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const KBottomNavigationBar( )),
                            (route) => false);
                        },
                        text: 'Confirm',
                        color: KColor.mediumslateblue,
                        textColor: KColor.white))
              ,
      ),
    );
  }
}
