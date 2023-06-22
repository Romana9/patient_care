import 'package:flutter/material.dart';
import 'package:saviorcare/constants/asset_path.dart';
import 'package:saviorcare/views/styles/b_style.dart';

class ImageList extends StatefulWidget {
  const ImageList({Key? key}) : super(key: key);

  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  List imageList = [
    {'image': const AssetImage(AssetPath.brainIcon),'id':1},
    {'image': const AssetImage(AssetPath.toothIcon),'id':2},
    {'image': const AssetImage(AssetPath.eyeIcon),'id':3},
    {'image': const AssetImage(AssetPath.boneIcon),'id':4},
    {'image': const AssetImage(AssetPath.vegetableIcon),'id':5}
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Wrap(children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(imageList.length, (int index) {
              return Container(
                padding:const EdgeInsets.all(18) ,
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color:imageList[index]['id']==1?KColor.lavebderBlush:imageList[index]['id']==2?KColor.seashell:imageList[index]['id']==3?KColor.whiteLight:imageList[index]['id']==4?KColor.whiteSmoke:KColor.beige,
                  borderRadius: BorderRadius.circular(50)
                ),
                margin: const EdgeInsets.only(right: 20),
                child: Center(
                  child: Image(
                    image: imageList[index]['image'],
                    
                  ),
                ),
              );
            })),
      ]),
    );
  }
}
