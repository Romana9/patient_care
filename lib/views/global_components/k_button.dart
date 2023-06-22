import 'package:flutter/material.dart';
import 'package:saviorcare/views/styles/b_style.dart';

class KButton extends StatefulWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Function()? onPressedCallback;
  const KButton(
      {required this.text,
      required this.color,
      required this.textColor,
      this.onPressedCallback,
      Key? key})
      : super(key: key);

  @override
  _KButtonState createState() => _KButtonState();
}

class _KButtonState extends State<KButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressedCallback,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: 50,
        width: 310,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            widget.text,
            //text color should be customised
            style: KTextStyle.regular.copyWith(color: widget.textColor),
          ),
        ),
      ),
    );
  }
}
