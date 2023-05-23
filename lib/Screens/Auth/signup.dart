import 'package:app/Controllers/app_controller.dart';
import 'package:app/DTOs/Authentication/signup.dart';
import 'package:app/Resources/strings.dart';
import 'package:app/Screens/Auth/login.dart';
import 'package:app/Screens/Main/home.dart';
import 'package:app/Utilities/Go.dart';
import 'package:app/Utilities/screens_bg.dart';
import 'package:app/Utilities/transform_direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../Controllers/authentication_controller.dart';
import '../../DTOs/Authentication/login.dart';
import '../../Enums/Shared/keys.dart';
import '../../Models/Shared/message_exception.dart';
import '../../Utilities/assets.dart';
import '../../Utilities/logger.dart';
import '../../Utilities/progress_indicator.dart';
import '../../Utilities/snackbars.dart';
import '../Shared/content.dart';

class SignupScreen extends StatelessWidget {
  static const routeName = '/Signup';
  SignupScreen({Key? key}) : super(key: key);

  final _appController = Get.find<AppController>();
  final _authController = Get.find<AuthenticationController>();

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();

  OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(
      color: Colors.black54,
    ),
  );

  InputBorder inputBorder = const OutlineInputBorder(
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
        decoration: backgroundBoxDecoration(
            Assets.bgScreen2,
            boxFit: BoxFit.contain,
            color: Theme.of(context).colorScheme.background
        ),
        child: Column(
          children: [
            const SizedBox(height: 120.0,),
            Padding(
              padding: const EdgeInsets.all(30),
              child: _loginForm(context),
            ),
          ],
        ),
      )
    );
  }

  Widget _loginForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 100,),
          Container(
            width: Get.width,
            child: FxText.displaySmall(
              AT1Strings.signUpTitle.tr,
              fontWeight: 600,
              color: Theme.of(context).colorScheme.secondary,
              textDirection: getCurrentTextDirection(context),
            ),
          ),
          FxSpacing.height(20),
          nameField(context),
          FxSpacing.height(20),
          emailField(context),
          FxSpacing.height(20),
          Obx(() => Directionality(
              textDirection: TextDirection.ltr,
              child: IntlPhoneField(
                controller: _mobileController,
                style: const TextStyle(color: Colors.black54),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      color: Colors.black54,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      color: Colors.black54,
                    ),
                  ),
                  labelText: AT1Strings.signUpMobile.tr,
                  labelStyle: TextStyle(color: Colors.black54),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      color: Colors.black54,
                    ),
                  ),
                ),
                initialCountryCode: _appController.countryCode.value,
                disableLengthCheck: true,
                textInputAction: TextInputAction.next,
                onChanged: (phone) {},
                onCountryChanged: (country) {
                  _appController.countryCode.value = country.code;
                  _appController.dialCode.value = country.dialCode;
                },
              )
          )),
          FxSpacing.height(20),
          passwordField(context),
          FxSpacing.height(20),
          SignupBtn(context),
          FxSpacing.height(20),
          termsAndConditionsWidget(context),
          FxSpacing.height(30),
          signInBtn(context),
        ],
      ),
    );
  }

  Widget nameField(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: TextFormField(
          style: FxTextStyle.bodyMedium(),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: AT1Strings.signUpName.tr,
            hintStyle: FxTextStyle.bodyMedium(),
            border: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            prefixIcon: Icon(
              FeatherIcons.user,
              size: 22,
              color: Theme.of(context).colorScheme.primary,
            ),
            isDense: true,
            contentPadding: const EdgeInsets.all(0),
          ),
          controller: _nameController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.sentences,
        )
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
        )
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
          textCapitalization: TextCapitalization.sentences,
          cursorColor: Theme.of(context).colorScheme.primary,
        )
    ));
  }

  SignupDTO _generateDTO() {
    return SignupDTO(
      name: _nameController.text,
      email: _emailController.text.toLowerCase(),
      phone: '${_appController.dialCode.value}${_mobileController.text}',
      password: _passwordController.text,
    );
  }

  Widget SignupBtn(BuildContext context) {
    return FxButton.block(
      backgroundColor: Theme.of(context).primaryColor,
      padding: FxSpacing.y(12),
      onPressed: () async {
        try {
          FocusScope.of(context).unfocus();
          ProgressIndicators.loadingDialog();
          Debug.d(_appController.countryCode.value);
          final dto = _generateDTO();
          Debug.d(dto.toJson());
          await _authController.signUp(dto);
          Get.offAllNamed(HomeScreen.routeName);
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
              AT1Strings.signUp.tr.toUpperCase(),
              color: Colors.white,
              fontWeight: 700,
              letterSpacing: 0.5
          ),
          FxSpacing.width(8),
          TransformWithDirection(context, Icon(
              FeatherIcons.chevronRight,
              size: 18,
              color: Colors.white
          ))
        ],
      ),
    );
  }

  Widget termsAndConditionsWidget(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(ContentScreen.routeName, arguments: {
        Keys.title : AT1Strings.settingsTermsConditions.tr,
        Keys.content: _appController.settings.value?.terms
      }),
      child: RichText(
          text: TextSpan(
              children: <TextSpan>[
                TextSpan(text: AT1Strings.signUpByClicking.tr, style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
                const TextSpan(text: '  '),
                TextSpan(text: AT1Strings.settingsTermsConditions.tr, style: TextStyle(color: Theme.of(context).primaryColor)),
              ]
          )
      ),
    );
  }

  Widget signInBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Go.off(() => LoginScreen());
      },
      child: RichText(
          text: TextSpan(
              children: <TextSpan>[
                TextSpan(text: AT1Strings.signUpAlreadyHaveAccount.tr, style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
                const TextSpan(text: '  '),
                TextSpan(text: AT1Strings.signIn.tr, style: TextStyle(color: Theme.of(context).primaryColor)),
              ]
          )
      ),
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
              color: Theme.of(context).colorScheme.secondary,
            ),
          )
        ),
    );
  }

}
