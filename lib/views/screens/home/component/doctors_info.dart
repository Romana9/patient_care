import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/constants/asset_path.dart';
import 'package:saviorcare/views/screens/home/doctor_profile_screen.dart';
import 'package:saviorcare/views/styles/b_style.dart';

import '../../../../controller/theme.dart';
import '../../../../controller/theme/them_notifier.dart';

class DoctorsInfo extends StatefulWidget {
  const DoctorsInfo({Key? key}) : super(key: key);

  @override
  _DoctorsInfoState createState() => _DoctorsInfoState();
}

class _DoctorsInfoState extends State<DoctorsInfo> {
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
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Wrap(children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(doctorsInfoList.length, (int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DoctorProfileScreen(
                                name: doctorsInfoList[index]['name'],
                                image: doctorsInfoList[index]['image'],
                                designation: doctorsInfoList[index]['designation'],
                              )));
                },
                child: Container(
                  margin: EdgeInsets.only(right: KSize.getWidth(context, 20)),
                  padding: const EdgeInsets.only(top: 20, left: 20, bottom: 25),
                  // height: 167,
                  width: 288,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color:
                              _darkTheme ? KColor.darkBorder : KColor.border),
                      borderRadius: BorderRadius.circular(20),
                      color: _darkTheme ? KColor.darkblack : KColor.white),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                    doctorsInfoList[index]['designation'],
                                    style: KTextStyle.regularText.copyWith(
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
                                        fontSize: 12, color: KColor.orange),
                                  ),
                                  SizedBox(
                                    width: KSize.getWidth(context, 2),
                                  ),
                                  const Image(
                                    image: AssetImage(AssetPath.ratingStar),
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
                              color:
                                  _darkTheme ? KColor.darkBg : KColor.lightBg,
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
                                style: KTextStyle.regularText.copyWith(
                                    fontSize: 10, color: KColor.dimgray),
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
                              color:
                                  _darkTheme ? KColor.darkBg : KColor.lightBg,
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
                                  doctorsInfoList[index]['time'],
                                  style: KTextStyle.regularText.copyWith(
                                      fontSize: 10, color: KColor.dimgray),
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
            })),
      ]),
    );
  }
}
