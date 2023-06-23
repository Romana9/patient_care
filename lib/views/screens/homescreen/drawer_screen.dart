// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/controller/cubit/cubit/patient_cubit.dart';
import 'package:saviorcare/controller/theme.dart';
import 'package:saviorcare/controller/theme/them_notifier.dart';
import 'package:saviorcare/views/screens/menu/ask_free_question_screen.dart';
import 'package:saviorcare/views/screens/menu/health_feed_screen.dart';
import 'package:saviorcare/views/screens/menu/notifications_screen.dart';
import 'package:saviorcare/views/screens/menu/settings/settings_screen.dart';
import 'package:saviorcare/views/styles/b_style.dart';
import 'package:saviorcare/constants/asset_path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../menu/settings/account_info_screen.dart';
import '../startup/on_boarding_screen.dart';

class DrawerScreen extends StatefulWidget {
  final Function()? onPressedCallback;
  Image? image;
  DrawerScreen({this.onPressedCallback, this.image, Key? key})
      : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  bool _darkTheme = true;
  @override
  Widget build(BuildContext context) {
    List notification = PatientCubit.get(context).notification;
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return BlocConsumer<PatientCubit, PatientState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            color: KColor.mediumslateblue,
            padding: const EdgeInsets.only(top: 80, left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const AccountInfoScreen()));
                      },
                      child: Row(
                        children: [
                          const Image(
                              image: AssetImage(AssetPath.profile),
                              height: 64,
                              width: 64),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Eslam Oraby',
                                  style: KTextStyle.regular.copyWith(
                                      color: KColor.white, fontSize: 20)),
                              Text('nassereslam902@gmail.com',
                                  style: KTextStyle.regularText.copyWith(
                                      color: KColor.white, fontSize: 14))
                            ],
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                        onTap: widget.onPressedCallback, child: widget.image)
                  ],
                ),
                SizedBox(height: KSize.getHeight(context, 70)),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const AskFreeQuestionScreen()));
                    },
                    child: Text('Ask Free Question',
                        style: KTextStyle.regular
                            .copyWith(color: KColor.white, fontSize: 18))),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const HealthFeedScreen()));
                    },
                    child: Text('Health Feed',
                        style: KTextStyle.regular
                            .copyWith(color: KColor.white, fontSize: 18))),
                TextButton(
                    onPressed: () {},
                    child: Text('Nearby Doctors',
                        style: KTextStyle.regular
                            .copyWith(color: KColor.white, fontSize: 18))),
                Stack(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const NotificationsScreen()));
                        },
                        child: Text('Notification',
                            style: KTextStyle.regular
                                .copyWith(color: KColor.white, fontSize: 18))),
                    Positioned(
                        top: 3,
                        left: 90,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                            notification.length.toString(),
                            style: const TextStyle(color: Colors.white),
                          )),
                        )
                        // Image(
                        //     image: AssetImage(AssetPath.redDot),
                        //     height: 6,
                        //     width: 6)
                        )
                  ],
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SettingsScreen()));
                    },
                    child: Text('Settings',
                        style: KTextStyle.regular
                            .copyWith(color: KColor.white, fontSize: 18))),
                TextButton(
                    onPressed: () {
                      setState(() {
                        _darkTheme = !_darkTheme;
                      });
                      onThemeChanged(_darkTheme, themeNotifier);
                    },
                    child: Text('App Mode',
                        style: KTextStyle.regular
                            .copyWith(color: KColor.white, fontSize: 18))),
                SizedBox(height: KSize.getHeight(context, 170)),
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
                    child: Text('Log Out',
                        style: KTextStyle.regular
                            .copyWith(color: KColor.white, fontSize: 18))),
                SizedBox(height: KSize.getHeight(context, 100)),
              ],
            ),
          ),
        );
      },
    );
  }

  void onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
    (value)
        ? themeNotifier.setTheme(darkTheme)
        : themeNotifier.setTheme(lightTheme);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }
}
