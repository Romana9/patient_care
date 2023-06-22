import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/views/styles/b_style.dart';
import 'package:saviorcare/constants/asset_path.dart';

import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';

class ChatPersonScreen extends StatefulWidget {
  const ChatPersonScreen({Key? key, required this.name, required this.image})
      : super(key: key);
  final String name;
  final AssetImage image;

  @override
  _ChatPersonScreenState createState() => _ChatPersonScreenState();
}

class _ChatPersonScreenState extends State<ChatPersonScreen> {
  @override
  Widget build(BuildContext context) {
    List chatList = [
      {
        "message": "Hi Nabil! ${widget.name} here!",
        "type": "sender",
      },
      {
        "message": "Hello ${widget.name}!",
        "type": "recieve",
      },
      {
        "message": "How are you? Good?",
        "type": "recieve",
      },
      {
        "message": "I’m fantastic!",
        "type": "sender",
      },
      {
        "message": "I still suffering from beckpain",
        "type": "recieve",
      },
      {
        "message": "Sorry to hear that, don’t be sad",
        "type": "sender",
      },
    ];
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      //backgroundColor: KColor.ghostwhite,
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: _darkTheme ? KColor.darkBg : KColor.ghostwhite,
        leadingWidth: 65,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.only(left: 24),
            child: Image(
              image: _darkTheme
                  ? const AssetImage(AssetPath.darkBack)
                  : const AssetImage(AssetPath.back),
            ),
          ),
        ),
        title: Center(
          child: Text(
            widget.name,
            style: KTextStyle.regular.copyWith(
                color: _darkTheme ? KColor.white : KColor.maastrichtBlue,
                fontWeight: FontWeight.w600),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Image(image: widget.image, height: 44, width: 44),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.only(left: 24, right: 24, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.74,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(chatList.length, (int index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 21),
                        child: Align(
                          alignment: chatList[index]["type"] == "recieve"
                              ? Alignment.topRight
                              : Alignment.topLeft,
                          child: Container(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 25, right: 25, bottom: 15),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      chatList[index]["type"] == "sender"
                                          ? const BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                              bottomLeft: Radius.circular(20))
                                          : const BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                              bottomRight: Radius.circular(5),
                                              bottomLeft: Radius.circular(20)),
                                  color: chatList[index]["type"] == "recieve"
                                      ? const Color(0xFF312054)
                                      : chatList[index]["type"] == "sender" &&
                                              _darkTheme
                                          ? KColor.darkblack
                                          : KColor.white),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    chatList[index]["message"],
                                    style: chatList[index]["type"] == "recieve"
                                        ? KTextStyle.regularText
                                            .copyWith(color: KColor.white)
                                        : KTextStyle.regularText.copyWith(
                                            color: _darkTheme
                                                ? KColor.white
                                                : KColor.maastrichtBlue,
                                          ),
                                  )
                                ],
                              )),
                        ),
                      );
                    })),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: KSize.getHeight(context, 58),
                    width: KSize.getWidth(context, 251),
                    decoration: BoxDecoration(
                        color: _darkTheme ? KColor.darkblack : KColor.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      maxLines: 2,
                      cursorColor:
                          _darkTheme ? KColor.white : KColor.maastrichtBlue,
                      style: KTextStyle.regular.copyWith(
                          fontSize: 14,
                          color: _darkTheme
                              ? KColor.white
                              : KColor.maastrichtBlue),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type a message ...',
                          hintStyle: KTextStyle.regularText
                              .copyWith(fontSize: 14, color: KColor.dimgray)),
                    ),
                  ),
                  SizedBox(width: KSize.getWidth(context, 9)),
                  Container(
                    padding: const EdgeInsets.all(15),
                    height: 50,
                    width: 58,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: KColor.mediumslateblue),
                    child: const Center(
                        child: Image(
                      image: AssetImage(AssetPath.send),
                      height: 21,
                      width: 21,
                    )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
