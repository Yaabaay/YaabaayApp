import 'package:app/Controllers/authentication_controller.dart';
import 'package:app/DTOs/Shared/contact_us.dart';
import 'package:app/Resources/strings.dart';
import 'package:app/Screens/Service/service_request_sent.dart';
import 'package:app/Theme/app_theme.dart';
import 'package:app/Utilities/transform_direction.dart';
import 'package:app/extensions/widgets_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../Controllers/app_controller.dart';
import '../../Models/Shared/message_exception.dart';
import '../../Utilities/assets.dart';
import '../../Utilities/progress_indicator.dart';
import '../../Utilities/snackbars.dart';

class ContactUsScreen extends StatefulWidget {
  static const routeName = '/ContactUsScreen';
  ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _appController = Get.find<AppController>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _messageController = TextEditingController();

  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    outlineInputBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(child: _buildBody(context)),
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
                  Container(
                    padding: EdgeInsets.only(
                        left: Get.width * .1, right: Get.width * .1),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
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
                          messageField(),
                          const SizedBox(
                            height: 10,
                          ),
                          submitBtn(context),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  )
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
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
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
            AT1Strings.ContactUS.tr,
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 25.0,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontFamily: AppTheme.fontAVGARDD,
              fontSize: AppTheme.fontAVGARDDSize,
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
            image: AssetImage(Assets.bgContactUs),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
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
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.none,
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
          onChanged: (phone) {},
          onCountryChanged: (country) {
            _appController.countryCode.value = country.code;
            _appController.dialCode.value = country.dialCode;
          },
          textInputAction: TextInputAction.next,
        ));
  }

  Widget messageField() {
    return Container(
      child: CupertinoTextField(
        controller: _messageController,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black54),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        cursorColor: Theme.of(context).colorScheme.primary,
        placeholder: AT1Strings.ContactUsMsg.tr,
        placeholderStyle: TextStyle(
            color: Theme.of(context).colorScheme.secondary.withAlpha(160)),
        minLines: 4,
        maxLines: 5,
        style: TextStyle(color: Colors.black87),
        padding: FxSpacing.xy(8, 16),
        textInputAction: TextInputAction.done,
      ),
    );
  }

  ContactUsDTO _generateDTO() {
    return ContactUsDTO(
      name: _nameController.text,
      email: _emailController.text,
      phone: _appController.dialCode.value + _mobileController.text,
      message: _messageController.text,
    );
  }

  Widget submitBtn(BuildContext context) {
    return FxButton.block(
      backgroundColor: Theme.of(context).primaryColor,
      padding: FxSpacing.y(12),
      onPressed: () async {
        FocusScope.of(context).unfocus();
        ProgressIndicators.loadingDialog();
        try {
          final dto = _generateDTO();
          await _appController.sendContactUs(dto);
          Get.offAllNamed(ServiceRequestSentScreen.routeName, arguments: {
            'title': AT1Strings.ContactUsSentSuccessfully.tr,
            'message': AT1Strings.ContactUsSentSuccessfullyMsg.tr,
          });
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
            AT1Strings.submit.tr.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontFamily: AppTheme.fontVisbyCF,
            ),
            fontWeight: 700,
            letterSpacing: 0.5,
          ),
        ],
      ),
    );
  }
}
