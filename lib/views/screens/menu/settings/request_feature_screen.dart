import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/views/global_components/k_app_bar.dart';
import 'package:saviorcare/views/global_components/k_button.dart';
import 'package:saviorcare/views/styles/b_style.dart';

import '../../../../controller/theme.dart';
import '../../../../controller/theme/them_notifier.dart';

class RequestFeatureScreen extends StatefulWidget {
  const RequestFeatureScreen({Key? key}) : super(key: key);

  @override
  _RequestFeatureScreenState createState() => _RequestFeatureScreenState();
}

class _RequestFeatureScreenState extends State<RequestFeatureScreen> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      //backgroundColor: KColor.ghostwhite,
      appBar: const KAppBar(title: 'Request feature'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.only(left: 24, right: 24, top: 20),
          child: Column(
            children: [
              Container(
                height: 264,
                width: KSize.getWidth(context, double.infinity),
                padding: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: _darkTheme ? KColor.darkBorder : KColor.border),
                    borderRadius: BorderRadius.circular(20),
                    color: _darkTheme ? KColor.darkblack : KColor.white),
                child: TextFormField(
                  cursorColor: _darkTheme?KColor.white:KColor.maastrichtBlue,
                  style: KTextStyle.regular.copyWith(fontSize: 14,color: _darkTheme?KColor.white:KColor.maastrichtBlue),
                  maxLines: 10,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type the feature you want...',
                      hintStyle: KTextStyle.regularText.copyWith(
                          color:
                              _darkTheme ? KColor.darkdimgray : KColor.dimgray,
                          fontSize: 12)),
                ),
              ),
              SizedBox(
                height: KSize.getHeight(context, 40),
              ),
              Center(
                child: KButton(
                  onPressedCallback: () {
                    Navigator.pop(context);
                  },
                  textColor: KColor.white,
                  text: 'Submit',
                  color: KColor.mediumslateblue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
