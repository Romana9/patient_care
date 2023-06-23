import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/views/global_components/k_button.dart';
import 'package:saviorcare/views/styles/b_style.dart';

import '../../../../controller/theme.dart';
import '../../../../controller/theme/them_notifier.dart';
import '../../../global_components/k_app_bar.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
 
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      //backgroundColor: KColor.ghostwhite,
      appBar: const KAppBar(title: 'Give us Feedback'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.only(left: 24, right: 24, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 134,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    border: Border.all(color:_darkTheme?KColor.darkBorder: KColor.border),
                    borderRadius: BorderRadius.circular(20),
                    color:_darkTheme?KColor.darkblack: KColor.white),
                child: TextFormField(
                  cursorColor: _darkTheme?KColor.white:KColor.maastrichtBlue,
                   style: KTextStyle.regular.copyWith(fontSize: 14,color: _darkTheme?KColor.white:KColor.maastrichtBlue),
                  maxLines: 5,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Write review....',
                       hintStyle: KTextStyle.regularText.copyWith(color: _darkTheme?KColor.darkdimgray:KColor.dimgray,fontSize: 12)),
                ),
              ),
              SizedBox(
                height: KSize.getHeight(context, 30),
              ),
               RatingBar.builder(
              unratedColor: KColor.gray.withOpacity(0.2),
              initialRating: 0,
              minRating:0,
              direction: Axis.horizontal,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 5.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: KColor.orange,
                size: 40,
        
              ),
              onRatingUpdate: (rating) {
               // print(rating);
              },
            ),
              SizedBox(
                height: KSize.getHeight(context, 50),
              ),
              KButton(
                textColor: KColor.white,
                text: 'Submit',
                color: KColor.mediumslateblue,
                onPressedCallback: () {
                Navigator.pop(context);
              },
              ),
              Text(
                'Your feedback will apper on AppStore & PlayStore feedback section',
                textAlign: TextAlign.center,
                style: KTextStyle.regularText
                    .copyWith(fontSize: 14, height: 2, color: KColor.dimgray),
              )
            ],
          ),
        ),
      ),
    );
  }
}
