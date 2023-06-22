import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/constants/asset_path.dart';
import 'package:saviorcare/views/styles/b_style.dart';

import '../../../../controller/theme.dart';
import '../../../../controller/theme/them_notifier.dart';

class Questions extends StatefulWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  List questionsList = [
    {'questions': '1. Am i pregnant?', 'isSelected': false},
    {'questions': '2. When do pregnancy cravings start?', 'isSelected': false},
    {
      'questions': '3. What prenatal vitamins should i take?',
      'isSelected': false
    },
    {'questions': '4. How do I stay fit in pregnancy?', 'isSelected': false},
    {'questions': '5. How should I sleep in pregnancy?', 'isSelected': false},
    {
      'questions': '6. What happens in an antenatal class?',
      'isSelected': false
    },
    {
      'questions': '7. What are the different types\nof breast pump?',
      'isSelected': false
    },
    {
      'questions': '8. Which type of baby bottle should\ni buy?',
      'isSelected': false
    },
    {'questions': '9. What is a birth plan?', 'isSelected': false},
  ];
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Column(
        children: List.generate(questionsList.length, (index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                questionsList[index]['isSelected'] =
                    !questionsList[index]['isSelected'];
                print(questionsList[index]);
              });
            },
            child: Container(
              margin: EdgeInsets.only(
                  top: questionsList[index]['questions'] == '1. Am i pregnant?'? 0 : 20, bottom: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    children: [
                      Text(questionsList[index]['questions'],
                          style: KTextStyle.regular.copyWith(
                              color: _darkTheme
                                  ? KColor.white
                                  : KColor.maastrichtBlue)),
                    ],
                  ),
                  questionsList[index]['isSelected']
                      ? const Image(
                          image: AssetImage(AssetPath.arrowUp),
                          height: 6,
                          width: 12)
                      : const Image(
                          image: AssetImage(AssetPath.arrowDown),
                          height: 6,
                          width: 12)
                ],
              ),
            ),
          ),
          questionsList[index]['isSelected']
              ? Container(
                  margin: const EdgeInsets.only(top: 14),
                  child: Wrap(
                    children: [
                      Text(
                        'Keeping active and doing exercise while you\'re pregnant is great for you and your baby. You can keep up your normal level of daily activity and exercise regime, as long as it still feels comfortable.',
                        style: KTextStyle.regularText.copyWith(
                            color: _darkTheme
                                ? KColor.darkdimgray
                                : KColor.dimgray,
                            fontSize: 14,
                            height: 2),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: Text(
                          'Tips for exercising\nYou should be able to hold a conversation while you exercise.',
                          style: KTextStyle.regularText.copyWith(
                              color: _darkTheme
                                  ? KColor.darkdimgray
                                  : KColor.dimgray,
                              fontSize: 14,
                              height: 2),
                        ),
                      ),
                      Text(
                          'Always warm up and cool down to keep you from pulling any muscles.',
                          style: KTextStyle.regularText.copyWith(
                              color: _darkTheme
                                  ? KColor.darkdimgray
                                  : KColor.dimgray,
                              fontSize: 14,
                              height: 2)),
                      Text(
                          'Stay hydrated - drink lots of water.\nYou can find online workouts that are safe during pregnancy, check out Sport England\'s #StayInWorkOut exercises (scroll to the pregnancy section).Other good activities to try while pregnant include walking, yoga, pilates, aerobics and pelvic floor exercises.',
                          style: KTextStyle.regularText.copyWith(
                              color: _darkTheme
                                  ? KColor.darkdimgray
                                  : KColor.dimgray,
                              fontSize: 14,
                              height: 2))
                    ],
                  ),
                )
              : Container(
                  height: 1,
                  color: _darkTheme ? KColor.darkBorder : KColor.border,
                  //margin: const EdgeInsets.only(top: 14, bottom: 20),
                )
        ],
      );
    }));
  }
}
