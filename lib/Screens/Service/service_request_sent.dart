import 'package:app/Controllers/app_controller.dart';
import 'package:app/DTOs/Profile/requestRetrieveUserPassword.dart';
import 'package:app/Resources/strings.dart';
import 'package:app/Screens/Auth/login.dart';
import 'package:app/Screens/Main/home.dart';
import 'package:app/Theme/app_theme.dart';
import 'package:app/Utilities/Go.dart';
import 'package:app/Utilities/assets.dart';
import 'package:app/Utilities/screens_bg.dart';
import 'package:app/Utilities/transform_direction.dart';
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

class ServiceRequestSentScreen extends StatelessWidget {
  static const routeName = '/ServiceRequestSentScreen';
  ServiceRequestSentScreen({Key? key, String? mail}) : super(key: key);

  String? mail;

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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: backgroundBoxDecoration(
          Assets.bgScreen6,
          boxFit: BoxFit.cover,
          color: Theme.of(context).colorScheme.background,
          alignment: Alignment.bottomCenter,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 300.0,
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: _bodyUi(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodyUi(BuildContext context) {
    return Column(
      children: [
        FxText.displaySmall(
          Get.arguments?['title'] ?? AT1Strings.ServiceRequestSentSuccess.tr,
          fontWeight: 600,
          fontSize: 23,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontFamily: AppTheme.fontAVGARDD,
            fontSize: 25,
          ),
        ),
        FxSpacing.height(10),
        FxText.bodySmall(
          Get.arguments?['message'] ??
              AT1Strings.ServiceRequestSentSuccessContent.tr,
          textAlign: TextAlign.center,
          fontSize: 15,
          style: TextStyle(
            fontFamily: AppTheme.fontVisbyCF,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        Lottie.asset(
          Assets.successfulLottie,
          width: 400,
          height: 300,
          fit: BoxFit.cover,
          repeat: true,
        ),
        FxSpacing.height(20),
        backBtn(context),
      ],
    );
  }

  Widget backBtn(BuildContext context) {
    return FxButton.block(
      backgroundColor: Theme.of(context).primaryColor,
      padding: FxSpacing.y(12),
      onPressed: () async {
        Get.offAllNamed(HomeScreen.routeName);
      },
      elevation: 0,
      borderRadiusAll: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FxText.bodySmall(
            AT1Strings.Continue.tr.toUpperCase(),
            fontWeight: 700,
            letterSpacing: 0.5,
            style: TextStyle(
              fontFamily: AppTheme.fontVisbyCF,
              color: Colors.white,
            ),
          ),
          FxSpacing.width(8),
          TransformWithDirection(
              context,
              Icon(
                FeatherIcons.chevronRight,
                size: 18,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
