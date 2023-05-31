import 'package:app/Controllers/authentication_controller.dart';
import 'package:app/Models/Service/ServicesData.dart';
import 'package:app/Resources/strings.dart';
import 'package:app/Screens/Service/service_request_sent.dart';
import 'package:app/Theme/app_theme.dart';
import 'package:app/Utilities/logger.dart';
import 'package:app/Utilities/transform_direction.dart';
import 'package:app/extensions/widgets_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutx/flutx.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../Controllers/app_controller.dart';
import '../../DTOs/Service/service_order.dart';
import '../../Models/Shared/message_exception.dart';
import '../../Utilities/assets.dart';

import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;

import '../../Utilities/confim_dialog.dart';
import '../../Utilities/progress_indicator.dart';
import '../../Utilities/snackbars.dart';

class ServiceRequestScreen extends StatefulWidget {
  static const routeName = '/ServiceRequestScreen';
  ServiceRequestScreen({Key? key}) : super(key: key);

  @override
  State<ServiceRequestScreen> createState() => _ServiceRequestScreenState();
}

class _ServiceRequestScreenState extends State<ServiceRequestScreen> {
  final _appController = Get.find<AppController>();
  final _authController = Get.find<AuthenticationController>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();

  late ServicesData? _servicesData;

  OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(
      color: Colors.black54,
    ),
  );

  @override
  void initState() {
    _servicesData = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        nestedToolbar(context),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    Get.isDarkMode ? Assets.appWhiteLogo : Assets.appLogo,
                    height: 100,
                  ),
                  Directionality(
                      textDirection: TextDirection.ltr,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: Get.width * .1, right: Get.width * .1),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            nameField(),
                            const SizedBox(
                              height: 10,
                            ),
                            mobileField(),
                            const SizedBox(
                              height: 10,
                            ),
                            emailField(),
                            const SizedBox(
                              height: 10,
                            ),
                            passwordField(),
                            const SizedBox(
                              height: 10,
                            ),
                            submitBtn(context),
                          ],
                        ),
                      ))
                ],
              );
            },
            childCount: 1,
          ),
        ),
      ],
    );
  }

  Widget nestedToolbar(BuildContext theme) {
    return SliverAppBar(
      collapsedHeight: 90.0,
      expandedHeight: 300.0,
      floating: false,
      pinned: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 10,
          margin:
              const EdgeInsets.only(left: 15, right: 10, top: 10, bottom: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.background,
          ),
          child: TransformWithDirection(
              context,
              Icon(
                FeatherIcons.chevronLeft,
                color: Theme.of(context).colorScheme.secondary,
              )),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
          //centerTitle: true,
          titlePadding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          title: FxText.bodyMedium(
            Get.arguments.name,
            style: TextStyle(
              fontFamily: AppTheme.fontAVGARDD,
              fontSize: AppTheme.fontAVGARDDSize,
              color: Colors.white,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(0, 0),
                  blurRadius: 12.0,
                  color: Color.fromARGB(255, 0, 0, 0).withAlpha(200),
                ),
              ],
            ),
          ),
          background: const Image(
            image: AssetImage(Assets.plan),
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter,
          )),
    );
  }

  Widget nameField() {
    return TextFormField(
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
    );
  }

  Widget emailField() {
    return TextFormField(
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
      textInputAction: TextInputAction.next,
    );
  }

  Widget mobileField() {
    return Obx(() => IntlPhoneField(
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
          dropdownTextStyle: const TextStyle(color: Colors.black54),
          textInputAction: TextInputAction.next,
          onChanged: (phone) {},
          onCountryChanged: (country) {
            _appController.countryCode.value = country.code;
            _appController.dialCode.value = country.dialCode;
          },
        ));
  }

  Widget passwordField() {
    return Obx(() => TextFormField(
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
          textCapitalization: TextCapitalization.sentences,
          cursorColor: Theme.of(context).colorScheme.primary,
        ));
  }

  Widget submitBtn(BuildContext context) {
    return FxButton.block(
      backgroundColor: Theme.of(context).primaryColor,
      padding: FxSpacing.y(12),
      onPressed: () async {
        showAlertDialog(context,
            title: AT1Strings.freeConsultation.tr,
            alertText: AT1Strings.ServiceAskConsultation.tr,
            confirmButtonText: AT1Strings.submit.tr, okCallback: () async {
          try {
            Get.back();
            ProgressIndicators.loadingDialog();
            final dto = ServiceOrderDTO(
              categoryId: _servicesData?.id,
              name: _nameController.text,
              email: _emailController.text,
              phone: _mobileController.text.isNotEmpty
                  ? _appController.dialCode.value + _mobileController.text
                  : "",
              password: _passwordController.text,
              notes: _servicesData?.name,
              registerBy: "",
            );
            Debug.d(dto.toJson());
            await _appController.sendServiceGuestOrder(dto);
            Snackbars.success(AT1Strings.ServiceThanksConsultation.tr);
            Get.offAllNamed(ServiceRequestSentScreen.routeName);
          } on MessageException catch (error) {
            Get.back();
            Snackbars.danger(error.message);
          }
        });
      },
      elevation: 0,
      borderRadiusAll: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FxText.bodySmall(
            AT1Strings.ServiceRequestSubmit.tr.toUpperCase(),
            fontWeight: 700,
            letterSpacing: 0,
            style: TextStyle(
              fontFamily: AppTheme.fontVisbyCF,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
