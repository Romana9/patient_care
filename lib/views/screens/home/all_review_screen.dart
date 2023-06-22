import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/constants/asset_path.dart';
import 'package:saviorcare/views/global_components/k_app_bar.dart';
import 'package:saviorcare/views/styles/b_style.dart';

import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';

class ALlReviewScreen extends StatefulWidget {
  const ALlReviewScreen({Key? key}) : super(key: key);

  @override
  State<ALlReviewScreen> createState() => _ALlReviewScreenState();
}

class _ALlReviewScreenState extends State<ALlReviewScreen> {
  List reviewInfoList = [
    {
      'image': const AssetImage(AssetPath.mahiAhmed),
      'name': 'Mahi Ahmed',
      'time': '1 Day Ago',
      'details':
          'Relly good doctor! I love how he checks and his diet chart is awesome, He is perfect for depressed patient, i recomended him.'
    },
    {
      'image': const AssetImage(AssetPath.rafiAhmed),
      'name': 'Rafi Ahmed',
      'time': '1 Day Ago',
      'details':
          'My final straw with this office. Today I was late to my appointment, I was refused service and not allowed to see the doctor. '
    },
    {
      'image': const AssetImage(AssetPath.diana),
      'name': 'Mariam',
      'time': '1 Day Ago',
      'details':
          'Hello Dear, how are you? my name is Dr Mariam, i have something to discuss with you privately and confidential contact me here now,'
    },
    {
      'image': const AssetImage(AssetPath.wanda),
      'name': 'Hend',
      'time': '1 Day Ago',
      'details':
          'He is a good doctor been my doctor since 2011, but the wait times is ridiculous and disrespectful, between 2-4 hours and that is the wait times just for test results'
    },
  ];
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      //backgroundColor: KColor.ghostwhite,
      appBar: const KAppBar(title: ''),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
          child: Container(
        margin: const EdgeInsets.only(left: 24, right: 24, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Review',
              style: KTextStyle.normal.copyWith(color:_darkTheme?KColor.white: KColor.maastrichtBlue),
            ),
            const SizedBox(height: 20),
            Column(
              children: List.generate(reviewInfoList.length, (int index) {
                return Container(
                  margin: EdgeInsets.only(bottom: KSize.getWidth(context, 20)),
                  padding: const EdgeInsets.only(top: 14, left: 14, right: 12,bottom: 16),
                 // height: KSize.getHeight(context, 155),
                  width: KSize.getWidth(context, double.infinity),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color:_darkTheme?KColor.darkBorder: KColor.border),
                      borderRadius: BorderRadius.circular(14),
                      color:_darkTheme?KColor.darkblack:  KColor.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image(
                            image: reviewInfoList[index]['image'],
                            height: 30,
                            width: 30,
                          ),
                          SizedBox(
                            width: KSize.getWidth(context, 10),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                reviewInfoList[index]['name'],
                                style: KTextStyle.normal.copyWith(
                                    fontSize: 14, color:_darkTheme?KColor.white:  KColor.maastrichtBlue),
                              ),
                              Text(
                                reviewInfoList[index]['time'],
                                style: KTextStyle.regularText.copyWith(
                                    fontSize: 10, color: KColor.dimgray),
                              ),
                            ],
                          ),
                          
                            ],
                          ),
                          Container(
                            height: 20,
                            width:  48,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color:_darkTheme?KColor.darkBeige:  KColor.orange.withOpacity(0.1)),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '5.0',
                                    style: KTextStyle.regular.copyWith(
                                        color: KColor.orange, fontSize: 10),
                                  ),
                                  SizedBox(
                                    width: KSize.getWidth(context, 5),
                                  ),
                                  const Image(
                                      image: AssetImage(AssetPath.ratingStar),
                                      height: 10,
                                      width: 10)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: KSize.getHeight(context, 10),
                      ),
                      Wrap(
                        children: [
                          Text(
                            reviewInfoList[index]['details'],
                            style: KTextStyle.regularText
                                .copyWith(fontSize: 12, color:_darkTheme?KColor.darkdimgray:  KColor.dimgray),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      )),
    );
  }
}
