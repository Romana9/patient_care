import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/views/global_components/k_app_bar.dart';
import 'package:saviorcare/views/styles/b_style.dart';
import 'package:saviorcare/constants/asset_path.dart';

import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';

class DailyUpdateScreen extends StatefulWidget {
  const DailyUpdateScreen({Key? key}) : super(key: key);

  @override
  State<DailyUpdateScreen> createState() => _DailyUpdateScreenState();
}

class _DailyUpdateScreenState extends State<DailyUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
     // backgroundColor: KColor.ghostwhite,
      appBar: const KAppBar(title: 'Daily Update'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
          child: Container(
        margin: const EdgeInsets.only(left: 24, right: 24, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Symptoms of Covid\nto watch out for',
                style: KTextStyle.normal
                    .copyWith(color:_darkTheme?KColor.white: KColor.maastrichtBlue, fontSize: 24)),
            Row(
              children: [
                Text('September 10',
                    style: KTextStyle.regularText
                        .copyWith(fontSize: 12, color:_darkTheme?KColor.darkdimgray: KColor.dimgray)),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color:_darkTheme?KColor.darkdimgray: KColor.dimgray),
                ),
                Text('08.36 AM',
                    style: KTextStyle.regularText
                        .copyWith(fontSize: 12, color:_darkTheme?KColor.darkdimgray: KColor.dimgray)),
              ],
            ),
            SizedBox(height: KSize.getHeight(context, 20)),
           const Image(image: AssetImage(AssetPath.dailyupdatepicture),height: 192),
            SizedBox(height: KSize.getHeight(context, 20)),
           Text('People with COVID-19 have had a wide range of symptoms reported – ranging from mild symptoms to severe illness. Symptoms may appear 2-14 days after exposure to the virus. Anyone can have mild to severe symptoms. People with these symptoms may have COVID-19:',style: KTextStyle.regularText.copyWith(fontSize: 14,color:_darkTheme?KColor.darkdimgray: KColor.dimgray,height:2)),
            SizedBox(height: KSize.getHeight(context, 30)),
            Text('Fever or chills\nCough\nShortness of breath or difficulty breathing\nFatigue\nMuscle or body aches\nHeadache\nNew loss of taste or smell\nSore throa',style: KTextStyle.regularText.copyWith(fontSize: 14,color:_darkTheme?KColor.darkdimgray: KColor.dimgray,height: 2))

          ],
        ),
      )),
    );
  }
}
