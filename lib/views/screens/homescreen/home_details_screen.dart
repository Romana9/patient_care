import 'package:flutter/material.dart';
import 'package:saviorcare/views/styles/b_style.dart';
import '../../../constants/asset_path.dart';
import '../../global_components/k_text_field.dart';
import '../chat/chat_list_screen.dart';
import '../home/component/doctors.dart';
import '../home/component/doctors_info.dart';
import '../home/component/image_list.dart';
import '../home/popular_doctors_screen.dart';
import '../home/schedule_screen.dart';
import '../home/your_doctors.dart';
import '../menu/settings/account_info_screen.dart';
import '../menu/settings/settings_screen.dart';
import '../startup/plan_screen.dart';
import 'package:provider/provider.dart';
import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';

class HomeDetailsScreen extends StatefulWidget {
  final Function()? onPressedCallback;
  final Function()? textfieldonTap;
  const HomeDetailsScreen(
      {Key? key, this.onPressedCallback, this.textfieldonTap})
      : super(key: key);

  @override
  _HomeDetailsScreenState createState() => _HomeDetailsScreenState();
}

class _HomeDetailsScreenState extends State<HomeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: widget.onPressedCallback,
                  child: Container(
                    margin: const EdgeInsets.only(left: 24),
                    child: _darkTheme
                        ? const Image(
                            image: AssetImage(AssetPath.darkDrawerMenu),
                            height: 44,
                            width: 44,
                          )
                        : const Image(
                            image: AssetImage(AssetPath.lightMenu),
                            height: 44,
                            width: 44,
                          ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'LOCATION',
                      style: KTextStyle.regularText.copyWith(
                          fontSize: 12,
                          color:
                              _darkTheme ? KColor.darkdimgray : KColor.dimgray),
                    ),
                    Text(
                      'Mansoura, EG',
                      style: KTextStyle.regularText.copyWith(
                          fontSize: 20,
                          color: _darkTheme
                              ? KColor.white
                              : KColor.maastrichtBlue),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const AccountInfoScreen()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 24),
                    child: const Image(
                      image: AssetImage(
                        AssetPath.profile,
                      ),
                      height: 44,
                      width: 44,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: KSize.getHeight(context, 660),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    //height: KSize.getHeight(context, 600),
                    margin: const EdgeInsets.only(left: 24, right: 24, top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning ! Eslam Oraby',
                          style: KTextStyle.regularText.copyWith(
                              color: _darkTheme
                                  ? KColor.darkdimgray
                                  : KColor.dimgray,
                              fontSize: 14),
                        ),
                        SizedBox(height: KSize.getHeight(context, 8)),
                        Text(
                          'How are you today?',
                          style: KTextStyle.normal.copyWith(
                              color: _darkTheme
                                  ? KColor.white
                                  : KColor.maastrichtBlue),
                        ),
                        SizedBox(height: KSize.getHeight(context, 30)),
                        KTextField(
                          onTap: widget.textfieldonTap,
                          isReadOnly: true,
                          hintText: 'Search Doctors',
                          hasPrefixIcon: true,
                          prefixIcon: Container(
                              // padding: EdgeInsets.all(13),
                              margin: const EdgeInsets.only(top: 1, right: 8),
                              child: const Image(
                                image: AssetImage(AssetPath.search),
                                width: 20,
                                height: 20,
                              )),
                          borderRadius: 50,
                        ),
                        // KTextFields(
                        //     onPressedCallback: () {
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (_) => const SearchScreen()));
                        //     },
                        //     readonly: true,
                        //     height: KSize.getHeight(context, 50),
                        //     prefixIcon: Padding(
                        //       padding: const EdgeInsets.all(11),
                        //       child: Image(
                        //         image: const AssetImage(AssetPath.search),
                        //         height: 20,
                        //         width: 20,
                        //         color:
                        //             _darkTheme ? KColor.darkSearchIcon : null,
                        //       ),
                        //     ),
                        //     hintText: 'Search Doctors',
                        //     obsecuretext: false,
                        //     keyboardtype: TextInputType.text,
                        //     leftPadding: 24,
                        //     fontSize: 16,
                        //     borderRadius: 50),
                        SizedBox(height: KSize.getHeight(context, 30)),
                        const ImageList(),
                        SizedBox(height: KSize.getHeight(context, 30)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Image(
                                  image: AssetImage(AssetPath.fire),
                                  height: 20,
                                  width: 12,
                                ),
                                SizedBox(
                                  width: KSize.getWidth(context, 8),
                                ),
                                Text(
                                  'Popular',
                                  style: KTextStyle.normal.copyWith(
                                      fontSize: 20,
                                      color: _darkTheme
                                          ? KColor.white
                                          : KColor.maastrichtBlue),
                                )
                              ],
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const PopularDoctorsScreen()));
                                },
                                child: Text(
                                  'See all',
                                  style: KTextStyle.normal.copyWith(
                                      fontSize: 16,
                                      color: KColor.mediumslateblue),
                                ))
                          ],
                        ),
                        SizedBox(height: KSize.getHeight(context, 20)),
                        const DoctorsInfo(),
                        SizedBox(height: KSize.getHeight(context, 30)),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const PlanScreen()));
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 16, left: 20, bottom: 17, right: 30),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: _darkTheme
                                    ? KColor.darkWhiteSmoke
                                    : KColor.darkslategray),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _darkTheme
                                        ? const Image(
                                            image:
                                                AssetImage(AssetPath.darkstar),
                                            height: 30,
                                            width: 30,
                                          )
                                        : const Image(
                                            image:
                                                AssetImage(AssetPath.lightStar),
                                            height: 30,
                                            width: 30,
                                          ),
                                    const SizedBox(width: 23),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Go Premium',
                                          style: KTextStyle.normal.copyWith(
                                              fontSize: 18,
                                              color: _darkTheme
                                                  ? KColor.maastrichtBlue
                                                  : KColor.white),
                                        ),
                                        Text(
                                          'Get unlimited acess to all\nour feature',
                                          style: KTextStyle.regularText
                                              .copyWith(
                                                  fontSize: 14,
                                                  color: _darkTheme
                                                      ? KColor.dimgray
                                                      : KColor.white),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                const Image(
                                  image: AssetImage(AssetPath.btn),
                                  height: 53,
                                  width: 32,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: KSize.getHeight(context, 30)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Your Doctors',
                              style: KTextStyle.normal.copyWith(
                                  fontSize: 20,
                                  color: _darkTheme
                                      ? KColor.white
                                      : KColor.maastrichtBlue),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const YourDoctorsScreen()));
                              },
                              child: Text(
                                'See all',
                                style: KTextStyle.normal.copyWith(
                                    fontSize: 16,
                                    color: KColor.mediumslateblue),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: KSize.getHeight(context, 20)),
                        const Doctors(),
                        SizedBox(height: KSize.getHeight(context, 50)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                //horizontal: 10,
                vertical: 10 / 2,
              ),
              // child: Container(
              //   padding: const EdgeInsets.only(top: 15),
              //   height: KSize.getHeight(context, 80),
              //   width: KSize.getWidth(context, double.infinity),
              //   color: KColor.white,
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       SizedBox(
              //         width: KSize.getWidth(context, 42),
              //       ),
              //       SizedBox(
              //           height: KSize.getHeight(context, 5),
              //           width: KSize.getWidth(context, 60)),
              //       SizedBox(width: KSize.getWidth(context, 45)),
              //       InkWell(
              //         onTap: () {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (_) => const ScheduleScreen()));
              //         },
              //         child: const Image(
              //             image: AssetImage(AssetPath.calendar),
              //             height: 20,
              //             width: 18),
              //       ),
              //       SizedBox(
              //         width: KSize.getWidth(context, 65),
              //       ),
              //       InkWell(
              //         onTap: () {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (_) => const ChatListScreen()));
              //         },
              //         child: const Image(
              //             image: AssetImage(AssetPath.chat),
              //             height: 20,
              //             width: 20),
              //       ),
              //       SizedBox(
              //         width: KSize.getWidth(context, 65),
              //       ),
              //       InkWell(
              //         onTap: () {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (_) => const SettingsScreen()));
              //         },
              //         child: const Image(
              //             image: AssetImage(AssetPath.setting),
              //             height: 20,
              //             width: 19),
              //       ),
              //     ],
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
