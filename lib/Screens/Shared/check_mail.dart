import 'package:app/Controllers/app_controller.dart';
import 'package:app/DTOs/Profile/requestRetrieveUserPassword.dart';
import 'package:app/Enums/Shared/keys.dart';
import 'package:app/Resources/strings.dart';
import 'package:app/Screens/Auth/login.dart';
import 'package:app/Utilities/Go.dart';
import 'package:app/Utilities/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../Controllers/authentication_controller.dart';
import '../../Models/Shared/message_exception.dart';
import '../../Utilities/progress_indicator.dart';
import '../../Utilities/snackbars.dart';

class CheckMailScreen extends StatelessWidget {
  static const routeName = '/CheckMail';
  CheckMailScreen({Key? key}) : super(key: key);

  final _appController = Get.find<AppController>();

  OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(
      color: Colors.black54,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.all(30),
            child: _bodyUi(context),
          ),
        ],
      ),
    );
  }

  Widget _bodyUi(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50,),
        FxText.displaySmall(
          AT1Strings.CheckMail.tr,
          fontWeight: 600,
          textAlign: TextAlign.center,
          fontSize: 20,
          color: Theme.of(context).colorScheme.secondary,
        ),
        FxSpacing.height(10),
        FxText.bodySmall(
          '${AT1Strings.CheckMailWeHaveSent.tr} \n ${Get.arguments?[Keys.email]}',
          textAlign: TextAlign.center,
          fontSize: 18,
          color: Theme.of(context).colorScheme.secondary,
        ),
        Lottie.asset(
          Assets.successfulLottie,
          width: 400,
          height:  300,
          fit: BoxFit.cover,
          repeat: true,
        ),
        FxSpacing.height(50),
        retrieveBtn(context),
        FxSpacing.height(50),
        backBtn(context),
      ],
    );
  }

  Widget retrieveBtn(BuildContext context) {
    return FxButton.block(
      backgroundColor: Theme.of(context).primaryColor,
      padding: FxSpacing.y(12),
      onPressed:  () {
        Go.off(() => LoginScreen());
      },
      elevation: 0,
      borderRadiusAll: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FxText.bodySmall(
              AT1Strings.CheckMailOpenYourEmail.tr.toUpperCase(),
              color: Colors.white,
              fontWeight: 700,
              letterSpacing: 0.5
          ),
        ],
      ),
    );
  }

  Widget backBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Go.off(() => LoginScreen());
      },
      child: Text(
          AT1Strings.CheckMailBackToLogin.tr,
          style: TextStyle(color: Theme.of(context).colorScheme.secondary)
      ),
    );
  }

}
