import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/views/global_components/k_button.dart';
import 'package:saviorcare/views/global_components/k_text_field.dart';
import 'package:saviorcare/views/styles/b_style.dart';

import '../../../../controller/theme.dart';
import '../../../../controller/theme/them_notifier.dart';
import '../../../global_components/k_app_bar.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool isButtonActive = false;
  var hidePassword = true;
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    confirmPasswordController = TextEditingController();
    confirmPasswordController.addListener(() {
      final isButtonActive = confirmPasswordController.text.isNotEmpty;
      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
  }

  @override
  void dispose() {
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      
      appBar: const KAppBar(title: 'Change Password'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: KSize.getHeight(context, 60),
              ),
              Text(
                'Old Password',
                style: KTextStyle.regularText.copyWith(color:_darkTheme?KColor.darkdimgray: KColor.dimgray),
              ),
              SizedBox(
                height: KSize.getHeight(context, 16),
              ),
              KTextField(

                isheightChanged: true,
                height: 60,
                controller: oldPasswordController,
                hintText: 'Type here',
                borderRadius: 16,
                textInputType: TextInputType.visiblePassword,
              ),
              
              SizedBox(
                height: KSize.getHeight(context, 30),
              ),
              Text(
                'New Password',
                style: KTextStyle.regularText.copyWith(color:_darkTheme?KColor.darkdimgray: KColor.dimgray),
              ),
              SizedBox(
                height: KSize.getHeight(context, 16),
              ),
              KTextField(
                isheightChanged: true,
                height: 60,
                controller: newPasswordController,
                hintText: 'Type here',
                borderRadius: 16,
                textInputType: TextInputType.visiblePassword,
              ),
              
              SizedBox(
                height: KSize.getHeight(context, 30),
              ),
              Text(
                'Confirm Password',
                style: KTextStyle.regularText.copyWith(color:_darkTheme?KColor.darkdimgray: KColor.dimgray),
              ),
              SizedBox(
                height: KSize.getHeight(context, 16),
              ),
              KTextField(
                isheightChanged: true,
                height: 60,
                controller: confirmPasswordController,
                hintText: 'Type here',
                borderRadius: 16,
                textInputType: TextInputType.visiblePassword,
              ),
              
              SizedBox(height: KSize.getHeight(context, 268)),
              Center(
                  child: KButton(
                    onPressedCallback: () {
                Navigator.pop(context);
              },
                      text: 'Save',
                      textColor: isButtonActive? KColor.white:KColor.white.withOpacity(0.2),
                      color: isButtonActive
                          ? KColor.mediumslateblue
                          : KColor.mediumslateblue.withOpacity(0.5)))
            ],
          ),
        ),
      ),
    );
  }
}
