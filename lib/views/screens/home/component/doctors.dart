import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/views/styles/b_style.dart';
import 'package:saviorcare/constants/asset_path.dart';

import '../../../../controller/theme.dart';
import '../../../../controller/theme/them_notifier.dart';
import '../doctor_profile_screen.dart';

class Doctors extends StatefulWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  _DoctorsState createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  List doctorsInfoList = [
    {
      'image': const AssetImage(AssetPath.drAdom),
      'name': 'Dr. Adam Sami',
      'designation': 'Physiatrist',
    },
    {
      'image': const AssetImage(AssetPath.drElizabeth),
      'name': 'Dr. Sara Ali',
      'designation': 'Psychiatry',
    },
    {
      'image': const AssetImage(AssetPath.drElizabeth),
      'name': 'Dr. Mai Ahmed',
      'designation': 'Eye Specialist',
    },
    {
      'image': const AssetImage(AssetPath.drWiliam),
      'name': 'Dr. Fares Hany',
      'designation': 'Anesthesiology',
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
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(right: KSize.getWidth(context, 20)),
                  padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
                  //height: KSize.getHeight(context, 90),
                  width: 244,
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
                    ],
                  ),
                ),
              );
            })),
      ]),
    );
  }
}
