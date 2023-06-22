import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/constants/asset_path.dart';
import 'package:saviorcare/views/global_components/k_app_bar.dart';
import 'package:saviorcare/views/styles/b_style.dart';

import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';
import '../../global_components/k_text_field.dart';
import 'component/questions.dart';

class AskFreeQuestionScreen extends StatefulWidget {
  const AskFreeQuestionScreen({Key? key}) : super(key: key);

  @override
  _AskFreeQuestionScreenState createState() => _AskFreeQuestionScreenState();
}

class _AskFreeQuestionScreenState extends State<AskFreeQuestionScreen> {
  bool isSelected = false;
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

  List popularTopicList = [
    'Flue',
    'Pregnancy',
    'Covid 19',
    'Headache',
    'Chest Pain',
    'Eye',
    'Gastritis',
    'Mental health',
    'Food poisoning',
    'Neck Pain',
    'Jaundice',
    'Diabetes',
    'Fever',
    'Physical illness',
    'Chickenpox',
    'Common cold',
    'Diphtheria',
    'Giardiasis',
    'HIV',
    'AIDS'
  ];
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    List textList = [
      'Flu Shot Pregnancy',
      'Flu Shot Pregnancy Side Effects',
      'Flu Stomach (Gastroenteritis (Stomach Flu )',
      'Flu Swine (Swine Flu )'
    ];
    List transformWord(String word) {
      List<String> name = word.split(' ');
      List<Text> textWidgets = [];
      for (int i = 0; i < name.length; i++) {
        if (name[i].contains('Flu')) {
          Text bold = Text(name[i] + ' ',
              style: KTextStyle.regularText.copyWith(
                  color: _darkTheme ? KColor.white : KColor.maastrichtBlue,
                  fontWeight: FontWeight.w600));
          textWidgets.add(bold);
        } else {
          Text normal = Text(name[i] + ' ',
              style: KTextStyle.regularText.copyWith(
                  color: _darkTheme ? KColor.white : KColor.maastrichtBlue,
                  fontWeight: FontWeight.w400));
          textWidgets.add(normal);
        }
      }
      return textWidgets;
    }

    return Scaffold(
      appBar: const KAppBar(
        title: 'Ask Free Question',
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.only(left: 24, right: 24, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSelected
                  ? Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: Text(
                        'Pregnancy',
                        style: KTextStyle.regular.copyWith(
                            color: _darkTheme
                                ? KColor.white
                                : KColor.maastrichtBlue,
                            fontSize: 24),
                      ),
                    )
                  : Container(),
              KTextField(
                isReadOnly: false,
                hintText: 'Search Question',
                hasPrefixIcon: true,
                controller: searchController,
                suffixIcon: isButtonActive
                    ? Container(
                        padding: const EdgeInsets.all(13),
                        margin: const EdgeInsets.only(top:1),
                        child: const Image(
                          image: AssetImage(AssetPath.search),
                          width: 20,
                          height: 20,
                        ))
                    : null,
                prefixIcon: isButtonActive
                    ? null
                    : Container(
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
              isButtonActive
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        textList.length,
                        (index) => Wrap(
                          children: <Widget>[
                            ...transformWord(
                              textList[index],
                            ),
                            const SizedBox(
                              height: 45,
                            )
                          ],
                        ),
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isSelected
                            ? Container(
                                margin: const EdgeInsets.only(top: 6),
                                child: const Questions(),
                              )
                            : Text('Popular Topic’s',
                                style: KTextStyle.normal.copyWith(
                                    color: _darkTheme
                                        ? KColor.white
                                        : KColor.maastrichtBlue,
                                    fontSize: 20)),
                        SizedBox(height: KSize.getHeight(context, 20)),
                        isSelected
                            ? Container()
                            : Wrap(
                                spacing: 10,
                                children: [
                                  for (var items in popularTopicList)
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isSelected = !isSelected;
                                        });
                                      },
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 20),
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 10,
                                            bottom: 10),
                                        decoration: BoxDecoration(
                                            color: _darkTheme
                                                ? KColor.darkblack
                                                : KColor.white,
                                            border: Border.all(
                                                color: _darkTheme
                                                    ? KColor.darkBorder
                                                    : KColor.border),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Text(
                                          items,
                                          style: KTextStyle.regular.copyWith(
                                              fontSize: 14,
                                              color: _darkTheme
                                                  ? KColor.white
                                                  : KColor.maastrichtBlue),
                                        ),
                                      ),
                                    )
                                ],
                              )
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
