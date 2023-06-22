import 'package:provider/provider.dart';
import 'package:saviorcare/views/styles/b_style.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import '../../controller/theme.dart';
import '../../controller/theme/them_notifier.dart';

// ignore: must_be_immutable
class KTextField extends StatefulWidget {
  final String? hintText;
  final Color? hintColor;
  final bool isheightChanged;
  final double? height;
  final bool iswidthChanged;
  final double? width;
  final suffixIcon;
  final prefixIcon;
  final bool hasPrefixIcon;
  final bool isPasswordField;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final double widthFactor;
  final bool isReadOnly;
  final int? maxLength;
  // final MaxLengthEnforcement maxLengthEnforced;
  final Function()? onTap;
  final int? maxLines;
  final int? minLines;
  final double topMargin;
  final double borderRadius;
  final bool isClearableField;
  String? Function(String?)? validator;
  final Function(String value)? callBackFunction;
  final bool callBack;
  final Color backgroundColor;
  final Color textColor;
  final bool suffixCallback;
  final Function()? suffixCallbackFunction;
  final bool autofocus;
  final List<TextInputFormatter>? inputFormatters;
  final bool widgetInTextField;
  final Widget? childWidgetView;
  final bool leftPadding;
  final bool isLeftPadding;
  final bool isCardFiled;
  final bool isMessage;

  KTextField(
      {Key? key,
      this.hintText,
      this.hintColor,
      this.suffixIcon,
      this.prefixIcon,
      this.isheightChanged = false,
      this.height,
      this.iswidthChanged = false,
      this.width,
      this.hasPrefixIcon = false,
      this.isPasswordField = false,
      this.controller,
      this.widthFactor = 1,
      this.textInputType = TextInputType.text,
      this.textInputAction = TextInputAction.done,
      this.isReadOnly = false,
      this.maxLength,
      // this.maxLengthEnforced = false,
      this.onTap,
      this.maxLines = 1,
      this.minLines = 1,
      this.topMargin = 20.0,
      this.borderRadius = 6.0,
      this.isClearableField = false,
      this.validator,
      this.callBack = false,
      this.callBackFunction,
      this.backgroundColor = KColor.black,
      this.textColor = KColor.black,
      this.suffixCallback = false,
      this.suffixCallbackFunction,
      this.autofocus = false,
      this.inputFormatters,
      this.widgetInTextField = false,
      this.childWidgetView,
      this.leftPadding = false,
      this.isLeftPadding = false,
      this.isCardFiled = false,
      this.isMessage=false
      })
      : super(key: key);

  @override
  _KTextFieldState createState() => _KTextFieldState();
}

class _KTextFieldState extends State<KTextField> {
  bool _isClearableText = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Container(
      height: widget.isheightChanged ? widget.height : 50,
      width: widget.iswidthChanged
          ? widget.width
          : MediaQuery.of(context).size.width * widget.widthFactor,
      //padding: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 10)),
      // margin:widget.isheightChanged? EdgeInsets.only(top:22):null,
      padding: EdgeInsets.only(
          left: widget.isLeftPadding
              ? 70
              : widget.leftPadding
                  ? 56
                  : 20,
          right: 18,
          top: widget.isheightChanged ? 5 : 0),
      decoration: BoxDecoration(
        color: _darkTheme ? KColor.darkblack : KColor.white,
        border: Border.all(
          color: widget.isCardFiled
              ? KColor.mediumslateblue
              : _darkTheme
                  ? KColor.darkBorder
                  : KColor.border,
          width: 1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: widget.validator,
            inputFormatters: widget.inputFormatters ?? [],
            controller: widget.controller,
            readOnly: widget.isReadOnly,
            // maxLength: widget.maxLengthEnforced ? widget.maxLength : null,
            // // ignore: deprecated_member_use
            // maxLengthEnforcement: widget.maxLengthEnforced,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            cursorColor: _darkTheme ? KColor.white : KColor.maastrichtBlue,
            keyboardType: widget.textInputType,
            textInputAction: widget.textInputAction,
            style: KTextStyle.regularText.copyWith(
                color: _darkTheme ? KColor.white : KColor.maastrichtBlue),
            obscureText: widget.isPasswordField ? _obscureText : false,
            textAlignVertical: TextAlignVertical.center,
            autofocus: widget.autofocus,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: KTextStyle.regular.copyWith(
                color: _darkTheme ? KColor.darkdimgray : KColor.dimgray,
                fontSize: widget.isMessage?12:null
              ),
              errorStyle: const TextStyle(fontSize: 0, height: 0),
              border: InputBorder.none,
              prefixIcon: widget.hasPrefixIcon
                  ? Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: widget.prefixIcon,
                    )
                  : Container(width: 0),
              prefixIconConstraints:
                  BoxConstraints(minHeight: widget.hasPrefixIcon ? 48 : 0),
              suffixIcon: widget.isPasswordField
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        /// Based on password visibility state choose the icon
                        !_obscureText ? Icons.visibility : Icons.visibility_off,
                        size: 18.0,
                        color: _darkTheme ? KColor.white : KColor.black,
                      ),
                    )
                  : widget.isClearableField
                      ? clearField()
                      : widget.suffixIcon,
            ),
            onTap: widget.onTap,
          ),
          Visibility(
              visible: widget.widgetInTextField,
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: widget.childWidgetView ?? Container())),
        ],
      ),
    );
  }

  // GestureDetector obscureText() {
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         _obscureText = !_obscureText;
  //       });
  //     },
  //     child: Icon(
  //       /// Based on password visibility state choose the icon
  //       !_obscureText ? Icons.visibility : Icons.visibility_off,
  //       size: 18.0,
  //       color:_darkTheme? KColor.white: KColor.black,
  //     ),
  //   );
  // }

  GestureDetector clearField() {
    return GestureDetector(
      onTap: () {
        widget.controller?.clear();
        setState(() {
          _isClearableText = false;
        });
        if (widget.suffixCallback) {
          widget.suffixCallbackFunction!();
        }
      },
      child: Icon(
        Icons.cancel,
        color: _isClearableText ? KColor.black : Colors.transparent,
        size: 16.0,
      ),
    );
  }
}
