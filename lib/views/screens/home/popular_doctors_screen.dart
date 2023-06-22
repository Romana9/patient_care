import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/constants/asset_path.dart';
import 'package:saviorcare/views/global_components/k_app_bar.dart';
import 'package:saviorcare/views/screens/home/doctor_profile_screen.dart';
import 'package:saviorcare/views/styles/b_style.dart';

import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';

class PopularDoctorsScreen extends StatefulWidget {
  const PopularDoctorsScreen({Key? key}) : super(key: key);

  @override
  _PopularDoctorsScreenState createState() => _PopularDoctorsScreenState();
}

class _PopularDoctorsScreenState extends State<PopularDoctorsScreen> {
  List popularDoctorsList = [
    {
      'image': const AssetImage(AssetPath.drPeaterS),
      'name': 'Dr. Khaled Ahmed',
      'designation': 'Physiatrist',
      'date': '20 Sep 2023',
      'time': '12pm-5pm'
    },
    {
      'image': const AssetImage(AssetPath.drWiliam),
      'name': 'Dr. Nabil Elsawy',
      'designation': 'Neurology',
      'date': '20 Sep 2023',
      'time': '12pm-5pm'
    },
    {
      'image': const AssetImage(AssetPath.drElizabeth),
      'name': 'Dr. Mariam Mohamed',
      'designation': 'Dermatology',
      'date': '20 Sep 2023',
      'time': '12pm-5pm'
    },
    {
      'image': const AssetImage(AssetPath.drAdom),
      'name': 'Dr. Ahmed Hassan',
      'designation': 'Orthopedic Surgery',
      'date': '20 Sep 2023',
      'time': '12pm-5pm'
    }
  ];
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      // backgroundColor: KColor.ghostwhite,
      appBar: const KAppBar(title: ''),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.only(left: 24, right: 24, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      const Image(
                        image: AssetImage(AssetPath.fire),
                        height: 25,
                        width: 15,
                      ),
                      SizedBox(
                        width: KSize.getWidth(context, 5),
                      ),
                      Text(
                        'Popular Doctors',
                        style: KTextStyle.normal.copyWith(
                            fontSize: 24,
                            color: _darkTheme
                                ? KColor.white
                                : KColor.maastrichtBlue),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: KSize.getHeight(context, 20),
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      List.generate(popularDoctorsList.length, (int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DoctorProfileScreen(
                                      name: popularDoctorsList[index]['name'],
                                      image: popularDoctorsList[index]['image'],
                                      designation: popularDoctorsList[index]
                                              ['designation'],
                                    )));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: KSize.getWidth(context, 20)),
                        padding: const EdgeInsets.only(
                            top: 20, left: 20, bottom: 25),
                        //height: 167,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: _darkTheme
                                    ? KColor.darkBorder
                                    : KColor.border),
                            borderRadius: BorderRadius.circular(20),
                            color:
                                _darkTheme ? KColor.darkblack : KColor.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image(
                                  image: popularDoctorsList[index]['image'],
                                  height: 50,
                                  width: 50,
                                ),
                                SizedBox(
                                  width: KSize.getWidth(context, 14),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      popularDoctorsList[index]['name'],
                                      style: KTextStyle.normal.copyWith(
                                          fontSize: 18,
                                          color: _darkTheme
                                              ? KColor.white
                                              : KColor.maastrichtBlue),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          popularDoctorsList[index]
                                              ['designation'],
                                          style: KTextStyle.regularText
                                              .copyWith(
                                                  fontSize: 14,
                                                  color: _darkTheme
                                                      ? KColor.darkdimgray
                                                      : KColor.dimgray),
                                        ),
                                        SizedBox(
                                          width: KSize.getWidth(context, 10),
                                        ),
                                        Text(
                                          '4.0',
                                          style: KTextStyle.regular.copyWith(
                                              fontSize: 12,
                                              color: KColor.orange),
                                        ),
                                        SizedBox(
                                          width: KSize.getWidth(context, 2),
                                        ),
                                        const Image(
                                          image:
                                              AssetImage(AssetPath.ratingStar),
                                          height: 12,
                                          width: 12,
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: KSize.getHeight(context, 16)),
                            Text(
                              'Date & Time',
                              style: KTextStyle.regular.copyWith(
                                  color: _darkTheme
                                      ? KColor.white
                                      : KColor.maastrichtBlue),
                            ),
                            SizedBox(height: KSize.getHeight(context, 10)),
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 98,
                                  padding: const EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: _darkTheme
                                        ? KColor.darkBg
                                        : KColor.lightBg,
                                  ),
                                  child: Row(children: [
                                    const Image(
                                      image: AssetImage(AssetPath.calendar),
                                      height: 14,
                                      width: 12,
                                    ),
                                    SizedBox(
                                      width: KSize.getWidth(context, 8),
                                    ),
                                    Text(
                                      popularDoctorsList[index]['date'],
                                      style: KTextStyle.regularText.copyWith(
                                          fontSize: 10, color: KColor.dimgray),
                                    ),
                                  ]),
                                ),
                                SizedBox(
                                  width: KSize.getWidth(context, 30),
                                ),
                                Container(
                                  height: 30,
                                  width: 98,
                                  padding: const EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: _darkTheme
                                        ? KColor.darkBg
                                        : KColor.lightBg,
                                  ),
                                  child: Row(
                                    children: [
                                      const Image(
                                        image: AssetImage(AssetPath.timeCircle),
                                        height: 14,
                                        width: 12,
                                      ),
                                      SizedBox(
                                        width: KSize.getWidth(context, 8),
                                      ),
                                      Text(
                                        popularDoctorsList[index]['time'],
                                        style: KTextStyle.regularText.copyWith(
                                            fontSize: 10,
                                            color: KColor.dimgray),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
