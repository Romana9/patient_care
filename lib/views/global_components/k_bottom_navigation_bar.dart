import 'package:flutter/material.dart';
import 'package:saviorcare/constants/asset_path.dart';
import 'package:saviorcare/views/screens/menu/settings/settings_screen.dart';
import 'package:saviorcare/views/styles/b_style.dart';
import 'package:provider/provider.dart';
import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';
import '../screens/chat/chat_list_screen.dart';

import '../screens/home/schedule_screen.dart';
import '../screens/home/search_screen.dart';
import '../screens/homescreen/drawer_screen.dart';
import '../screens/homescreen/home_details_screen.dart';

class KBottomNavigationBar extends StatefulWidget {
  const KBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<KBottomNavigationBar> createState() => _KBottomNavigationBarState();
}

class _KBottomNavigationBarState extends State<KBottomNavigationBar> {
  List bottomnavigationList = [
    {'id': 1, 'image': const AssetImage(AssetPath.home)},
    {'id': 2, 'image': const AssetImage(AssetPath.calendar)},
    {'id': 3, 'image': const AssetImage(AssetPath.chat)},
    {'id': 4, 'image': const AssetImage(AssetPath.setting)},
  ];
  int _currentIndex = 1;
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Stack(
      children: [
        Scaffold(
          extendBody: true,
          body: _currentIndex == 2
              ? const ScheduleScreen()
              : _currentIndex == 3
                  ? const ChatListScreen()
                  : _currentIndex == 4
                      ? const SettingsScreen()
                      : Stack(
                          children: [
                            DrawerScreen(
                              onPressedCallback: () {
                                setState(() {
                                  xOffset = 0;
                                  yOffset = 0;
                                  scaleFactor = 1;
                                  isDrawerOpen = false;
                                  _currentIndex = 0;
                                });
                              },
                              image: const Image(
                                  image: AssetImage(AssetPath.cancelMenu),
                                  height: 44,
                                  width: 44),
                            ),
                            AnimatedContainer(
                                transform: Matrix4.translationValues(
                                    xOffset, yOffset, 0)
                                  ..scale(scaleFactor)
                                  ..rotateY(isDrawerOpen ? -0.7 : 0),
                                duration: const Duration(milliseconds: 250),
                                decoration: BoxDecoration(
                                    color: KColor.ghostwhite,
                                    borderRadius: BorderRadius.circular(
                                        isDrawerOpen ? 30 : 0.0)),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: _darkTheme
                                          ? KColor.darkBg
                                          : KColor.lightBg,
                                      borderRadius: BorderRadius.circular(
                                          isDrawerOpen ? 30 : 0.0)),
                                  child: HomeDetailsScreen(
                                    textfieldonTap: isDrawerOpen
                                        ? null
                                        : () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        const SearchScreen()));
                                          },
                                    onPressedCallback: () {
                                      setState(() {
                                        _currentIndex = 1;
                                        xOffset = 220;
                                        yOffset = 320;
                                        scaleFactor = 1;
                                        isDrawerOpen = true;
                                      });
                                    },
                                  ),
                                ))
                          ],
                        ),
          bottomNavigationBar: isDrawerOpen
              ? null
              : Stack(
                  children: [
                    Container(
                      height: 80,
                      // color: Colors.transparent,
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        // margin: const EdgeInsets.only(left: 42),
                        padding: const EdgeInsets.only(top: 20),
                        height: 70,
                        color: _darkTheme ? KColor.darkblack : KColor.white,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                                bottomnavigationList.length,
                                (index) => Row(
                                      children: [
                                        bottomnavigationList[index]['id'] == 1
                                            ? SizedBox(
                                                width:
                                                    KSize.getWidth(context, 42))
                                            : const SizedBox(),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                bottomnavigationList[index]
                                                            ['id'] ==
                                                        1
                                                    ? _currentIndex = 1
                                                    : bottomnavigationList[
                                                                index]['id'] ==
                                                            2
                                                        ? _currentIndex = 2
                                                        : bottomnavigationList[
                                                                        index]
                                                                    ['id'] ==
                                                                3
                                                            ? _currentIndex = 3
                                                            : bottomnavigationList[
                                                                            index]
                                                                        [
                                                                        'id'] ==
                                                                    4
                                                                ? _currentIndex =
                                                                    4
                                                                : _currentIndex =
                                                                    0;
                                              });
                                            },
                                            child: Image(
                                                image:
                                                    bottomnavigationList[index]
                                                        ['image'],
                                                height: 20,
                                                width: 20,
                                                color: _currentIndex == 1 &&
                                                        bottomnavigationList[index]
                                                                ['id'] ==
                                                            1
                                                    ? Colors.transparent
                                                    : _currentIndex == 2 &&
                                                            bottomnavigationList[
                                                                        index]
                                                                    ['id'] ==
                                                                2
                                                        ? Colors.transparent
                                                        : _currentIndex == 3 &&
                                                                bottomnavigationList[index]
                                                                        [
                                                                        'id'] ==
                                                                    3
                                                            ? Colors.transparent
                                                            : _currentIndex ==
                                                                        4 &&
                                                                    bottomnavigationList[index]
                                                                            ['id'] ==
                                                                        4
                                                                ? Colors.transparent
                                                                : null)),
                                        bottomnavigationList[index]['id'] == 4
                                            ? SizedBox(
                                                width:
                                                    KSize.getWidth(context, 65))
                                            : SizedBox(
                                                width:
                                                    KSize.getWidth(context, 65))
                                      ],
                                    ))),
                      ),
                    ),
                    Positioned(
                      left: _currentIndex == 2
                          ? 105
                          : _currentIndex == 3
                              ? 195
                              : _currentIndex == 4
                                  ? 275
                                  : 30,
                      top: 0,
                      child: Image(
                        image: _currentIndex == 2
                            ? const AssetImage(AssetPath.darkSelectedCalender)
                            : _currentIndex == 3
                                ? const AssetImage(AssetPath.darkSelectedChat)
                                : _currentIndex == 4
                                    ? const AssetImage(
                                        AssetPath.darkSelectedSetting)
                                    : const AssetImage(
                                        AssetPath.lightSelectedHome),
                        height: 60,
                        width: 60,
                      ),
                    )
                  ],
                ),
        ),
      ],
    );
  }
}
