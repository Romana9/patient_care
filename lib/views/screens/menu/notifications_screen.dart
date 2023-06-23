import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/constants/asset_path.dart';
import 'package:saviorcare/controller/cubit/cubit/patient_cubit.dart';
import 'package:saviorcare/views/global_components/k_app_bar.dart';
import 'package:saviorcare/views/styles/b_style.dart';

import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    List notification = PatientCubit.get(context).notification;
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return BlocConsumer<PatientCubit, PatientState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: const KAppBar(title: 'Notifications'),
          body: notification.isEmpty
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: KSize.getWidth(context, 10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset("assets/images/noti.png"),
                      SizedBox(
                        height: KSize.getHeight(context, 20),
                      ),
                      Center(
                        child: Text("Notification Is Empty",
                            style: KTextStyle.splashHeadline.copyWith(
                                color: _darkTheme ? KColor.white : KColor.gray,
                                fontSize: 34)),
                      )
                    ],
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(left: 24, right: 24, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Today',
                            style: KTextStyle.regular.copyWith(
                                color: _darkTheme
                                    ? KColor.white
                                    : KColor.maastrichtBlue,
                                fontSize: 20),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                PatientCubit.get(context)
                                    .deleteAllNotification();
                              });
                            },
                            child: Text(
                              'Delete all',
                              style: KTextStyle.normal.copyWith(
                                  fontSize: 16, color: KColor.tomatoRed),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: KSize.getHeight(context, 20),
                      ),
                      Expanded(
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: notification.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Slidable(
                                    key: const ValueKey(0),
                                    endActionPane: ActionPane(
                                      motion: const StretchMotion(),
                                      children: [
                                        SlidableAction(
                                          flex: 2,
                                          onPressed: (context) {
                                            setState(() {
                                              notification.removeAt(index);
                                            });
                                          },
                                          backgroundColor:
                                              KColor.mediumslateblue,
                                          foregroundColor: Colors.white,
                                          icon: Icons.done,
                                          label: 'Delete',
                                        ),
                                      ],
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 12, left: 14, bottom: 12),
                                      width: KSize.getWidth(
                                          context, double.infinity),
                                      decoration: BoxDecoration(
                                          color: _darkTheme
                                              ? KColor.darkblack
                                              : KColor.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              width: 1,
                                              color: _darkTheme
                                                  ? KColor.darkBorder
                                                  : KColor.border)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Image(
                                                image: PatientCubit.get(context)
                                                        .notification[index]
                                                    ['image'],
                                                height: 20,
                                                width: 20,
                                              ),
                                              SizedBox(
                                                width:
                                                    KSize.getWidth(context, 10),
                                              ),
                                              Text(
                                                PatientCubit.get(context)
                                                        .notification[index]
                                                    ['heading'],
                                                style: KTextStyle.regular
                                                    .copyWith(
                                                        color: _darkTheme
                                                            ? KColor.white
                                                            : KColor
                                                                .maastrichtBlue,
                                                        fontSize: 12),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                              height:
                                                  KSize.getHeight(context, 3)),
                                          Text(
                                            PatientCubit.get(context)
                                                .notification[index]['details'],
                                            style: KTextStyle.regularText
                                                .copyWith(
                                                    color: _darkTheme
                                                        ? KColor.darkdimgray
                                                        : KColor.dimgray,
                                                    fontSize: 12),
                                          )
                                        ],
                                      ),
                                    )),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
