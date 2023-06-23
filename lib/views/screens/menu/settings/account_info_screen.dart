import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/constants/asset_path.dart';
import 'package:saviorcare/controller/theme.dart';
import 'package:saviorcare/views/global_components/k_app_bar.dart';
import 'package:saviorcare/views/global_components/k_button.dart';
import 'package:saviorcare/views/styles/b_style.dart';

import '../../../../controller/theme/them_notifier.dart';
import '../../homescreen/history.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({Key? key}) : super(key: key);

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  accountInfo(String heading, details) {
    return Builder(builder: (context) {
      final themeNotifier = Provider.of<ThemeNotifier>(context);
      var _darkTheme = (themeNotifier.getTheme() == darkTheme);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                heading,
                style: KTextStyle.regularText.copyWith(
                    color: _darkTheme ? KColor.darkdimgray : KColor.dimgray),
              ),
              Row(
                children: [
                  Text(details,
                      style: KTextStyle.regular.copyWith(
                          color: _darkTheme
                              ? KColor.white
                              : KColor.maastrichtBlue)),
                  SizedBox(
                    width: KSize.getWidth(context, 10),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: KColor.gray,
                  )
                ],
              )
            ],
          ),
          Container(
              height: 1,
              color: _darkTheme ? KColor.darkBorder : KColor.border,
              margin: const EdgeInsets.only(top: 14, bottom: 20)),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      //backgroundColor: KColor.ghostwhite,
      appBar: const KAppBar(title: 'Account Info'),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Image(
                    image: AssetImage(AssetPath.profile),
                    height: 100,
                    width: 100,
                  ),
                ),
                SizedBox(
                  height: KSize.getHeight(context, 10),
                ),
                Text(
                  'Upload image',
                  style: KTextStyle.regular
                      .copyWith(color: KColor.mediumslateblue, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: KSize.getHeight(context, 40),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    accountInfo('Name', 'Eslam Oraby'),
                    accountInfo('Email', 'Nassereslam902@gmail.com'),
                    accountInfo('Phone', '+201025670324'),
                    accountInfo('Location', 'Mansoura,Eg'),
                    accountInfo('Gender', 'Male'),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const History()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Patient History",
                            style: KTextStyle.regularText.copyWith(
                                color: _darkTheme
                                    ? KColor.darkdimgray
                                    : KColor.maastrichtBlue),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: KColor.gray,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: KSize.getHeight(context, 197)),
                    Center(
                        child: KButton(
                            onPressedCallback: () {
                              Navigator.pop(context);
                            },
                            text: 'Save',
                            color: KColor.mediumslateblue.withOpacity(0.5),
                            textColor: KColor.white.withOpacity(0.2)))
                  ],
                )
              ],
            ),
          )),
    );
  }
}
