import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/views/global_components/k_app_bar.dart';
import 'package:saviorcare/views/global_components/k_button.dart';
import 'package:saviorcare/views/screens/home/payment_screen.dart';
import 'package:saviorcare/views/styles/b_style.dart';
import 'package:saviorcare/constants/asset_path.dart';

import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';

class AppointmentMakingScreen extends StatefulWidget {
  const AppointmentMakingScreen(
      {Key? key,
      required this.name,
      required this.image,
      required this.designation})
      : super(key: key);
  final String name;
  final AssetImage image;
  final String designation;

  @override
  _AppointmentMakingScreenState createState() =>
      _AppointmentMakingScreenState();
}

class _AppointmentMakingScreenState extends State<AppointmentMakingScreen> {
  int isSelected = 0;
  int ind = 0;
  int ind1 = 0;
  int ind2 = 0;
  List scheduleList = [
    {'day': 'Sun', 'date': '09'},
    {'day': 'Mon', 'date': '10'},
    {'day': 'Tue', 'date': '11'},
    {'day': 'Wed', 'date': '12'},
    {'day': 'Thu', 'date': '13'}
  ];
  List slotList = ['Morning', 'Afternoon', 'Evening'];
  List timeList = ['12.00 PM', '12.20 PM', '01.00 PM'];
  List typeList = ['Online', 'Offline'];
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      appBar: const KAppBar(
        title: '',
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.only(left: 24, right: 24, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Schedule',
                    style: KTextStyle.normal.copyWith(
                        fontSize: 20,
                        color:
                            _darkTheme ? KColor.white : KColor.maastrichtBlue),
                  ),
                  Row(
                    children: [
                      Text(
                        'Sep',
                        style: KTextStyle.normal.copyWith(
                            fontSize: 16, color: KColor.mediumslateblue),
                      ),
                      SizedBox(
                        width: KSize.getWidth(context, 6),
                      ),
                      const Image(
                          image: AssetImage(AssetPath.arrowDownColored),
                          height: 9,
                          width: 10)
                    ],
                  ),
                ],
              ),
              SizedBox(height: KSize.getHeight(context, 20)),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Wrap(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(scheduleList.length, (int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected = index;
                            });
                          },
                          child: Container(
                              margin: EdgeInsets.only(
                                  right: KSize.getWidth(context, 14)),
                              padding: const EdgeInsets.only(
                                  top: 17, left: 18, right: 18, bottom: 17),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: isSelected == index
                                          ? Colors.transparent
                                          : _darkTheme
                                              ? KColor.darkBorder
                                              : KColor.border),
                                  borderRadius: BorderRadius.circular(20),
                                  color: isSelected == index && _darkTheme
                                      ? KColor.darkSearchIcon
                                      : isSelected == index && !_darkTheme
                                          ? KColor.darkMidnightblue
                                          : _darkTheme
                                              ? KColor.darkblack
                                              : KColor.white),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    scheduleList[index]['day'],
                                    style: KTextStyle.regularText.copyWith(
                                        color: isSelected == index
                                            ? KColor.platinum
                                            : scheduleList[index]['day'] ==
                                                        'Mon' &&
                                                    _darkTheme
                                                ? KColor.dimgray
                                                    .withOpacity(0.2)
                                                : scheduleList[index]['day'] ==
                                                            'Mon' &&
                                                        !_darkTheme
                                                    ? const Color(0xff818385)
                                                        .withOpacity(0.5)
                                                    : KColor.dimgray,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    scheduleList[index]['date'],
                                    style: KTextStyle.normal.copyWith(
                                        color: isSelected == index
                                            ? KColor.white
                                            : scheduleList[index]['date'] ==
                                                        '10' &&
                                                    _darkTheme
                                                ? KColor.gray
                                                : _darkTheme
                                                    ? KColor.white
                                                    : scheduleList[index]
                                                                    ['date'] ==
                                                                '10' &&
                                                            !_darkTheme
                                                        ? const Color(
                                                                0xff272626)
                                                            .withOpacity(0.5)
                                                        : KColor.maastrichtBlue,
                                        fontSize: 14),
                                  ),
                                ],
                              )),
                        );
                      })),
                ]),
              ),
              SizedBox(
                height: KSize.getHeight(context, 30),
              ),
              Text(
                'Slots',
                style: KTextStyle.normal.copyWith(
                    fontSize: 20,
                    color: _darkTheme ? KColor.white : KColor.maastrichtBlue),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(slotList.length, (int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          ind = index;
                        });
                      },
                      child: Container(
                        margin:
                            EdgeInsets.only(right: KSize.getWidth(context, 10)),
                        padding: const EdgeInsets.only(
                            left: 18, top: 10, bottom: 10, right: 18),
                        // height: KSize.getHeight(context, 34),
                        // width: KSize.getWidth(context, 93),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: ind == index
                                    ? Colors.transparent
                                    : _darkTheme
                                        ? KColor.darkBorder
                                        : KColor.border),
                            borderRadius: BorderRadius.circular(10),
                            color: ind == index && _darkTheme
                                ? KColor.darkSearchIcon
                                : ind == index && !_darkTheme
                                    ? KColor.darkMidnightblue
                                    : _darkTheme
                                        ? KColor.darkblack
                                        : KColor.white),
                        child: Center(
                          child: Text(
                            slotList[index],
                            style: KTextStyle.normal.copyWith(
                                color: ind == index
                                    ? KColor.white
                                    : slotList[index] == 'Evening' && _darkTheme
                                        ? KColor.gray
                                        : _darkTheme
                                            ? KColor.white
                                            : slotList[index] == 'Evening' &&
                                                    !_darkTheme
                                                ? const Color(0xff272626)
                                                    .withOpacity(0.5)
                                                : KColor.maastrichtBlue,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    );
                  })),
              SizedBox(
                height: KSize.getHeight(context, 30),
              ),
              Text(
                'Time',
                style: KTextStyle.normal.copyWith(
                    fontSize: 20,
                    color: _darkTheme ? KColor.white : KColor.maastrichtBlue),
              ),
              SizedBox(
                height: KSize.getHeight(context, 20),
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(timeList.length, (int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            ind1 = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              right: KSize.getWidth(context, 10)),
                          padding: const EdgeInsets.only(
                              left: 20, top: 10, bottom: 10, right: 20),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: ind1 == index
                                      ? Colors.transparent
                                      : _darkTheme
                                          ? KColor.darkBorder
                                          : KColor.border),
                              borderRadius: BorderRadius.circular(10),
                              color: ind1 == index && _darkTheme
                                  ? KColor.darkSearchIcon
                                  : ind1 == index && !_darkTheme
                                      ? KColor.darkMidnightblue
                                      : _darkTheme
                                          ? KColor.darkblack
                                          : KColor.white),
                          child: Center(
                            child: Text(
                              timeList[index],
                              style: KTextStyle.normal.copyWith(
                                  color: ind1 == index
                                      ? KColor.white
                                      : timeList[index] == '12.00 PM' &&
                                              _darkTheme
                                          ? KColor.gray
                                          : _darkTheme
                                              ? KColor.white
                                              : timeList[index] == '12.00 PM' &&
                                                      !_darkTheme
                                                  ? const Color(0xff272626)
                                                      .withOpacity(0.5)
                                                  : KColor.maastrichtBlue,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      );
                    })),
              ),
              SizedBox(
                height: KSize.getHeight(context, 30),
              ),
              Text(
                'Type',
                style: KTextStyle.normal.copyWith(
                    fontSize: 20,
                    color: _darkTheme ? KColor.white : KColor.maastrichtBlue),
              ),
              SizedBox(
                height: KSize.getHeight(context, 20),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(typeList.length, (int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          ind2 = index;
                        });
                      },
                      child: Container(
                        margin:
                            EdgeInsets.only(right: KSize.getWidth(context, 10)),
                        padding: const EdgeInsets.only(
                            left: 20, top: 10, bottom: 10, right: 20),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: ind2 == index
                                    ? Colors.transparent
                                    : _darkTheme
                                        ? KColor.darkBorder
                                        : KColor.border),
                            borderRadius: BorderRadius.circular(10),
                            color: ind2 == index && _darkTheme
                                ? KColor.darkSearchIcon
                                : ind2 == index && !_darkTheme
                                    ? KColor.darkMidnightblue
                                    : _darkTheme
                                        ? KColor.darkblack
                                        : KColor.white),
                        child: Center(
                          child: Text(
                            typeList[index],
                            style: KTextStyle.normal.copyWith(
                                color: ind2 == index
                                    ? KColor.white
                                    : _darkTheme
                                        ? KColor.white
                                        : KColor.maastrichtBlue,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    );
                  })),
              SizedBox(
                height: KSize.getHeight(context, 174),
              ),
              Center(
                child: KButton(
                    onPressedCallback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PaymentScreen(
                            name: widget.name,
                            image: widget.image,
                            designation: widget.designation,
                          ),
                        ),
                      );
                    },
                    color: KColor.mediumslateblue,
                    text: 'Confirm Appointment',
                    textColor: KColor.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
