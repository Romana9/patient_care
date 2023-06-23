import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/constants/asset_path.dart';
import 'package:saviorcare/controller/cubit/cubit/patient_cubit.dart';
import 'package:saviorcare/views/global_components/k_app_bar.dart';
import 'package:saviorcare/views/global_components/k_button.dart';
import 'package:saviorcare/views/global_components/k_text_field.dart';
import 'package:saviorcare/views/styles/b_style.dart';

import '../../../controller/theme.dart';
import '../../../controller/theme/them_notifier.dart';
import 'confirmation_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen(
      {Key? key,
      required this.name,
      required this.image,
      required this.designation})
      : super(key: key);
  final String name;
  final AssetImage image;
  final String designation;

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  List imageList = [
    {'id': 1, 'image': const AssetImage(AssetPath.add)},
    {'id': 2, 'image': const AssetImage(AssetPath.miniMastercard)},
    {'id': 3, 'image': const AssetImage(AssetPath.paypal)},
    {'id': 4, 'image': const AssetImage(AssetPath.apple)},
  ];
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return BlocConsumer<PatientCubit, PatientState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: const KAppBar(title: 'Payment'),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              margin: const EdgeInsets.only(left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Confirm Payment',
                    style: KTextStyle.normal.copyWith(
                        color:
                            _darkTheme ? KColor.white : KColor.maastrichtBlue,
                        fontSize: 24),
                  ),
                  SizedBox(
                    height: KSize.getHeight(context, 30),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    height: KSize.getHeight(context, 144),
                    width: KSize.getWidth(context, double.infinity),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color:
                                _darkTheme ? KColor.darkBorder : KColor.border),
                        borderRadius: BorderRadius.circular(20),
                        color: _darkTheme ? KColor.darkblack : KColor.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image(
                                  image: widget.image,
                                  height: 50,
                                  width: 50,
                                ),
                                SizedBox(
                                  width: KSize.getWidth(context, 14),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.name,
                                      style: KTextStyle.normal.copyWith(
                                          fontSize: 18,
                                          color: _darkTheme
                                              ? KColor.white
                                              : KColor.maastrichtBlue),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          widget.designation,
                                          style: KTextStyle.regularText
                                              .copyWith(
                                                  fontSize: 14,
                                                  color: _darkTheme
                                                      ? KColor.darkdimgray
                                                      : KColor.dimgray),
                                        ),
                                        SizedBox(
                                          width: KSize.getWidth(context, 10),
                                        ),
                                        Text(
                                          '4.0',
                                          style: KTextStyle.regular.copyWith(
                                              fontSize: 12,
                                              color: KColor.orange),
                                        ),
                                        SizedBox(
                                          width: KSize.getWidth(context, 2),
                                        ),
                                        const Image(
                                          image:
                                              AssetImage(AssetPath.ratingStar),
                                          height: 12,
                                          width: 12,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '100 EG',
                                  style: KTextStyle.normal.copyWith(
                                      fontSize: 18,
                                      color: _darkTheme
                                          ? KColor.white
                                          : KColor.maastrichtBlue),
                                ),
                                Text(
                                  '/fee',
                                  style: KTextStyle.regularText.copyWith(
                                      fontSize: 14,
                                      color: _darkTheme
                                          ? KColor.darkdimgray
                                          : KColor.dimgray),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: KSize.getHeight(context, 20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'September 11, Tuesday',
                              style: KTextStyle.regular.copyWith(
                                  fontSize: 14,
                                  color: _darkTheme
                                      ? KColor.white
                                      : KColor.maastrichtBlue),
                            ),
                            Text(
                              '12.30 PM',
                              style: KTextStyle.regular.copyWith(
                                  fontSize: 14,
                                  color: _darkTheme
                                      ? KColor.white
                                      : KColor.maastrichtBlue),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: KSize.getHeight(context, 30),
                  ),
                  Text(
                    'Payment Method',
                    style: KTextStyle.normal.copyWith(
                        color:
                            _darkTheme ? KColor.white : KColor.maastrichtBlue,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: KSize.getHeight(context, 20),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _darkTheme
                          ? const Image(
                              image: AssetImage(AssetPath.darkadd),
                              height: 67,
                              width: 47)
                          : const Image(
                              image: AssetImage(AssetPath.add),
                              height: 67,
                              width: 47),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        height: 67,
                        width: 80,
                        margin: const EdgeInsets.only(left: 3),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: KColor.mediumslateblue),
                            borderRadius: BorderRadius.circular(14)),
                        child: const Center(
                          child: Image(
                            image: AssetImage(AssetPath.mastercard),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 26, right: 26),
                        height: 67,
                        width: 80,
                        margin: const EdgeInsets.only(left: 7),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: KColor.border),
                            borderRadius: BorderRadius.circular(14)),
                        child: const Center(
                          child: Image(
                            image: AssetImage(AssetPath.paypal),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 26, right: 26),
                        margin: const EdgeInsets.only(left: 7),
                        height: 67,
                        width: 80,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: KColor.border),
                            borderRadius: BorderRadius.circular(14)),
                        child: Center(
                          child: Image(
                            image: const AssetImage(AssetPath.apple),
                            color: _darkTheme ? KColor.white : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: KSize.getHeight(context, 30),
                  ),
                  Text(
                    'Name',
                    style: KTextStyle.regularText.copyWith(
                        color: _darkTheme
                            ? KColor.darkdimgray
                            : const Color.fromARGB(255, 18, 18, 20),
                        fontSize: 14),
                  ),
                  SizedBox(
                    height: KSize.getHeight(context, 16),
                  ),
                  KTextField(
                    isheightChanged: true,
                    height: 60,
                    hintText: 'Name',
                    borderRadius: 16,
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: KSize.getHeight(context, 30),
                  ),
                  Text(
                    'Card Number',
                    style: KTextStyle.regularText.copyWith(
                        color: _darkTheme ? KColor.darkdimgray : KColor.dimgray,
                        fontSize: 14),
                  ),
                  SizedBox(
                    height: KSize.getHeight(context, 16),
                  ),
                  KTextField(
                    isheightChanged: true,
                    height: 60,
                    isCardFiled: true,
                    hintText: 'Card Number',
                    borderRadius: 16,
                    textInputType: TextInputType.text,
                    suffixIcon: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Image(
                        image: AssetImage(AssetPath.miniMastercard),
                        width: 25,
                        height: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: KSize.getHeight(context, 30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CVV',
                            style: KTextStyle.regularText.copyWith(
                                color: _darkTheme
                                    ? KColor.darkdimgray
                                    : KColor.dimgray,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: KSize.getHeight(context, 16),
                          ),
                          KTextField(
                            leftPadding: true,
                            isheightChanged: true,
                            iswidthChanged: true,
                            height: 60,
                            width: 150,
                            hintText: 'CVV',
                            borderRadius: 16,
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ex',
                            style: KTextStyle.regularText.copyWith(
                                color: _darkTheme
                                    ? KColor.darkdimgray
                                    : KColor.dimgray,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: KSize.getHeight(context, 16),
                          ),
                          KTextField(
                            leftPadding: true,
                            isheightChanged: true,
                            iswidthChanged: true,
                            height: 60,
                            width: 150,
                            hintText: 'Ex',
                            borderRadius: 16,
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: KSize.getHeight(context, 50),
                  ),
                  Center(
                      child: KButton(
                          onPressedCallback: () async {
                            await PatientCubit.get(context)
                                .addNotification(heading: widget.name);
                            await PatientCubit.get(context).addupcoming(
                                image: widget.image,
                                name: widget.name,
                                designation: widget.designation);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        const ConfirmationScreen()));
                          },
                          text: 'Pay Now',
                          color: KColor.mediumslateblue,
                          textColor: KColor.white))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
