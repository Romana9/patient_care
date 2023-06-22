// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/constants/asset_path.dart';
import 'package:saviorcare/views/global_components/k_app_bar.dart';
import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';
import 'appointment_screen.dart';
import 'package:saviorcare/views/styles/b_style.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int isSelected = 0;
  List scheduleList = ['Upcoming', 'Completed', 'Cancel'];
  List doctorsInfoList = [
    {
      'image': const AssetImage(AssetPath.drPeaterS),
      'name': 'Dr. Khaled Ahmed',
      'designation': 'Physiatrist',
      'date': '20 Sep 2023',
      'time': '12pm-5pm'
    },
    {
      'image': const AssetImage(AssetPath.drWiliam),
      'name': 'Dr. Ahmed Hassan',
      'designation': 'Orthopedic Surgery',
      'date': '20 Sep 2023',
      'time': '12pm-5pm'
    },
    {
      'image': const AssetImage(AssetPath.drAdom),
      'name': 'Dr. Eslam Oraby',
      'designation': 'Cardiology',
      'date': '20 Sep 2023',
      'time': '12pm-5pm'
    },
    {
      'image': const AssetImage(AssetPath.drElizabeth),
      'name': 'Dr. Mariam Mohamed',
      'designation': 'Neurology',
      'date': '20 Sep 2023',
      'time': '12pm-5pm'
    },
    {
      'image': const AssetImage(AssetPath.drPeaterParker),
      'name': 'Dr. Nour El-Ferra',
      'designation': 'Dermatology',
      'date': '20 Sep 2023',
      'time': '12pm-5pm'
    },
    {
      'image': const AssetImage(AssetPath.drPeaterS),
      'name': 'Dr. Abdelrahman Ashraf',
      'designation': 'Pediatrics',
      'date': '20 Sep 2023',
      'time': '12pm-5pm'
    },
  ];
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: _darkTheme ? KColor.darkBg : KColor.ghostwhite,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text('Schedule',
                style: KTextStyle.regular.copyWith(
                    color: _darkTheme ? KColor.white : KColor.maastrichtBlue,
                    fontWeight: FontWeight.w600)),
          ),
          body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 24, top: 20),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            scheduleList.length,
                            (index) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected = index;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 18, top: 6, bottom: 6, right: 18),
                                    margin: const EdgeInsets.only(right: 13),
                                    decoration: BoxDecoration(
                                        color: isSelected == index && _darkTheme
                                            ? KColor.darkSearchIcon
                                            : isSelected == index && !_darkTheme
                                                ? KColor.darkMidnightblue
                                                : _darkTheme
                                                    ? KColor.darkblack
                                                    : KColor.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: isSelected == index
                                                ? Colors.transparent
                                                : _darkTheme
                                                    ? KColor.darkBorder
                                                    : KColor.border)),
                                    child: Center(
                                      child: Text(
                                        scheduleList[index],
                                        style: KTextStyle.regular.copyWith(
                                          fontSize: 14,
                                          color: isSelected == index
                                              ? KColor.white
                                              : _darkTheme
                                                  ? KColor.white
                                                  : KColor.maastrichtBlue,
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: KSize.getHeight(context, 30),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 24, right: 24),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:
                            List.generate(doctorsInfoList.length, (int index) {
                          return Container(
                            margin: EdgeInsets.only(
                                bottom: KSize.getWidth(context, 30)),
                            padding: const EdgeInsets.only(
                                top: 20, left: 20, right: 20),
                            height: 221,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: _darkTheme
                                        ? KColor.darkBorder
                                        : KColor.border),
                                borderRadius: BorderRadius.circular(20),
                                color: _darkTheme
                                    ? KColor.darkblack
                                    : KColor.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image(
                                      image: doctorsInfoList[index]['image'],
                                      height: 50,
                                      width: 50,
                                    ),
                                    SizedBox(
                                      width: KSize.getWidth(context, 14),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          doctorsInfoList[index]['name'],
                                          style: KTextStyle.normal.copyWith(
                                              fontSize: 18,
                                              color: _darkTheme
                                                  ? KColor.white
                                                  : KColor.maastrichtBlue),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              doctorsInfoList[index]
                                                  ['designation'],
                                              style: KTextStyle.regularText
                                                  .copyWith(
                                                      fontSize: 14,
                                                      color: _darkTheme
                                                          ? KColor.darkdimgray
                                                          : KColor.dimgray),
                                            ),
                                            SizedBox(
                                              width:
                                                  KSize.getWidth(context, 10),
                                            ),
                                            Text(
                                              '4.0',
                                              style: KTextStyle.regular
                                                  .copyWith(
                                                      fontSize: 12,
                                                      color: KColor.orange),
                                            ),
                                            SizedBox(
                                              width: KSize.getWidth(context, 2),
                                            ),
                                            const Image(
                                              image: AssetImage(
                                                  AssetPath.ratingStar),
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
                                          doctorsInfoList[index]['date'],
                                          style: KTextStyle.regularText
                                              .copyWith(
                                                  fontSize: 10,
                                                  color: KColor.dimgray),
                                        ),
                                      ]),
                                    ),
                                    SizedBox(
                                      width: KSize.getWidth(context, 20),
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
                                            image: AssetImage(
                                                AssetPath.timeCircle),
                                            height: 14,
                                            width: 12,
                                          ),
                                          SizedBox(
                                            width: KSize.getWidth(context, 8),
                                          ),
                                          Text(
                                            doctorsInfoList[index]['time'],
                                            style: KTextStyle.regularText
                                                .copyWith(
                                                    fontSize: 10,
                                                    color: KColor.dimgray),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: KSize.getHeight(context, 19),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: KSize.getHeight(context, 40),
                                      width: KSize.getWidth(context, 134),
                                      decoration: BoxDecoration(
                                          color: _darkTheme
                                              ? KColor.darkBg
                                              : KColor.white,
                                          border: Border.all(
                                              color: _darkTheme
                                                  ? Colors.transparent
                                                  : KColor.border),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Center(
                                        child: Text(
                                          'Cancel',
                                          style: KTextStyle.regular.copyWith(
                                              color: _darkTheme
                                                  ? KColor.white
                                                  : KColor.maastrichtBlue,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    AppointmentScreen(
                                                      name:
                                                          doctorsInfoList[index]
                                                              ['name'],
                                                      image:
                                                          doctorsInfoList[index]
                                                              ['image'],
                                                      designation:
                                                          doctorsInfoList[index]
                                                              ['designation'],
                                                    )));
                                      },
                                      child: Container(
                                        height: KSize.getHeight(context, 40),
                                        width: KSize.getWidth(context, 134),
                                        decoration: BoxDecoration(
                                            color: KColor.mediumslateblue,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Center(
                                          child: Text(
                                            'Reshedule',
                                            style: KTextStyle.regular.copyWith(
                                                color: KColor.white,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        })),
                  ),
                  SizedBox(
                    height: KSize.getHeight(context, 60),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
