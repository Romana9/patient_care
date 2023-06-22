import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/controller/theme.dart';
import 'package:saviorcare/views/styles/b_style.dart';
import 'package:saviorcare/constants/asset_path.dart';

import '../../controller/theme/them_notifier.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double elevation;

  const KAppBar({
    required this.title,
    this.elevation = 0,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return AppBar(
      elevation: elevation,
      backgroundColor:_darkTheme?KColor.darkBg: KColor.lightBg,
      leadingWidth: 65,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: const EdgeInsets.only(left: 24),
          child:_darkTheme?const Image(
            image: AssetImage(AssetPath.darkBack),
          ): const Image(
            image: AssetImage(AssetPath.back),
          ),
        ),
      ),
      title: Center(
        child: Text(
          title,
          style: KTextStyle.regular.copyWith(
              color:_darkTheme?KColor.white: KColor.maastrichtBlue, fontWeight: FontWeight.w600),
        ),
      ),
      actions: const [Padding(padding: EdgeInsets.only(right: 68))],
    );
  }
}
