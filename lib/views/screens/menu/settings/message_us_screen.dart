import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/constants/asset_path.dart';
import 'package:saviorcare/views/global_components/k_app_bar.dart';
import 'package:saviorcare/views/global_components/k_button.dart';
import 'package:saviorcare/views/global_components/k_text_field.dart';
import 'package:saviorcare/views/styles/b_style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../controller/theme.dart';
import '../../../../controller/theme/them_notifier.dart';

class MessegeUsScreen extends StatefulWidget {
  const MessegeUsScreen({Key? key}) : super(key: key);

  @override
  State<MessegeUsScreen> createState() => _MessegeUsScreenState();
}

class _MessegeUsScreenState extends State<MessegeUsScreen> {
  int select = 0;
  List list = ['Yes', 'No'];
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Image(
                  image: AssetImage(AssetPath.drPeaterS),
                  height: 70,
                  width: 70),
            ),
            SizedBox(height: KSize.getHeight(context, 5)),
            Center(
                child: Text(
              'Dr. Khaled Ahmed',
              style: KTextStyle.normal.copyWith(
                  fontSize: 18,
                  color: _darkTheme ? KColor.white : KColor.maastrichtBlue),
            )),
            Center(
                child: Text('Physiatrist',
                    style: KTextStyle.regularText
                        .copyWith(color: KColor.gray, fontSize: 14))),
            SizedBox(height: KSize.getHeight(context, 30)),
            KTextField(
              maxLines: 5,
              isheightChanged: true,
              height: 134,
              hintText: 'Write review....',
              borderRadius: 20,
              isMessage: true,


            ),
            
            SizedBox(height: KSize.getHeight(context, 30)),
            Text(
              'Would you recommend Dr. Khaled Ahmed Wells to your friends?',
              style: KTextStyle.regularText.copyWith(
                  fontSize: 15,
                  color: _darkTheme ? KColor.white : KColor.maastrichtBlue),
            ),
            SizedBox(height: KSize.getHeight(context, 23)),
            Row(
                children: List.generate(
                    list.length,
                    (index) => Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  select = index;
                                });
                              },
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: select == index
                                        ? KColor.mediumslateblue
                                        : _darkTheme
                                            ? KColor.darkblack
                                            : KColor.white,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: select == index
                                            ? Colors.transparent
                                            : _darkTheme
                                                ? KColor.darkBorder
                                                : KColor.border)),
                                child: Center(
                                  child: select == index
                                      ? const Image(
                                          image: AssetImage(AssetPath.tick),
                                          height: 9,
                                          width: 12)
                                      : null,
                                ),
                              ),
                            ),
                            SizedBox(width: KSize.getWidth(context, 10)),
                            Text(
                              list[index],
                              style: KTextStyle.regularText.copyWith(
                                  fontSize: 14,
                                  color: _darkTheme
                                      ? KColor.white
                                      : KColor.maastrichtBlue),
                            ),
                            SizedBox(width: KSize.getWidth(context, 40)),
                          ],
                        ))),
            SizedBox(height: KSize.getHeight(context, 33)),
            Text(
                'How would you rate your overall experience with Dr. Margaret Wells service?',
                style: KTextStyle.regularText.copyWith(
                    fontSize: 15,
                    color: _darkTheme ? KColor.white : KColor.maastrichtBlue)),
            SizedBox(height: KSize.getHeight(context, 30)),
            RatingBar.builder(
              unratedColor: KColor.gray.withOpacity(0.2),
              initialRating: 0,
              minRating: 0,
              direction: Axis.horizontal,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 5.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Color.fromARGB(255, 234, 255, 0),
                size: 40,
              ),
              onRatingUpdate: (rating) {},
            ),


            SizedBox(height: KSize.getHeight(context, 59)),
            KButton(
              onPressedCallback: () {
                Navigator.pop(context);
              },
              text: 'Send Review',
              color: KColor.mediumslateblue,
              textColor: KColor.white,
            )
          ],
        ),
      )),
    );
  }
}
