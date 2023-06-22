import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/constants/asset_path.dart';
import 'package:saviorcare/views/screens/home/video_call_screen.dart';
import 'package:saviorcare/views/styles/b_style.dart';

import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';
import 'audio_call_screen.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen(
      {Key? key,
      required this.name,
      required this.image,
      required this.designation})
      : super(key: key);
  final String name;
  final AssetImage image;
  final String designation;

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image(
                    image: widget.image,
                    height: 340,
                    width: KSize.getWidth(context, double.infinity),
                    fit: BoxFit.cover,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 50,
                      left: 24,
                      right: 24,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
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
                                  image: AssetImage(AssetPath.lightBack),
                                  height: 44,
                                  width: 44,
                                ),
                        ),
                        _darkTheme
                            ? const Image(
                                image: AssetImage(AssetPath.darkMenu),
                                height: 44,
                                width: 44,
                              )
                            : const Image(
                                image: AssetImage(AssetPath.menu),
                                height: 44,
                                width: 44,
                              )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: KSize.getHeight(context, 30)),
              Container(
                margin: const EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.name,
                                style: KTextStyle.normal.copyWith(
                                    fontSize: 20,
                                    color: _darkTheme
                                        ? KColor.white
                                        : KColor.maastrichtBlue)),
                            Text(
                              widget.designation,
                              style: KTextStyle.regularText.copyWith(
                                  color: _darkTheme
                                      ? KColor.darkdimgray
                                      : KColor.dimgray),
                            )
                          ],
                        ),
                        Text('Paid',
                            style: KTextStyle.normal.copyWith(
                                fontSize: 18,
                                color: _darkTheme
                                    ? KColor.white
                                    : KColor.maastrichtBlue))
                      ],
                    ),
                    SizedBox(
                      height: KSize.getHeight(context, 40),
                    ),
                    appointmentDetails('Date', '15 Sep 2023'),
                    appointmentDetails('Slots', 'Afternoon'),
                    appointmentDetails('Time', '12.30 PM'),
                    appointmentDetails('Type', 'Online'),
                    SizedBox(
                      height: KSize.getHeight(context, 10),
                    ),
                    Text('Your approximate waiting time is',
                        textAlign: TextAlign.center,
                        style: KTextStyle.regularText.copyWith(
                            color: _darkTheme
                                ? KColor.darkdimgray
                                : KColor.dimgray)),
                    Text('05hr. 30min. 20sec',
                        textAlign: TextAlign.center,
                        style: KTextStyle.regular.copyWith(
                            color: _darkTheme
                                ? KColor.white
                                : KColor.maastrichtBlue,
                            fontSize: 20)),
                    SizedBox(
                      height: KSize.getHeight(context, 50),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                          child: Image(
                              image: _darkTheme
                                  ? const AssetImage(AssetPath.darkAudio)
                                  : const AssetImage(AssetPath.lightAudio),
                              height: 50,
                              width: 50),
                        ),
                        SizedBox(
                          width: KSize.getWidth(context, 20),
                        ),
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
                            child: Image(
                                image: _darkTheme
                                    ? const AssetImage(AssetPath.darkVideo)
                                    : const AssetImage(AssetPath.lightVideo),
                                height: 50,
                                width: 50)),
                      ],
                    ),
                    SizedBox(
                      height: KSize.getHeight(context, 20),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  appointmentDetails(String informations, details) {
    return Builder(builder: (context) {
      final themeNotifier = Provider.of<ThemeNotifier>(context);
      var _darkTheme = (themeNotifier.getTheme() == darkTheme);
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(informations,
                  style: KTextStyle.regular.copyWith(
                      color: _darkTheme ? KColor.white : KColor.maastrichtBlue,
                      fontSize: 18)),
              Text(details,
                  style: KTextStyle.regularText.copyWith(
                      color: _darkTheme ? KColor.darkdimgray : KColor.dimgray))
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 14, bottom: 20),
            height: 1,
            color: _darkTheme ? KColor.darkBorder : KColor.border,
          )
        ],
      );
    });
  }
}
