import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/constants/asset_path.dart';
import 'package:saviorcare/views/global_components/k_text_field.dart';
import 'package:saviorcare/views/screens/chat/component/active_list.dart';
import 'package:saviorcare/views/styles/b_style.dart';

import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';
import 'component/messages_list.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  List chatList = [
    {
      "message": "Hello",
      "type": "sender",
      "time": "4:34 PM",
    },
    {
      "message": "Hi",
      "type": "recieve",
      "time": "4:34 PM",
    },
    {
      "message": "How are you?😜",
      "type": "sender",
      "time": "4:35 PM",
    },
    {
      "message": "Nice, bro🤟",
      "type": "recieve",
      "time": "4:34 PM",
    },
    {
      "message": "I heard u guys launching\n new product?",
      "type": "sender",
      "time": "\t\t\t\t4:35 PM",
    },
    {
      "message": "Yes, It calls UiHunt",
      "type": "recieve",
      "time": "4:34 PM",
    },
    {
      "message": "Thats Awesome 😍",
      "type": "sender",
      "time": "4:34 PM",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      // backgroundColor: KColor.ghostwhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: _darkTheme ? KColor.darkBg : KColor.ghostwhite,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Chat',
            style: KTextStyle.regular.copyWith(
                color: _darkTheme ? KColor.white : KColor.maastrichtBlue,
                fontWeight: FontWeight.w600,
                fontSize: 22)),
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.only(left: 24, right: 24, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // KTextFields(
              //   readonly: false,
              //     height: KSize.getHeight(context, 50),
              //     prefixIcon: const Padding(
              //       padding: EdgeInsets.only(
              //           right: 16.0, left: 24, top: 13, bottom: 14),
              //       child: Image(
              //         image: AssetImage(AssetPath.search),
              //       ),
              //     ),
              //     hintText: 'Search',
              //     obsecuretext: false,
              //     keyboardtype: TextInputType.text,
              //     leftPadding: 0,
              //     fontSize: 16,
              //     borderRadius: 50),
              KTextField(
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
              SizedBox(height: KSize.getHeight(context, 30)),
              Text(
                'Active Now',
                style: KTextStyle.normal.copyWith(
                    color: _darkTheme ? KColor.white : KColor.maastrichtBlue,
                    fontSize: 20),
              ),
              SizedBox(height: KSize.getHeight(context, 20)),
              const ActiveList(),
              SizedBox(height: KSize.getHeight(context, 30)),
              Text(
                'Messages',
                style: KTextStyle.normal.copyWith(
                    color: _darkTheme ? KColor.white : KColor.maastrichtBlue,
                    fontSize: 20),
              ),
              SizedBox(height: KSize.getHeight(context, 20)),
              const MessegesList()
            ],
          ),
        ),
      ),
    );
  }
}
