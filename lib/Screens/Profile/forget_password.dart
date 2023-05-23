import 'package:app/Controllers/app_controller.dart';
import 'package:app/DTOs/Profile/requestRetrieveUserPassword.dart';
import 'package:app/Enums/Shared/keys.dart';
import 'package:app/Resources/strings.dart';
import 'package:app/Screens/Auth/login.dart';
import 'package:app/Screens/Shared/check_mail.dart';
import 'package:app/Utilities/Go.dart';
import 'package:app/Utilities/assets.dart';
import 'package:app/Utilities/logger.dart';
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
import '../../Utilities/screens_bg.dart';
import '../../Utilities/snackbars.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const routeName = '/ForgetPassword';
  ForgetPasswordScreen({Key? key}) : super(key: key);

  final _appController = Get.find<AppController>();
  final _authController = Get.find<AuthenticationController>();

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

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
      body: SafeArea(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: backgroundBoxDecoration(
            Assets.bgScreen3,
            boxFit: BoxFit.contain,
            color: Theme.of(context).colorScheme.background,
        ),
        child: Column(
          children: [
            const SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.all(30),
              child: _loginForm(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 200,),
          Image.asset(Assets.lock, height: 100,),
          FxText.displaySmall(
            AT1Strings.forgetPass.tr,
            fontWeight: 600,
            textAlign: TextAlign.center,
            color: Theme.of(context).colorScheme.secondary,
          ),
          FxSpacing.height(10),
          FxText.bodySmall(
            AT1Strings.forgetPassToReset.tr,
            textAlign: TextAlign.center,
            fontSize: 15,
            color: Theme.of(context).colorScheme.secondary,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 40),
          //   child: Lottie.asset(
          //     Assets.profileForgetPasswordLottie,
          //     width: 400,
          //     height:  300,
          //     fit: BoxFit.cover,
          //     repeat: true,
          //   ),
          // ),
          FxSpacing.height(20),
          emailField(context),
          FxSpacing.height(20),
          retrieveBtn(context),
          FxSpacing.height(50),
          backBtn(context),
        ],
      ),
    );
  }

  Widget emailField(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: TextFormField(
          style: FxTextStyle.bodyMedium(),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: AT1Strings.signInEmail.tr,
            hintStyle: FxTextStyle.bodyMedium(),
            border: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            prefixIcon: Icon(
              FeatherIcons.mail,
              size: 22,
              color: Theme.of(context).colorScheme.primary,
            ),
            isDense: true,
            contentPadding: const EdgeInsets.all(0),
          ),
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          textCapitalization: TextCapitalization.none,
        )
    );
  }

  RequestRetrieveUserPasswordDTO _generateDTO() {
    return RequestRetrieveUserPasswordDTO(
      username: _emailController.text,
    );
  }

  Widget retrieveBtn(BuildContext context) {
    return FxButton.block(
      backgroundColor: Theme.of(context).primaryColor,
      padding: FxSpacing.y(12),
      onPressed:  () async {
        FocusScope.of(context).unfocus();
        ProgressIndicators.loadingDialog();
        try {
          final dto = _generateDTO();
          Debug.d(dto.toJson());
          await _authController.requestRetrieveUserPassword(dto);
          //Go to check your mail screen
          Get.offAllNamed(
              CheckMailScreen.routeName,
              arguments: { Keys.email: _emailController.text.toLowerCase() },
          );
        } on MessageException catch (error) {
          Get.back();
          Snackbars.danger(error.message);
        }
      },
      elevation: 0,
      borderRadiusAll: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FxText.bodySmall(
              AT1Strings.forgetPassReset.tr.toUpperCase(),
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
      onTap: () => Get.offAllNamed(LoginScreen.routeName),
      child: Text(
          AT1Strings.backLogin.tr,
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
          )
      ),
    );
  }

}
