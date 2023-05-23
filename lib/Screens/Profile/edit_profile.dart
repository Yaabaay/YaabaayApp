import 'package:app/DTOs/Profile/edit_profile.dart';
import 'package:app/Resources/strings.dart';
import 'package:app/Screens/Main/home.dart';
import 'package:app/Utilities/assets.dart';
import 'package:app/Utilities/logger.dart';
import 'package:app/Utilities/transform_direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../Controllers/app_controller.dart';
import '../../Controllers/authentication_controller.dart';
import '../../Models/Shared/message_exception.dart';
import '../../Utilities/progress_indicator.dart';
import '../../Utilities/screens_bg.dart';
import '../../Utilities/snackbars.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = '/EditProfileScreen';
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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

  @override
  void initState() {
    super.initState();
    _nameController.text = _authController.user!.name;
    _emailController.text = _authController.user!.email;
    _mobileController.text = _authController.user?.mobile ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: TransformWithDirection(
            context,
            Icon(
              FeatherIcons.chevronLeft,
              size: 20,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        elevation: 0,
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
            child: _loginForm(context),
          ),
        ],
      ),
    ));
  }

  Widget _loginForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          FxSpacing.height(20),
          avatarSection(),
          FxSpacing.height(20),
          nameField(),
          FxSpacing.height(20),
          emailField(),
          FxSpacing.height(20),
          Obx(() => Directionality(
              textDirection: TextDirection.ltr,
              child: IntlPhoneField(
                enabled: false,
                controller: _mobileController,
                style: const TextStyle(color: Colors.black54),
                decoration: const InputDecoration(
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
                  //labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      color: Colors.black54,
                    ),
                  ),
                ),
                initialCountryCode: _appController.countryCode.value,
                disableLengthCheck: true,
                onChanged: (phone) {},
                onCountryChanged: (country) {
                  _appController.countryCode.value = country.code;
                  _appController.dialCode.value = country.dialCode;
                },
              ))),
          FxSpacing.height(20),
          //passwordField(),
          //FxSpacing.height(20),
          editProfileBtn(context),
          FxSpacing.height(50),
        ],
      ),
    );
  }

  Widget avatarSection() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: 140,
                height: 140,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(Assets.avatar), fit: BoxFit.fill),
                ),
              ),

              /// Edit Avatar icon hide for now
              // Positioned(
              //   bottom: 12,
              //   right: 8,
              //   child: GestureDetector(
              //     onTap: () {
              //       //change avatar
              //     },
              //     child: Container(
              //       decoration: BoxDecoration(
              //         shape: BoxShape.circle,
              //         border: Border.all(
              //             color: Theme.of(context).scaffoldBackgroundColor,
              //             width: 2,
              //             style: BorderStyle.solid),
              //         color: Theme.of(context).colorScheme.primary,
              //       ),
              //       child: Padding(
              //         padding: const EdgeInsets.all(6),
              //         child: Icon(
              //           MdiIcons.pencil,
              //           size: 20,
              //           color: Theme.of(context).colorScheme.onPrimary,
              //         ),
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
          FxText.titleLarge(
            _authController.user!.name,
            fontWeight: 600,
            letterSpacing: 0,
            color: Theme.of(context).colorScheme.secondary,
          ),
          FxText.titleSmall(
            AT1Strings.ProfileCustomer.tr,
            fontWeight: 500,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
    );
  }

  Widget nameField() {
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
          textCapitalization: TextCapitalization.sentences,
        ));
  }

  Widget emailField() {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: TextFormField(
          enabled: false,
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
        ));
  }

  Widget passwordField() {
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
            prefixIcon: const Icon(
              FeatherIcons.lock,
              size: 22,
            ),
            isDense: true,
            contentPadding: const EdgeInsets.all(0),
          ),
          controller: _passwordController,
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.sentences,
          cursorColor: Theme.of(context).colorScheme.primary,
        )));
  }

  EditProfileDTO _generateDTO() {
    return EditProfileDTO(
      name: _nameController.text,
    );
  }

  Widget editProfileBtn(BuildContext context) {
    return FxButton.block(
      backgroundColor: Theme.of(context).primaryColor,
      padding: FxSpacing.y(12),
      onPressed: () async {
        FocusScope.of(context).unfocus();
        ProgressIndicators.loadingDialog();
        try {
          final dto = _generateDTO();
          await _authController.changeProfile(dto);
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
          FxText.bodySmall(AT1Strings.ProfileEdit.tr.toUpperCase(),
              color: Colors.white, fontWeight: 700, letterSpacing: 0.5),
        ],
      ),
    );
  }
}
