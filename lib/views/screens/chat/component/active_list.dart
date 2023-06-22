import 'package:flutter/material.dart';
import 'package:saviorcare/constants/asset_path.dart';

class ActiveList extends StatelessWidget {
  const ActiveList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List doctorsList = [
      {
        'image': const AssetImage(AssetPath.elizabeth),
      },
      {
        'image': const AssetImage(AssetPath.girl2),
      },
      {
        'image': const AssetImage(AssetPath.boy1),
      },
      {
        'image': const AssetImage(AssetPath.boy2),
      },
      {
        'image': const AssetImage(AssetPath.boy3),
      },
      {
        'image': const AssetImage(AssetPath.boy4),
      },
    ];
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Wrap(children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(doctorsList.length, (int index) {
              return Stack(
                children: [
                  SizedBox(
                    height: 58,
                    width: 58,
                    child: Center(
                      child: Image(
                          image: doctorsList[index]['image'],
                          height: 50,
                          width: 50),
                    ),
                  ),
                  const Positioned(
                      top: 43,
                      left: 43,
                      child: Image(
                        image: AssetImage(AssetPath.activeDot),
                        height: 8,
                        width: 8,
                      ))
                ],
              );
            })),
      ]),
    );
  }
}
