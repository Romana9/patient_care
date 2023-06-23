import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/views/global_components/k_app_bar.dart';
import 'package:saviorcare/views/styles/b_style.dart';

import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({Key? key}) : super(key: key);

  @override
  _PlanScreenState createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      appBar: const KAppBar(
        title: '',
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.only(left: 27, right: 27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: KSize.getHeight(context, 30)),
              Text(
                'Choose Your Best Plan!',
                style: KTextStyle.normal.copyWith(
                    color: _darkTheme ? KColor.white : KColor.maastrichtBlue,
                    fontSize: 30),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: KSize.getHeight(context, 10)),
              Text(
                'You can start with free access and then upgrade with subscirtion',
                style: KTextStyle.regularText.copyWith(
                    color: _darkTheme ? KColor.dimgray : KColor.dimgray,
                    fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: KSize.getHeight(context, 30)),
              Container(
                padding: const EdgeInsets.only(
                    left: 48, right: 48, top: 30, bottom: 30),
                //height: KSize.getHeight(context, 233),
                width: KSize.getWidth(context, double.infinity),
                decoration: BoxDecoration(
                    color: KColor.mediumslateblue,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '\300EG / Week',
                      style: KTextStyle.normal
                          .copyWith(color: KColor.white, fontSize: 28),
                    ),
                    SizedBox(height: KSize.getHeight(context, 17)),
                    Text(
                      'Unlimited access with the doctor and get daily notes, article and get free consult for seven days',
                      textAlign: TextAlign.center,
                      style: KTextStyle.regularText
                          .copyWith(fontSize: 14, color: KColor.lavender),
                    ),
                    SizedBox(height: KSize.getHeight(context, 27)),
                    Text(
                      'I Choose this',
                      textAlign: TextAlign.center,
                      style:
                          KTextStyle.regularText.copyWith(color: KColor.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: KSize.getHeight(context, 20)),
              Container(
                padding: const EdgeInsets.only(
                    left: 48, right: 48, top: 30, bottom: 30),
                // height: KSize.getHeight(context, 233),
                width: KSize.getWidth(context, double.infinity),
                decoration: BoxDecoration(
                    color: _darkTheme ? KColor.darkblack : KColor.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: _darkTheme ? KColor.darkBorder : KColor.border)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: KSize.getHeight(context, 30)),
                    Text(
                      '\100EG / Month',
                      style: KTextStyle.normal.copyWith(
                          color:
                              _darkTheme ? KColor.white : KColor.maastrichtBlue,
                          fontSize: 28),
                    ),
                    SizedBox(height: KSize.getHeight(context, 17)),
                    Text(
                      'Unlimited access with the doctor and get daily notes, article and get free consult for month',
                      textAlign: TextAlign.center,
                      style: KTextStyle.regularText.copyWith(
                          fontSize: 14,
                          color:
                              _darkTheme ? KColor.darkdimgray : KColor.dimgray),
                    ),
                    SizedBox(height: KSize.getHeight(context, 27)),
                    Text(
                      'I Choose this',
                      textAlign: TextAlign.center,
                      style: KTextStyle.regularText.copyWith(
                          color: _darkTheme
                              ? KColor.white
                              : KColor.maastrichtBlue),
                    ),
                  ],
                ),
              ),
              SizedBox(height: KSize.getHeight(context, 20)),
              Container(
                padding: const EdgeInsets.only(
                    left: 48, right: 48, top: 30, bottom: 30),
                // height: KSize.getHeight(context, 233),
                width: KSize.getWidth(context, double.infinity),
                decoration: BoxDecoration(
                    color: _darkTheme ? KColor.darkslategray : KColor.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: _darkTheme ? KColor.darkBorder : KColor.border)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: KSize.getHeight(context, 30)),
                    Text(
                      '\Insurance',
                      style: KTextStyle.normal.copyWith(
                          color:
                              _darkTheme ? KColor.white : KColor.maastrichtBlue,
                          fontSize: 28),
                    ),
                    SizedBox(height: KSize.getHeight(context, 17)),
                    Text(
                      'Soon',
                      textAlign: TextAlign.center,
                      style: KTextStyle.regularText.copyWith(
                          fontSize: 14,
                          color:
                              _darkTheme ? KColor.darkdimgray : KColor.dimgray),
                    ),
                    SizedBox(height: KSize.getHeight(context, 27)),
                    Text(
                      'I Choose this',
                      textAlign: TextAlign.center,
                      style: KTextStyle.regularText.copyWith(
                          color: _darkTheme
                              ? KColor.white
                              : KColor.maastrichtBlue),
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  // planCard(String text, Color containerColor, Color textColor, Color bodyColor,
  //     Color bottomTextColor, Color borderColor) {
  //   return Container(
  //     padding: const EdgeInsets.only(left: 48, right: 48, top: 30, bottom: 30),
  //     //height: KSize.getHeight(context, 233),
  //     width: KSize.getWidth(context, double.infinity),
  //     decoration: BoxDecoration(
  //         border: Border.all(color: borderColor),
  //         color: containerColor,
  //         borderRadius: BorderRadius.circular(30)),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Text(
  //           text,
  //           style: KTextStyle.normal.copyWith(color: textColor, fontSize: 28),
  //         ),
  //         SizedBox(height: KSize.getHeight(context, 17)),
  //         Text(
  //           'Unlimited access with the doctor and get daily notes, article and get free consult for seven days',
  //           textAlign: TextAlign.center,
  //           style:
  //               KTextStyle.regularText.copyWith(fontSize: 14, color: bodyColor),
  //         ),
  //         SizedBox(height: KSize.getHeight(context, 27)),
  //         Text(
  //           'I Choose this',
  //           textAlign: TextAlign.center,
  //           style: KTextStyle.regularText.copyWith(color: bottomTextColor),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
