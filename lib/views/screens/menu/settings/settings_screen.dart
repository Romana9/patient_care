import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/views/screens/menu/settings/account_info_screen.dart';
import 'package:saviorcare/views/screens/menu/settings/message_us_screen.dart';
import 'package:saviorcare/views/screens/menu/settings/request_feature_screen.dart';
import 'package:saviorcare/views/styles/b_style.dart';

import '../../../../controller/theme.dart';
import '../../../../controller/theme/them_notifier.dart';
import '../../startup/on_boarding_screen.dart';
import '../../startup/plan_screen.dart';
import 'change_password_screen.dart';
import 'feedback_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List settingList = [
    {'id': 1, 'settings': 'Message us'},
    {'id': 2, 'settings': 'Request feature'},
    {'id': 3, 'settings': 'Give us feedback'},
    {'id': 4, 'settings': 'Invite friends'},
    {'id': 5, 'settings': 'Join Community'},
  ];
  List otherSettingList = [
    {'id': 6, 'settings': 'Manage subcriptions'},
    {'id': 7, 'settings': 'Account info'},
    {'id': 8, 'settings': 'Change password'},
  ];
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: _darkTheme ? KColor.darkBg : KColor.ghostwhite,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text('Settings',
                style: KTextStyle.regular.copyWith(
                    color: _darkTheme ? KColor.white : KColor.maastrichtBlue,
                    fontWeight: FontWeight.w600)),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              margin: const EdgeInsets.only(left: 24, right: 24, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'App Related',
                    style: KTextStyle.regularText.copyWith(
                        fontSize: 14,
                        color:
                            _darkTheme ? KColor.darkdimgray : KColor.dimgray),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: List.generate(
                        settingList.length,
                        (index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    settingList[index]['id'] == 1
                                        ? Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    const MessegeUsScreen()))
                                        : settingList[index]['id'] == 2
                                            ? Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        const RequestFeatureScreen()))
                                            : settingList[index]['id'] == 3
                                                ? Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            const FeedbackScreen()))
                                                : null;
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 20, bottom: 14),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          settingList[index]['settings'],
                                          style: KTextStyle.regular.copyWith(
                                            color: _darkTheme
                                                ? KColor.white
                                                : KColor.maastrichtBlue,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const Icon(
                                          Icons.arrow_forward_ios_sharp,
                                          size: 15,
                                          color: Color(0xFF818385),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  color: _darkTheme
                                      ? KColor.darkBorder
                                      : KColor.border,
                                )
                              ],
                            )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Other Settings',
                    style: KTextStyle.regularText.copyWith(
                        fontSize: 14,
                        color:
                            _darkTheme ? KColor.darkdimgray : KColor.dimgray),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: List.generate(
                        otherSettingList.length,
                        (index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    otherSettingList[index]['id'] == 7
                                        ? Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    const AccountInfoScreen()))
                                        : otherSettingList[index]['id'] == 8
                                            ? Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        const ChangePasswordScreen()))
                                            : otherSettingList[index]['id'] == 6
                                                ? Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            const PlanScreen()))
                                                : null;
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 20, bottom: 14),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          otherSettingList[index]['settings'],
                                          style: KTextStyle.regular.copyWith(
                                              //fontWeight: FontWeight.w600,
                                              color: _darkTheme
                                                  ? KColor.white
                                                  : KColor.maastrichtBlue),
                                        ),
                                        const Icon(
                                          Icons.arrow_forward_ios_sharp,
                                          size: 15,
                                          color: Color(0xFF818385),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  color: _darkTheme
                                      ? KColor.darkBorder
                                      : KColor.border,
                                )
                              ],
                            )),
                  ),
                  SizedBox(
                    height: KSize.getHeight(context, 20),
                  ),
                  TextButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OnBoardingScreen()));
                      Fluttertoast.showToast(
                          msg: "Logged out successfully",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM_LEFT,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                    child: Text(
                      'Log Out',
                      style: KTextStyle.regular.copyWith(
                          fontWeight: FontWeight.w600, color: KColor.red),
                    ),
                  ),
                  SizedBox(
                    height: KSize.getHeight(context, 80),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
