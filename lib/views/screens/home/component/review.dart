import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/views/styles/b_style.dart';
import 'package:saviorcare/constants/asset_path.dart';

import '../../../../controller/theme.dart';
import '../../../../controller/theme/them_notifier.dart';

class Review extends StatefulWidget {
  
  const Review({Key? key}) : super(key: key);

  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  List reviewInfoList = [
    {
      'image': const AssetImage(AssetPath.mahiAhmed),
      'name': 'Kamal Mohamed',
      'time': '1 Day Ago',
      'details':
          'Relly good doctor! I love how he checks and his diet chart is awesome, He is perfect for depressed patient'
    },
    {
      'image': const AssetImage(AssetPath.rafiAhmed),
      'name': 'Ramy Ahmed',
      'time': '1 Day Ago',
      'details':
          'Relly good doctor! I love how he checks and his diet chart is awesome, He is perfect for depressed patient'
    },
  ];
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Wrap(children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(reviewInfoList.length, (int index) {
              return Container(
                margin: EdgeInsets.only(right: KSize.getWidth(context, 20)),
                padding: const EdgeInsets.only(top: 14, left: 14, right: 12,bottom: 16),
                //height: KSize.getHeight(context, 145),
                width: 270,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color:_darkTheme?KColor.darkBorder: KColor.border),
                    borderRadius: BorderRadius.circular(14),
                    color: _darkTheme?KColor.darkblack:KColor.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  fontSize: 14, color:_darkTheme?KColor.white: KColor.maastrichtBlue),
                            ),
                            Text(
                              reviewInfoList[index]['time'],
                              style: KTextStyle.regularText.copyWith(
                                  fontSize: 10, color: KColor.dimgray),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: KSize.getWidth(context, 39),
                        ),
                        Container(
                          height:  20,
                          width: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color:_darkTheme?KColor.darkBeige: KColor.orange.withOpacity(0.1)),
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
                              .copyWith(fontSize: 12, color:_darkTheme?KColor.darkdimgray: KColor.dimgray),
                        )
                      ],
                    )
                  ],
                ),
              );
            }
            )
            ),
      ]),
    );
  }
}
