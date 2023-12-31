import 'package:app/Controllers/app_controller.dart';
import 'package:app/Resources/strings.dart';
import 'package:app/Screens/Auth/signup.dart';
import 'package:app/Screens/Main/home.dart';
import 'package:app/Theme/app_theme.dart';
import 'package:app/Utilities/assets.dart';
import 'package:app/Utilities/helpers.dart';
import 'package:app/Utilities/screens_bg.dart';
import 'package:app/Utilities/transform_direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controllers/authentication_controller.dart';
import '../../DTOs/Authentication/login.dart';
import '../../Models/Shared/message_exception.dart';
import '../../Utilities/Go.dart';
import '../../Utilities/logger.dart';
import '../../Utilities/progress_indicator.dart';
import '../../Utilities/snackbars.dart';
import '../Profile/forget_password.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/Login';
  LoginScreen({Key? key}) : super(key: key);

  final _appController = Get.find<AppController>();
  final _authController = Get.find<AuthenticationController>();

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: Get.width,
        decoration: backgroundBoxDecoration(
          Assets.bgScreen1,
          boxFit: BoxFit.cover,
          color: Theme.of(context).colorScheme.background,
          alignment: Alignment.bottomCenter,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 200.0,
            ),
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
          const SizedBox(
            height: 100,
          ),
          Container(
            width: Get.width,
            child: FxText.displaySmall(
              AT1Strings.signInTitle.tr,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: Helpers.isRtl()
                    ? GoogleFonts.almarai().fontFamily
                    : AppTheme.fontAVGARDD,
                fontSize: AppTheme.fontAVGARDDSize,
              ),
              color: Theme.of(context).colorScheme.secondary,
              textDirection: getCurrentTextDirection(context),
            ),
          ),
          FxSpacing.height(20),
          emailField(context),
          FxSpacing.height(20),
          passwordField(context),
          FxSpacing.height(15),
          forgotPassword(context),
          FxSpacing.height(20),
          loginBtn(context),
          FxSpacing.height(50),
          signUpBtn(context),
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
        textInputAction: TextInputAction.next,
        textCapitalization: TextCapitalization.none,
        textDirection: TextDirection.ltr,
      ),
    );
  }

  Widget passwordField(BuildContext context) {
    return Obx(() => Directionality(
        textDirection: TextDirection.ltr,
        child: TextFormField(
          style: FxTextStyle.bodyMedium(),
          obscureText: _authController.showPassword.value ? false : true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: AT1Strings.signInPassword.tr,
            hintStyle: FxTextStyle.bodyMedium(),
            border: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            suffixIcon: InkWell(
                onTap: () {
                  _authController.updateShowPassword();
                },
                child: Icon(
                  _authController.showPassword.value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 20,
                )),
            prefixIcon: Icon(
              FeatherIcons.lock,
              size: 22,
              color: Theme.of(context).colorScheme.primary,
            ),
            isDense: true,
            contentPadding: const EdgeInsets.all(0),
          ),
          controller: _passwordController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          textCapitalization: TextCapitalization.none,
          cursorColor: Theme.of(context).colorScheme.primary,
        )));
  }

  Widget forgotPassword(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: FxButton.text(
        onPressed: () {
          Go.to(() => ForgetPasswordScreen());
        },
        elevation: 0,
        padding: FxSpacing.right(0),
        borderRadiusAll: 4,
        child: FxText.bodySmall(
          AT1Strings.signInForgotPassword.tr,
          color: Theme.of(context).colorScheme.secondary,
          style: TextStyle(
              fontFamily: Helpers.isRtl()
                  ? GoogleFonts.almarai().fontFamily
                  : AppTheme.fontVisbyCF),
        ),
      ),
    );
  }

  LoginDTO _generateDTO() {
    return LoginDTO(
      username: _emailController.text,
      password: _passwordController.text,
    );
  }

  Widget loginBtn(BuildContext context) {
    return FxButton.block(
      backgroundColor: Theme.of(context).primaryColor,
      padding: FxSpacing.y(12),
      onPressed: () async {
        FocusScope.of(context).unfocus();
        ProgressIndicators.loadingDialog();
        try {
          final dto = _generateDTO();
          await _authController.signIn(dto);
          Get.offAllNamed(HomeScreen.routeName);
        } on MessageException catch (error) {
          Debug.e(error);
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
            AT1Strings.signInTitle.tr.toUpperCase(),
            fontWeight: 700,
            letterSpacing: 0.5,
            style: TextStyle(
              fontFamily: Helpers.isRtl()
                  ? GoogleFonts.almarai().fontFamily
                  : AppTheme.fontVisbyCF,
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

  Widget signUpBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Go.off(() => SignupScreen());
      },
      child: RichText(
          text: TextSpan(
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontFamily: Helpers.isRtl()
                    ? GoogleFonts.almarai().fontFamily
                    : AppTheme.fontVisbyCF,
              ),
              children: <TextSpan>[
            TextSpan(
                text: AT1Strings.signInDontHaveAccount.tr,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                )),
            const TextSpan(text: '  '),
            TextSpan(
              text: AT1Strings.signUp.tr,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: Helpers.isRtl()
                    ? GoogleFonts.almarai().fontFamily
                    : AppTheme.fontVisbyCF,
              ),
            ),
          ])),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: GestureDetector(
            onTap: () {
              Get.offAllNamed(HomeScreen.routeName);
            },
            child: FxText.bodySmall(
              AT1Strings.skip.tr,
              fontSize: 15,
              fontWeight: 300,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: Helpers.isRtl()
                    ? GoogleFonts.almarai().fontFamily
                    : AppTheme.fontVisbyCF,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          )),
    );
  }
}
