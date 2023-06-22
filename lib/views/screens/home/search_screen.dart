import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/views/global_components/k_text_field.dart';
import 'package:saviorcare/views/styles/b_style.dart';
import 'package:saviorcare/constants/asset_path.dart';

import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';
import '../../global_components/k_app_bar.dart';
import 'doctor_profile_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isButtonActive = false;
  late TextEditingController searchController;
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    searchController.addListener(() {
      final isButtonActive = searchController.text.isNotEmpty;
      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

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
      'name': 'Dr. Nabil Elsawy',
      'designation': 'Physiatrist',
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
      'name': 'Dr. Eslam Oraby',
      'designation': 'Cardiology',
      'date': '20 Sep 2023',
      'time': '12pm-5pm'
    },
  ];
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      appBar: const KAppBar(title: 'Search'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.only(left: 24, right: 24, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KTextField(
                controller: searchController,
                suffixIcon: Container(
                    padding: const EdgeInsets.all(15),
                    //margin: const EdgeInsets.only(top:2),
                    child: Image(
                      image: const AssetImage(AssetPath.search),
                      width: 5,
                      height: 5,
                      color: _darkTheme ? KColor.white : null,
                    )),
                hintText: 'Search',
                borderRadius: 50,
              ),
              // KTextFields(
              //     readonly: false,
              //     height: KSize.getHeight(context, 50),
              //     controller: searchController,
              //     suffixIcon: Padding(
              //       padding: const EdgeInsets.only(
              //           right: 15.0, left: 12, top: 12, bottom: 12),
              //       child: Image(
              //         image: const AssetImage(AssetPath.search),
              //         color: _darkTheme?KColor.white:null,
              //       ),
              //     ),
              //     hintText: 'Search',
              //     obsecuretext: false,
              //     keyboardtype: TextInputType.text,
              //     leftPadding: 24,
              //     fontSize: 16,
              //     borderRadius: 50),
              SizedBox(
                height: KSize.getHeight(context, 30),
              ),
              Container(
                child: isButtonActive
                    ? Wrap(children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(doctorsInfoList.length,
                                (int index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => DoctorProfileScreen(
                                                name: doctorsInfoList[index]
                                                    ['name'],
                                                image: doctorsInfoList[index]
                                                    ['image'],
                                                designation:
                                                    doctorsInfoList[index]
                                                        ['designation'],
                                              )));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      bottom: KSize.getWidth(context, 20)),
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 20, bottom: 25),
                                  //height: KSize.getHeight(context, 167),
                                  width:
                                      KSize.getWidth(context, double.infinity),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image(
                                            image: doctorsInfoList[index]
                                                ['image'],
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
                                                style: KTextStyle.normal
                                                    .copyWith(
                                                        fontSize: 18,
                                                        color: _darkTheme
                                                            ? KColor.white
                                                            : KColor
                                                                .maastrichtBlue),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    doctorsInfoList[index]
                                                        ['designation'],
                                                    style: KTextStyle
                                                        .regularText
                                                        .copyWith(
                                                            fontSize: 14,
                                                            color: _darkTheme
                                                                ? KColor
                                                                    .darkdimgray
                                                                : KColor
                                                                    .dimgray),
                                                  ),
                                                  SizedBox(
                                                    width: KSize.getWidth(
                                                        context, 10),
                                                  ),
                                                  Text(
                                                    '4.0',
                                                    style: KTextStyle.regular
                                                        .copyWith(
                                                            fontSize: 12,
                                                            color:
                                                                KColor.orange),
                                                  ),
                                                  SizedBox(
                                                    width: KSize.getWidth(
                                                        context, 2),
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
                                      SizedBox(
                                          height: KSize.getHeight(context, 16)),
                                      Text(
                                        'Date & Time',
                                        style: KTextStyle.regular.copyWith(
                                            color: _darkTheme
                                                ? KColor.white
                                                : KColor.maastrichtBlue),
                                      ),
                                      SizedBox(
                                          height: KSize.getHeight(context, 10)),
                                      Row(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 98,
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              color: _darkTheme
                                                  ? KColor.darkBg
                                                  : KColor.lightBg,
                                            ),
                                            child: Row(children: [
                                              const Image(
                                                image: AssetImage(
                                                    AssetPath.calendar),
                                                height: 14,
                                                width: 12,
                                              ),
                                              SizedBox(
                                                width:
                                                    KSize.getWidth(context, 8),
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
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
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
                                                  width: KSize.getWidth(
                                                      context, 8),
                                                ),
                                                Text(
                                                  doctorsInfoList[index]
                                                      ['time'],
                                                  style: KTextStyle.regularText
                                                      .copyWith(
                                                          fontSize: 10,
                                                          color:
                                                              KColor.dimgray),
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
                      ])
                    : const SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
