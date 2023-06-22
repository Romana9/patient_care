import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/views/screens/home/all_review_screen.dart';
import 'package:saviorcare/views/screens/home/appoinmtment_making_screen.dart';
import 'package:saviorcare/views/styles/b_style.dart';
import '../../../constants/asset_path.dart';
import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';
import '../chat/chat_person_screen.dart';
import 'component/review.dart';

class DoctorProfileScreen extends StatefulWidget {
  const DoctorProfileScreen(
      {Key? key,
      required this.name,
      required this.image,
      required this.designation})
      : super(key: key);
  final String name;
  final AssetImage image;
  final String designation;

  @override
  _DoctorProfileScreenState createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  Image(
                      image: widget.image,
                      height: 340,
                      width: KSize.getWidth(context, double.infinity),
                      fit: BoxFit.cover),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 65,
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
              Container(
                //color: _darkTheme?KColor.darkBg:KColor.lightBg,
                margin: const EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.name,
                              style: KTextStyle.normal.copyWith(
                                  fontSize: 20,
                                  color: _darkTheme
                                      ? KColor.white
                                      : KColor.maastrichtBlue),
                            ),
                            Text(
                              widget.designation,
                              style: KTextStyle.regularText.copyWith(
                                  color: _darkTheme
                                      ? KColor.dimgray
                                      : KColor.dimgray),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '100 EG',
                              style: KTextStyle.normal.copyWith(
                                  fontSize: 18,
                                  color: _darkTheme
                                      ? KColor.white
                                      : KColor.maastrichtBlue),
                            ),
                            Text(
                              '/fee',
                              style: KTextStyle.regularText.copyWith(
                                  fontSize: 14,
                                  color: _darkTheme
                                      ? KColor.darkdimgray
                                      : KColor.dimgray),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: KSize.getHeight(context, 40),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          padding: const EdgeInsets.all(9),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:
                                  _darkTheme ? KColor.darkblack : KColor.white),
                          child: const Center(
                            child: Image(
                              image: AssetImage(AssetPath.ratingStar),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rating',
                              style: KTextStyle.regularText.copyWith(
                                  fontSize: 10,
                                  color: _darkTheme
                                      ? KColor.darkdimgray
                                      : KColor.dimgray),
                            ),
                            Text(
                              '4.8 out of 5.0',
                              style: KTextStyle.regular.copyWith(
                                  fontSize: 12,
                                  color: _darkTheme
                                      ? KColor.white
                                      : KColor.darkslategray),
                            ),
                          ],
                        ),
                        const SizedBox(width: 50),
                        Container(
                          height: 30,
                          width: 30,
                          padding: const EdgeInsets.all(9),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:
                                  _darkTheme ? KColor.darkblack : KColor.white),
                          child: const Center(
                            child: Image(
                              image: AssetImage(AssetPath.patientIcon),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Patient',
                              style: KTextStyle.regularText.copyWith(
                                  fontSize: 10,
                                  color: _darkTheme
                                      ? KColor.darkdimgray
                                      : KColor.dimgray),
                            ),
                            Text(
                              '500+',
                              style: KTextStyle.regular.copyWith(
                                  fontSize: 12,
                                  color: _darkTheme
                                      ? KColor.white
                                      : KColor.darkslategray),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: KSize.getHeight(context, 30),
                    ),
                    Text(
                      'About',
                      style: KTextStyle.normal.copyWith(
                          fontSize: 20,
                          color: _darkTheme
                              ? KColor.white
                              : KColor.maastrichtBlue),
                    ),
                    Wrap(
                      children: [
                        RichText(
                          text: TextSpan(
                            text:
                                'Physical Medicine and Rehabilitation (PM&R) physicians, also known as physiatrists, treat a wide variety of medical conditions affecting ',
                            style: KTextStyle.regularText.copyWith(
                                color: _darkTheme
                                    ? KColor.darkdimgray
                                    : KColor.slategray,
                                height: 1.5),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Read More',
                                style: KTextStyle.regular.copyWith(
                                    color: _darkTheme
                                        ? KColor.white
                                        : KColor.midnightblue,
                                    decoration: TextDecoration.underline),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: KSize.getHeight(context, 30),
                    ),
                    Text(
                      'Location',
                      style: KTextStyle.normal.copyWith(
                          fontSize: 20,
                          color: _darkTheme
                              ? KColor.white
                              : KColor.maastrichtBlue),
                    ),
                    SizedBox(
                      height: KSize.getHeight(context, 20),
                    ),
                    Stack(
                      children: const [
                        Image(
                          image: AssetImage(AssetPath.location),
                          height: 150,
                          width: double.infinity,
                        ),
                        Positioned(
                            top: 10,
                            left: 138,
                            child: Image(
                                image: AssetImage(AssetPath.locationPicture),
                                height: 57,
                                width: 57))
                      ],
                    ),
                    SizedBox(
                      height: KSize.getHeight(context, 30),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Review',
                          style: KTextStyle.normal.copyWith(
                              fontSize: 20,
                              color: _darkTheme
                                  ? KColor.white
                                  : KColor.maastrichtBlue),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const ALlReviewScreen()));
                            },
                            child: Text(
                              'See all',
                              style: KTextStyle.normal.copyWith(
                                  fontSize: 16, color: KColor.mediumslateblue),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: KSize.getHeight(context, 20),
                    ),
                    const Review(),
                    SizedBox(
                      height: KSize.getHeight(context, 30),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _darkTheme
                            ? InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ChatPersonScreen(
                                        name: widget.name,
                                        image: widget.image,
                                      ),
                                    ),
                                  );
                                },
                                child: const Image(
                                  image: AssetImage(AssetPath.darkChat),
                                  height: 52,
                                  width: 52,
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ChatPersonScreen(
                                        name: widget.name,
                                        image: widget.image,
                                      ),
                                    ),
                                  );
                                },
                                child: const Image(
                                  image: AssetImage(AssetPath.lightChat),
                                  height: 52,
                                  width: 52,
                                ),
                              ),
                        const SizedBox(width: 19),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => AppointmentMakingScreen(
                                  name: widget.name,
                                  image: widget.image,
                                  designation: widget.designation,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 40),
                            height: 50,
                            width: MediaQuery.of(context).size.width * .66,
                            decoration: BoxDecoration(
                              color: KColor.mediumslateblue,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Text(
                                'Make Appointment',
                                style: KTextStyle.regular
                                    .copyWith(color: KColor.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
