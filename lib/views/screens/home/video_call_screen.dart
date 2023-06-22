import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/constants/asset_path.dart';
import 'package:saviorcare/views/screens/home/audio_call_screen.dart';
import 'package:saviorcare/views/styles/b_style.dart';

import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen(
      {Key? key,
      required this.name,
      required this.image,
      required this.designation})
      : super(key: key);
  final String name;
  final AssetImage image;
  final String designation;

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Image(
              fit: BoxFit.cover,
              image: widget.image,
              height: KSize.getHeight(context, double.infinity),
              width: KSize.getWidth(context, double.infinity)),
          Positioned(
              left: KSize.getWidth(context, 24),
              top: KSize.getHeight(context, 60),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: _darkTheme
                    ? const Image(
                        image: AssetImage(AssetPath.darkBack),
                        height: 44,
                        width: 44,
                      )
                    : const Image(
                        image: AssetImage(AssetPath.back),
                        height: 44,
                        width: 44,
                      ),
              )),
          Positioned(
              left: KSize.getWidth(context, 265),
              top: KSize.getHeight(context, 60),
              child: Image(
                  image: _darkTheme
                      ? const AssetImage(AssetPath.darkCaller)
                      : const AssetImage(AssetPath.lightCaller),
                  height: KSize.getHeight(context, 120),
                  width: KSize.getWidth(context, 80))),
          Positioned(
              left: KSize.getWidth(context, 24),
              top: KSize.getHeight(context, 500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.designation,
                      style: KTextStyle.regularText.copyWith(
                          color: _darkTheme
                              ? KColor.white
                              : const Color(0xff0B0B0D),
                          fontSize: 20)),
                  Text(widget.name,
                      style: KTextStyle.normal.copyWith(
                          color: _darkTheme
                              ? KColor.white
                              : const Color(0xff0B0B0D))),
                  SizedBox(height: KSize.getHeight(context, 12)),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: KSize.getHeight(context, 34),
                    width: KSize.getWidth(context, 64),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _darkTheme
                            ? const Color(0xff0B0B0D).withOpacity(0.2)
                            : KColor.silver.withOpacity(0.2)),
                    child: Row(children: [
                      const Image(
                          image: AssetImage(AssetPath.redDot),
                          height: 8,
                          width: 8),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('5.15',
                          style: KTextStyle.regular.copyWith(
                              color: _darkTheme
                                  ? const Color(0xff0B0B0D)
                                  : KColor.white,
                              fontSize: 14))
                    ]),
                  ),
                ],
              )),
          Positioned(
            left: KSize.getWidth(context, 73),
            top: KSize.getHeight(context, 650),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              color:
                                  _darkTheme ? KColor.darkblack : KColor.white),
                          color: _darkTheme
                              ? const Color(0xff0B0B0D).withOpacity(0.2)
                              : KColor.silver.withOpacity(0.2)),
                      child: Image(
                          image: const AssetImage(AssetPath.video),
                          height: 40,
                          width: 40,
                          color: _darkTheme
                              ? const Color(0xff0B0B0D)
                              : KColor.white),
                    ),
                    SizedBox(width: KSize.getWidth(context, 40)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Image(
                          image: AssetImage(AssetPath.cancel),
                          height: 70,
                          width: 70),
                    ),
                    SizedBox(
                      width: KSize.getWidth(context, 40),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => AudioCallScreen(
                                      name: widget.name,
                                      image: widget.image,
                                      designation: widget.designation,
                                    )));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: _darkTheme
                                    ? KColor.darkblack
                                    : KColor.white),
                            color: _darkTheme
                                ? const Color(0xff0B0B0D).withOpacity(0.2)
                                : KColor.silver.withOpacity(0.2)),
                        child: Image(
                            image: const AssetImage(AssetPath.audio),
                            height: 40,
                            width: 40,
                            color: _darkTheme
                                ? const Color(0xff0B0B0D)
                                : KColor.white),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
