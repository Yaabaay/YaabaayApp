import 'package:app/Enums/Shared/keys.dart';
import 'package:app/Resources/strings.dart';
import 'package:app/Resources/translations.dart';
import 'package:app/Screens/Shared/about_app.dart';
import 'package:app/Screens/Shared/content.dart';
import 'package:app/Screens/Shared/help_center.dart';
import 'package:app/Theme/app_theme.dart';
import 'package:app/Theme/theme_model.dart';
import 'package:app/Utilities/transform_direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:app_settings/app_settings.dart';
import 'package:provider/provider.dart';
import '../../Controllers/app_controller.dart';

class SettingScreen extends StatefulWidget {
  static const routeName = '/SettingScreen';
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final _appController = Get.find<AppController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: TransformWithDirection(
                context,
                Icon(
                  FeatherIcons.chevronLeft,
                  size: 20,
                  color: Theme.of(context).colorScheme.secondary,
                )),
          ),
          title: FxText.titleLarge(
            AT1Strings.settingsTitle.tr,
            fontWeight: 600,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        body: ListView(
          padding: FxSpacing.nTop(20),
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            languageWidget(),
            dividerWidget(),
            themeModeWidget(themeNotifier),
            dividerWidget(),
            notificationWidget(),
            dividerWidget(),
            privacyWidget(),
            dividerWidget(),
            termsWidget(),
            dividerWidget(),
            helpWidget(),
            dividerWidget(),
            aboutWidget(),
            dividerWidget(),
          ],
        ),
      );
    });
    // return Scaffold(
    //     backgroundColor: Theme.of(context).colorScheme.background,
    //     appBar: AppBar(
    //       elevation: 0,
    //       leading: IconButton(
    //         onPressed: () => Navigator.of(context).pop(),
    //         icon: Icon(
    //           FeatherIcons.chevronLeft,
    //           size: 20,
    //           color: Theme.of(context).colorScheme.secondary,
    //         ),
    //       ),
    //       title: FxText.titleLarge(
    //         "Settings",
    //         fontWeight: 600,
    //         color: Theme.of(context).colorScheme.secondary,
    //       ),
    //     ),
    //     body: ListView(
    //       padding: FxSpacing.nTop(20),
    //       children: <Widget>[
    //         const SizedBox(height: 20,),
    //         //languageWidget(),
    //         //dividerWidget(),
    //         notificationWidget(),
    //         dividerWidget(),
    //         themeModeWidget(),
    //         dividerWidget(),
    //         privacyWidget(),
    //         dividerWidget(),
    //         termsWidget(),
    //         dividerWidget(),
    //         helpWidget(),
    //         dividerWidget(),
    //         aboutWidget(),
    //         dividerWidget(),
    //       ],
    //     ));
  }

  Widget dividerWidget() {
    return Divider(
      thickness: 0.3,
      color: Theme.of(context).colorScheme.secondary,
    );
  }

  Widget languageWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: GestureDetector(
        onTap: () async {
          bool isArabic = Get.locale?.languageCode ==
              AT1Translations.supportedLanguages.last.locale.languageCode;
          Get.updateLocale(isArabic ? Locale('en', 'US') : Locale('ar', 'EG'));
          await _appController.saveLanguage(Get.locale!.languageCode);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(MdiIcons.translate,
                  size: 24, color: Theme.of(context).colorScheme.secondary),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: FxText.titleMedium(
                  AT1Strings.settingsLanguage.tr,
                  fontWeight: 600,
                  color: Theme.of(context).colorScheme.secondary,
                  style: TextStyle(
                    fontFamily: AppTheme.fontVisbyCF,
                    fontSize: AppTheme.fontVisbyCFSize,
                  ),
                  textDirection: getCurrentTextDirection(context),
                ),
              ),
            ),
            Container(
              child: FxText.titleSmall(
                AT1Strings.langName.tr,
                fontWeight: 600,
                color: Theme.of(context).colorScheme.secondary,
                textDirection: getCurrentTextDirection(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget notificationWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: GestureDetector(
        onTap: () => AppSettings.openNotificationSettings(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(
                MdiIcons.bellRingOutline,
                size: 22,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: FxText.titleMedium(
                  AT1Strings.settingsNotifications.tr,
                  fontWeight: 600,
                  color: Theme.of(context).colorScheme.secondary,
                  style: TextStyle(
                    fontFamily: AppTheme.fontVisbyCF,
                    fontSize: AppTheme.fontVisbyCFSize,
                  ),
                  textDirection: getCurrentTextDirection(context),
                ),
              ),
            ),
            Container(
              child: TransformWithDirection(
                  context,
                  Icon(MdiIcons.chevronRight,
                      size: 24,
                      color: Theme.of(context).colorScheme.secondary)),
            ),
          ],
        ),
      ),
    );
  }

  Widget themeModeWidget(ThemeModel themeNotifier) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: GestureDetector(
        onTap: () async {
          themeNotifier.isDark
              ? themeNotifier.isDark = false
              : themeNotifier.isDark = true;
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(MdiIcons.eyeOutline,
                  size: 22, color: Theme.of(context).colorScheme.secondary),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: FxText.titleMedium(
                  AT1Strings.settingsTheme.tr,
                  fontWeight: 600,
                  color: Theme.of(context).colorScheme.secondary,
                  style: TextStyle(
                    fontFamily: AppTheme.fontVisbyCF,
                    fontSize: AppTheme.fontVisbyCFSize,
                  ),
                  textDirection: getCurrentTextDirection(context),
                ),
              ),
            ),
            Container(
              child: Icon(
                  themeNotifier.isDark
                      ? Icons.nightlight_round
                      : Icons.wb_sunny,
                  size: 24,
                  color: Theme.of(context).colorScheme.secondary),
              // Icon(MdiIcons.chevronRight,
              //     size: 24, color: Theme.of(context).colorScheme.secondary),
            ),
          ],
        ),
      ),
    );
  }

  Widget privacyWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: GestureDetector(
        onTap: () => Get.toNamed(ContentScreen.routeName, arguments: {
          Keys.title: AT1Strings.settingsPrivacyPolicy.tr,
          Keys.content: _appController.settings.value?.privacy
        }),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(MdiIcons.lockOutline,
                  size: 24, color: Theme.of(context).colorScheme.secondary),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: FxText.titleMedium(
                  AT1Strings.settingsPrivacyPolicy.tr,
                  fontWeight: 600,
                  color: Theme.of(context).colorScheme.secondary,
                  style: TextStyle(
                    fontFamily: AppTheme.fontVisbyCF,
                    fontSize: AppTheme.fontVisbyCFSize,
                  ),
                  textDirection: getCurrentTextDirection(context),
                ),
              ),
            ),
            Container(
              child: TransformWithDirection(
                context,
                Icon(MdiIcons.chevronRight,
                    size: 24,
                    color: Theme.of(context).colorScheme.secondary,
                    textDirection: getCurrentTextDirection(context)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget termsWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: GestureDetector(
        onTap: () => Get.toNamed(ContentScreen.routeName, arguments: {
          Keys.title: AT1Strings.settingsTermsConditions.tr,
          Keys.content: _appController.settings.value?.terms
        }),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(MdiIcons.fileDocument,
                  size: 24, color: Theme.of(context).colorScheme.secondary),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: FxText.titleMedium(
                  AT1Strings.settingsTermsConditions.tr,
                  fontWeight: 600,
                  color: Theme.of(context).colorScheme.secondary,
                  style: TextStyle(
                    fontFamily: AppTheme.fontVisbyCF,
                    fontSize: AppTheme.fontVisbyCFSize,
                  ),
                  textDirection: getCurrentTextDirection(context),
                ),
              ),
            ),
            Container(
              child: TransformWithDirection(
                  context,
                  Icon(
                    MdiIcons.chevronRight,
                    size: 24,
                    color: Theme.of(context).colorScheme.secondary,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget helpWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(HelpCenterScreen.routeName);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(MdiIcons.faceAgent,
                  size: 24, color: Theme.of(context).colorScheme.secondary),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: FxText.titleMedium(
                  AT1Strings.settingsHelpSupport.tr,
                  fontWeight: 600,
                  color: Theme.of(context).colorScheme.secondary,
                  style: TextStyle(
                    fontFamily: AppTheme.fontVisbyCF,
                    fontSize: AppTheme.fontVisbyCFSize,
                  ),
                  textDirection: getCurrentTextDirection(context),
                ),
              ),
            ),
            Container(
              child: TransformWithDirection(
                  context,
                  Icon(MdiIcons.chevronRight,
                      size: 24,
                      color: Theme.of(context).colorScheme.secondary)),
            ),
          ],
        ),
      ),
    );
  }

  Widget aboutWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: GestureDetector(
        onTap: () => Get.toNamed(AboutAppScreen.routeName),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(MdiIcons.helpCircleOutline,
                  size: 24, color: Theme.of(context).colorScheme.secondary),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: FxText.titleMedium(
                  AT1Strings.settingsAbout.tr,
                  fontWeight: 600,
                  color: Theme.of(context).colorScheme.secondary,
                  style: TextStyle(
                    fontFamily: AppTheme.fontVisbyCF,
                    fontSize: AppTheme.fontVisbyCFSize,
                  ),
                  textDirection: getCurrentTextDirection(context),
                ),
              ),
            ),
            Container(
              child: TransformWithDirection(
                  context,
                  Icon(MdiIcons.chevronRight,
                      size: 24,
                      color: Theme.of(context).colorScheme.secondary)),
            ),
          ],
        ),
      ),
    );
  }
}
