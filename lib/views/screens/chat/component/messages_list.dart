import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/constants/asset_path.dart';
import 'package:saviorcare/views/styles/b_style.dart';

import '../../../../controller/theme.dart';
import '../../../../controller/theme/them_notifier.dart';
import '../chat_person_screen.dart';

class MessegesList extends StatelessWidget {
  const MessegesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    List messageList = [
      {
        'id': 1,
        'image': const AssetImage(AssetPath.elizabeth),
        'name': 'Dr. Mariam',
        'message': 'Cool. You’ll better soon'
      },
      {
        'id': 2,
        'image': const AssetImage(AssetPath.drWiliam),
        'name': 'Dr. Nabil',
        'message': 'Thank you ! Get Well Soon'
      },
      {
        'id': 3,
        'image': const AssetImage(AssetPath.peaterParker),
        'name': 'Dr. Fares',
        'message': 'Thank you ! Be Carefull'
      },
      {
        'id': 4,
        'image': const AssetImage(AssetPath.boy3),
        'name': 'Dr. Ramy',
        'message': 'Take care about yourself'
      },
    ];
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(messageList.length, (int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ChatPersonScreen(
                                  name: messageList[index]['name'],
                                  image: messageList[index]['image'],
                                )));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                height: 58,
                                width: 58,
                                child: Center(
                                  child: Image(
                                      image: messageList[index]['image'],
                                      height: 50,
                                      width: 50),
                                ),
                              ),
                              Positioned(
                                  top: 35,
                                  left: 37,
                                  child: messageList[index]['id'] == 1
                                      ? const Image(
                                          image: AssetImage(AssetPath.two),
                                          height: 20,
                                          width: 20,
                                        )
                                      : messageList[index]['id'] == 4
                                          ? const Image(
                                              image: AssetImage(AssetPath.two),
                                              height: 20,
                                              width: 20,
                                            )
                                          : const Image(
                                              image: AssetImage(AssetPath.one),
                                              height: 20,
                                              width: 20,
                                            )),
                            ],
                          ),
                          SizedBox(width: KSize.getWidth(context, 15)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                messageList[index]['name'],
                                style: KTextStyle.regular.copyWith(
                                    fontSize: 14,
                                    color: _darkTheme
                                        ? KColor.darkdimgray
                                        : KColor.dimgray),
                              ),
                              Text(
                                messageList[index]['message'],
                                style: KTextStyle.regularText.copyWith(
                                    color: _darkTheme
                                        ? KColor.white
                                        : KColor.maastrichtBlue),
                              )
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: Text(
                          '12:18',
                          style: KTextStyle.regularText.copyWith(
                              fontSize: 14,
                              color: _darkTheme
                                  ? KColor.darkdimgray
                                  : KColor.dimgray),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: KSize.getHeight(context, 13))
              ],
            );
          })),
    );
  }
}
