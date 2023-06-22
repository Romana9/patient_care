import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/views/styles/b_style.dart';

import '../../../../controller/theme.dart';
import '../../../../controller/theme/them_notifier.dart';


// ignore: must_be_immutable
class KOtp extends StatefulWidget {
  bool first, last;
  KOtp({Key? key, required this.first, required this.last}) : super(key: key);

  @override
  _KOtpState createState() => _KOtpState();
}

class _KOtpState extends State<KOtp> {
  @override
  Widget build(BuildContext context) {
    

final themeNotifier = Provider.of<ThemeNotifier>(context);
  var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Container(
      decoration: BoxDecoration(
          color: _darkTheme?KColor.darkblack: KColor.white,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: _darkTheme?KColor.darkBorder: KColor.border)),
      height:60,
      width: 60,
      child: TextField(
        // autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && widget.last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && widget.first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        showCursor: true,
        cursorColor: _darkTheme?KColor.white: KColor.black,
        readOnly: false,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: _darkTheme?KColor.white: KColor.maastrichtBlue),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: const InputDecoration(
            counter: Offstage(), border: InputBorder.none),
      ),
    );
  }
}
