import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/views/global_components/k_bottom_navigation_bar.dart';
import 'package:saviorcare/views/global_components/k_button.dart';
import 'package:saviorcare/views/styles/b_style.dart';

import '../../../constants/asset_path.dart';
import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);

  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
 
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: KSize.getHeight(context, 250)),
            Text(
              'Payment Approved',
              style: KTextStyle.normal.copyWith(color:_darkTheme?KColor.white: KColor.maastrichtBlue),
            ),
            SizedBox(height: KSize.getHeight(context, 20)),
            Container(
                margin: const EdgeInsets.only(left: 35, right: 35),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Your payment is confirmed you payment id is ',
                    style: KTextStyle.regularText
                        .copyWith(fontSize: 14, color:_darkTheme?KColor.darkdimgray: KColor.dimgray),
                    children: <TextSpan>[
                      TextSpan(
                        text: '789756',
                        style: KTextStyle.regular.copyWith(
                            fontSize: 14, color: _darkTheme?KColor.white:KColor.maastrichtBlue),
                      ),
                    ],
                  ),
                )),
            SizedBox(height: KSize.getHeight(context, 89)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Image(
                  image: AssetImage(AssetPath.leftRibons),
                  height: 165,
                  width: 160,
                 fit: BoxFit.cover,
                ),
                Image(
                  image: AssetImage(AssetPath.rightRibons),
                  height: 180,
                  width: 160,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            //SizedBox(height: KSize.getHeight(context, 122)),
            
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.transparent,
        child: Center(
          child: KButton(
              text: 'Set Reminder',
              color: KColor.mediumslateblue,
              textColor: KColor.white,
              onPressedCallback: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const KBottomNavigationBar()));
              },
            )
          ,
        ),
      ),
    );
  }
}
