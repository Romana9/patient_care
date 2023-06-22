// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/views/global_components/k_app_bar.dart';
import 'package:saviorcare/views/styles/b_style.dart';
import 'package:saviorcare/constants/asset_path.dart';

import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';
import 'daily_update_screen.dart';

class HealthFeedScreen extends StatefulWidget {
  const HealthFeedScreen({Key? key}) : super(key: key);

  @override
  _HealthFeedScreenState createState() => _HealthFeedScreenState();
}

class _HealthFeedScreenState extends State<HealthFeedScreen> {
  List updateList = [
    {
      'image': const AssetImage(AssetPath.covidAwarness),
      'details': 'Symptoms of Covid to watch out for',
      'date': 'September 10',
      'time': '08.36 AM'
    },
    {
      'image': const AssetImage(AssetPath.excercise),
      'details': 'When do pregnancy cravings start?',
      'date': 'September 10',
      'time': '11.40 PM'
    },
    {
      'image': const AssetImage(AssetPath.smoking),
      'details': 'How does smoking affect my unborn baby?',
      'date': 'September 11',
      'time': '10.36 AM'
    },
    {
      'image': const AssetImage(AssetPath.medicines),
      'details': 'Are there any vitamins I should avoid?',
      'date': 'September 11',
      'time': '10.36 AM'
    }
  ];
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      //backgroundColor: KColor.ghostwhite,
      appBar: const KAppBar(
        title: 'Health Feed',
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.only(left: 24, right: 24, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 187,
                    decoration: BoxDecoration(
                        color: KColor.aliceblue,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(30)),
                      child: Image(
                        image: AssetImage(AssetPath.healthFeedBg),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 24,
                      left: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Take Care Of Your\n',
                              style: KTextStyle.headline.copyWith(
                                fontSize: 20,
                                color: KColor.maastrichtBlue,
                              ),
                              children: [
                                TextSpan(
                                    text: 'Mental Health',
                                    style: KTextStyle.headline.copyWith(
                                        fontSize: 20,
                                        color: KColor.maastrichtBlue,
                                        decoration: TextDecoration.underline,
                                        decorationThickness: 7,
                                        decorationColor: KColor.mediumslateblue
                                            .withOpacity(0.3))),
                                TextSpan(
                                    text: '.',
                                    style: KTextStyle.headline.copyWith(
                                      fontSize: 20,
                                      color: KColor.maastrichtBlue,
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(height: KSize.getHeight(context, 5)),
                          Text(
                              'Our experts take care of your\nmental health regularly',
                              style: KTextStyle.regularText.copyWith(
                                  fontSize: 10, color: KColor.dimgray)),
                          SizedBox(height: KSize.getHeight(context, 15)),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              //margin: const EdgeInsets.only(bottom: 20),
                              height: KSize.getHeight(context, 34),
                              width: KSize.getWidth(context, 100),
                              decoration: BoxDecoration(
                                color: KColor.mediumslateblue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'Get Start',
                                  style: KTextStyle.normal.copyWith(
                                      color: KColor.white, fontSize: 12),
                                ),
                              ),
                            ),
                          )
                        ],
                      ))
                ],
              ),
              SizedBox(height: KSize.getHeight(context, 30)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Daily Update',
                    style: KTextStyle.normal.copyWith(
                        fontSize: 20,
                        color:
                            _darkTheme ? KColor.white : KColor.maastrichtBlue),
                  ),
                  Text(
                    'See all',
                    style: KTextStyle.normal
                        .copyWith(fontSize: 16, color: KColor.mediumslateblue),
                  ),
                ],
              ),
              SizedBox(height: KSize.getHeight(context, 20)),
              Column(
                children: List.generate(
                    updateList.length,
                    (index) => Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const DailyUpdateScreen()));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 170,
                                        height: 60,
                                        child: Text(
                                          updateList[index]['details'],
                                          style: KTextStyle.normal.copyWith(
                                              color: _darkTheme
                                                  ? KColor.white
                                                  : KColor.maastrichtBlue,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(updateList[index]['date'],
                                              style: KTextStyle.regularText
                                                  .copyWith(
                                                      fontSize: 12,
                                                      color: _darkTheme
                                                          ? KColor.darkdimgray
                                                          : KColor.dimgray)),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            height: 5,
                                            width: 5,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: _darkTheme
                                                    ? KColor.darkdimgray
                                                    : KColor.dimgray),
                                          ),
                                          Text(updateList[index]['time'],
                                              style: KTextStyle.regularText
                                                  .copyWith(
                                                      fontSize: 12,
                                                      color: _darkTheme
                                                          ? KColor.darkdimgray
                                                          : KColor.dimgray)),
                                        ],
                                      )
                                    ],
                                  ),
                                  Image(
                                      image: updateList[index]['image'],
                                      height: 76,
                                      width: 126)
                                ],
                              ),
                            ),
                            SizedBox(height: KSize.getHeight(context, 20))
                          ],
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
