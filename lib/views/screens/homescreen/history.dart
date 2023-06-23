import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../../../constants/asset_path.dart';
import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';
import '../../global_components/k_app_bar.dart';
import '../../styles/k_colors.dart';
import '../../styles/k_size.dart';
import '../../styles/k_text_style.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List temp = [
    {
      'text1': "Blood Pessure",
      'text2': "141/90 mmhg",
      'percent1': "35%",
      'percent2': 0.35,
      'color1': const Color(0xffFF5263),
      'color2': const Color(0xffFFCBD0),
    },
    {
      'text1': "Body Temperature",
      'text2': "37°C",
      'percent1': "15%",
      'percent2': 0.15,
      'color1': const Color(0xff796EFF),
      'color2': const Color(0xffD7D3FF),
    },
    {
      'text1': "Body Weight",
      'text2': "78kg",
      'percent1': "40%",
      'percent2': 0.40,
      'color1': const Color(0xff23A9F9),
      'color2': const Color(0xffBDE5FD),
    },
    {
      'text1': "Body Height",
      'text2': "176” cm",
      'percent1': "30%",
      'percent2': 0.30,
      'color1': const Color(0xffFFA900),
      'color2': const Color(0xffFEECBE),
    },
  ];
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      appBar: const KAppBar(title: 'Patient History'),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: KSize.getWidth(context, 20),
            vertical: KSize.getHeight(context, 20)),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  SizedBox(
                    height: KSize.getHeight(context, 100),
                    width: KSize.getWidth(context, 100),
                    child: CircleAvatar(
                      child: Image.asset(AssetPath.profile),
                    ),
                  ),
                  const Spacer()
                ],
              ),
              SizedBox(height: KSize.getHeight(context, 20)),
              Text("Eslam Oraby",
                  style: KTextStyle.regular.copyWith(
                      color: _darkTheme ? KColor.white : KColor.maastrichtBlue,
                      fontWeight: FontWeight.w600,
                      fontSize: 18)),
              Text("22 Years, Male",
                  style: KTextStyle.regular.copyWith(
                      color: _darkTheme ? KColor.white : KColor.gray)),
              SizedBox(height: KSize.getHeight(context, 39)),
              Row(
                children: [
                  Text("Date of Birht",
                      style: KTextStyle.regular.copyWith(
                          color: _darkTheme ? KColor.white : KColor.gray,
                          fontWeight: FontWeight.w600,
                          fontSize: 14)),
                ],
              ),
              Row(
                children: [
                  Text("5 May 2001",
                      style: KTextStyle.regular.copyWith(
                          color:
                              _darkTheme ? KColor.white : KColor.maastrichtBlue,
                          fontSize: 14))
                ],
              ),
              SizedBox(height: KSize.getHeight(context, 19)),
              Row(
                children: [
                  Text("Diseases",
                      style: KTextStyle.regular.copyWith(
                          color: _darkTheme ? KColor.white : KColor.gray,
                          fontWeight: FontWeight.w600,
                          fontSize: 14)),
                ],
              ),
              Row(
                children: [
                  Text("Cardiology",
                      style: KTextStyle.regular.copyWith(
                          color:
                              _darkTheme ? KColor.white : KColor.maastrichtBlue,
                          fontSize: 14))
                ],
              ),
              SizedBox(height: KSize.getHeight(context, 40)),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2.6 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 15),
                  itemCount: temp.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(KSize.getHeight(context, 14)),
                      height: KSize.getHeight(context, 112),
                      width: KSize.getWidth(context, 156),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Row(children: [
                            Text(temp[index]['text1'],
                                style: KTextStyle.regular.copyWith(
                                    color: _darkTheme
                                        ? KColor.white
                                        : KColor.maastrichtBlue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14)),
                          ]),
                          SizedBox(height: KSize.getHeight(context, 8)),
                          Row(children: [
                            Text(temp[index]['percent1'],
                                style: KTextStyle.regular.copyWith(
                                    color:
                                        _darkTheme ? KColor.white : KColor.gray,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12)),
                          ]),
                          SizedBox(height: KSize.getHeight(context, 8)),
                          LinearPercentIndicator(
                            width: KSize.getWidth(context, 100),
                            animation: true,
                            lineHeight: KSize.getWidth(context, 10),
                            animationDuration: 2000,
                            percent: temp[index]['percent2'],
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            barRadius: const Radius.circular(10),
                            progressColor: temp[index]['color1'],
                            backgroundColor: temp[index]['color2'],
                          ),
                          SizedBox(height: KSize.getHeight(context, 8)),
                          Row(children: [
                            Text(temp[index]['text2'],
                                style: KTextStyle.regular.copyWith(
                                    color: temp[index]['color1'],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18)),
                          ]),
                        ],
                      ),
                    );
                  }),
              SizedBox(height: KSize.getHeight(context, 24)),
              Row(children: [
                Text("Clinic Consultation @MedSyl",
                    style: KTextStyle.regular.copyWith(
                        color:
                            _darkTheme ? KColor.white : const Color(0xff5F666F),
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ]),
              SizedBox(height: KSize.getHeight(context, 7)),
              Row(children: [
                Text("11/07/2021 @ 11:11",
                    style: KTextStyle.regular.copyWith(
                        color:
                            _darkTheme ? KColor.white : const Color(0xff5F666F),
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
              ]),
              SizedBox(height: KSize.getHeight(context, 7)),
              Row(children: [
                Text("Dr. Ahmed Hassan",
                    style: KTextStyle.regular.copyWith(
                        color:
                            _darkTheme ? KColor.white : const Color(0xff5F666F),
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
              ]),
              SizedBox(height: KSize.getHeight(context, 7)),
              Text(
                  "A negative test result only means that you did have COVID-19 at the time of testing. However, that does not mean you will not get COVID-19.",
                  style: KTextStyle.regular.copyWith(
                      color:
                          _darkTheme ? KColor.white : const Color(0xff5F666F),
                      fontSize: 14)),
              SizedBox(height: KSize.getHeight(context, 20)),
              Row(children: [
                Text("Clinical Summary",
                    style: KTextStyle.regular.copyWith(
                        color:
                            _darkTheme ? KColor.white : const Color(0xff5F666F),
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ]),
              SizedBox(height: KSize.getHeight(context, 6)),
              Text(
                  "A negative test result only means that you did have COVID-19 at the time of testing. However, that does not mean you will not get COVID-19.",
                  style: KTextStyle.regular.copyWith(
                      color:
                          _darkTheme ? KColor.white : const Color(0xff5F666F),
                      fontSize: 14)),
              SizedBox(height: KSize.getHeight(context, 20)),
              Row(children: [
                Text("Prescribed Monitoring Plan",
                    style: KTextStyle.regular.copyWith(
                        color:
                            _darkTheme ? KColor.white : const Color(0xff5F666F),
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ]),
              SizedBox(height: KSize.getHeight(context, 7)),
              Row(children: [
                Text("Ahmed Hassan (1 month)",
                    style: KTextStyle.regular.copyWith(
                        color:
                            _darkTheme ? KColor.white : const Color(0xff5F666F),
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
              ]),
              SizedBox(height: KSize.getHeight(context, 7)),
              Row(children: [
                Text("11/07/2021",
                    style: KTextStyle.regular.copyWith(
                        color:
                            _darkTheme ? KColor.white : const Color(0xff5F666F),
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
