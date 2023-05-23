import 'package:app/Controllers/app_controller.dart';
import 'package:app/Resources/strings.dart';
import 'package:app/Screens/Main/home.dart';
import 'package:app/Utilities/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class NotificationsScreen extends StatelessWidget {
  static const routeName = '/NotificationsScreen';
  NotificationsScreen({Key? key}) : super(key: key);

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
      appBar: AppBar(
        title: Text(AT1Strings.Notifications.tr,
            style: TextStyle(color: Theme.of(context).colorScheme.secondary)
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.secondary),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
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
        const SizedBox(height: 100.0,),
        FxText.displaySmall(
          AT1Strings.NotificationsStay.tr,
          fontWeight: 600,
          textAlign: TextAlign.center,
          color: Theme.of(context).colorScheme.secondary,
        ),
        Lottie.asset(
          Assets.healthyLottie,
          width: 400,
          height:  300,
          fit: BoxFit.cover,
          repeat: true,
        ),
        FxSpacing.height(30),
        FxText.bodySmall(
          AT1Strings.NotificationsNoContent.tr,
          textAlign: TextAlign.center,
          fontSize: 20,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ],
    );
  }

  Widget backBtn(BuildContext context) {
    return FxButton.block(
        backgroundColor: Theme.of(context).primaryColor,
        padding: FxSpacing.y(12),
        onPressed:  () async {
          Get.offAllNamed(HomeScreen.routeName);
        },
        elevation: 0,
        borderRadiusAll: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FxText.bodySmall(
                AT1Strings.Continue.tr.toUpperCase(),
                color: Colors.white,
                fontWeight: 700,
                letterSpacing: 0.5
            ),
            FxSpacing.width(8),
            const Icon(
              FeatherIcons.chevronRight,
              size: 18,
            )
          ],
        ),
    );
  }

}
