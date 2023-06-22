import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/constants/asset_path.dart';
import 'package:saviorcare/views/global_components/k_app_bar.dart';
import 'package:saviorcare/views/screens/home/video_call_screen.dart';
import 'package:saviorcare/views/styles/b_style.dart';

import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';

class AudioCallScreen extends StatefulWidget {
  const AudioCallScreen(
      {Key? key,
      required this.name,
      required this.image,
      required this.designation})
      : super(key: key);
  final String name;
  final AssetImage image;
  final String designation;

  @override
  State<AudioCallScreen> createState() => _AudioCallScreenState();
}

class _AudioCallScreenState extends State<AudioCallScreen> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      // backgroundColor: KColor.ghostwhite,
      appBar: const KAppBar(title: ''),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: KSize.getHeight(context, 80)),
              Image(image: widget.image, height: 100, width: 100),
              SizedBox(height: KSize.getHeight(context, 20)),
              Text(widget.designation,
                  style: KTextStyle.regularText.copyWith(
                      fontSize: 20,
                      color: _darkTheme ? KColor.darkdimgray : KColor.dimgray)),
              SizedBox(height: KSize.getHeight(context, 12)),
              Text(widget.name,
                  style: KTextStyle.normal.copyWith(
                      color:
                          _darkTheme ? KColor.white : KColor.maastrichtBlue)),
              SizedBox(height: KSize.getHeight(context, 60)),
              RichText(
                text: TextSpan(
                  text: 'In Call ',
                  style: KTextStyle.regularText.copyWith(
                      color: _darkTheme ? KColor.darkdimgray : KColor.dimgray),
                  children: <TextSpan>[
                    TextSpan(
                        text: '05.10',
                        style: KTextStyle.regular.copyWith(
                            color: _darkTheme
                                ? KColor.white
                                : KColor.maastrichtBlue)),
                  ],
                ),
              ),
              SizedBox(height: KSize.getHeight(context, 240)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => VideoCallScreen(
                                    name: widget.name,
                                    image: widget.image,
                                    designation: widget.designation,
                                  )));
                    },
                    child: _darkTheme
                        ? const Image(
                            image: AssetImage(AssetPath.darkVideo),
                            height: 40,
                            width: 40)
                        : const Image(
                            image: AssetImage(AssetPath.lightVideo),
                            height: 40,
                            width: 40),
                  ),
                  SizedBox(width: KSize.getWidth(context, 40)),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Image(
                          image: AssetImage(AssetPath.cancel),
                          height: 70,
                          width: 70)),
                  SizedBox(
                    width: KSize.getWidth(context, 40),
                  ),
                  _darkTheme
                      ? const Image(
                          image: AssetImage(AssetPath.darkAudio),
                          height: 40,
                          width: 40)
                      : const Image(
                          image: AssetImage(AssetPath.lightAudio),
                          height: 40,
                          width: 40)
                ],
              ),
              SizedBox(height: KSize.getHeight(context, 20)),
            ],
          ),
        ),
      ),
    );
  }
}
