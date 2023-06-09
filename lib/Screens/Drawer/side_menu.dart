import 'package:app/Controllers/app_controller.dart';
import 'package:app/Controllers/authentication_controller.dart';
import 'package:app/Enums/Shared/settings.dart';
import 'package:app/Resources/strings.dart';
import 'package:app/Screens/Auth/login.dart';
import 'package:app/Screens/Shared/about_app.dart';
import 'package:app/Screens/Shared/contact_us.dart';
import 'package:app/Screens/Shared/help_center.dart';
import 'package:app/Screens/Shared/settings.dart';
import 'package:app/Theme/app_theme.dart';
import 'package:app/Utilities/assets.dart';
import 'package:app/Utilities/confim_dialog.dart';
import 'package:app/Utilities/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utilities/logger.dart';
import '../Profile/edit_profile.dart';

class SideMenu extends StatelessWidget {
  SideMenu({Key? key}) : super(key: key);

  final AuthenticationController _authenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context)
            .colorScheme
            .background
            .withOpacity(Get.isDarkMode ? 0.6 : 0.8),
        child: Stack(
          children: [
            Positioned(
              child: Image.asset(
                Get.isDarkMode ? Assets.appWhiteLogo : Assets.appLogo,
                width: 100,
              ),
              bottom: 50,
              left: 50,
            ),
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(
                  height: 100,
                ),

                ///Avatar area
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(),
                  child: Stack(
                    children: [
                      ClipRRect(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          child: Image.asset(
                            Assets.avatar,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            child: Image.asset(Assets.editCamIcon),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FxText.displaySmall(
                  _authenticationController.user != null
                      ? _authenticationController.user!.name
                      : AT1Strings.menuWelcome.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: Helpers.isRtl()
                        ? GoogleFonts.almarai().fontFamily
                        : AppTheme.fontAVGARDD,
                    fontSize: 20,
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(
                  height: 50,
                ),

                /// Start of the Menu
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      Obx(() {
                        //Debug.d('user : ${_authenticationController.user}');
                        if (_authenticationController.user != null) {
                          return menuItem(
                              Assets.accountMenu, AT1Strings.menuProfile.tr,
                              () {
                            Get.toNamed(EditProfileScreen.routeName);
                          },
                              iconColor:
                                  Theme.of(context).colorScheme.secondary);
                        } else {
                          return menuItem(
                              Assets.accountMenu, AT1Strings.signIn.tr, () {
                            Get.offAllNamed(LoginScreen.routeName);
                          },
                              iconColor:
                                  Theme.of(context).colorScheme.secondary);
                        }
                      }),
                      menuItem(Assets.infoMenu, AT1Strings.aboutYaabaay.tr, () {
                        Get.back();
                        Get.toNamed(AboutAppScreen.routeName);
                      }, iconColor: Theme.of(context).colorScheme.secondary),
                      menuItem(Assets.helpMenu, AT1Strings.helpCenter.tr, () {
                        Get.back();
                        Get.toNamed(HelpCenterScreen.routeName);
                      }, iconColor: Theme.of(context).colorScheme.secondary),
                      menuItem(Assets.socialMenu, AT1Strings.menuSocialMedia.tr,
                          () {
                        Get.back();
                        addBottomSheet(context);
                      },
                          iconHeight: 25,
                          iconColor: Theme.of(context).colorScheme.secondary),
                      menuItem(Assets.settingsMenu, AT1Strings.menuSettings.tr,
                          () {
                        Get.back();
                        Get.toNamed(SettingScreen.routeName);
                      }, iconColor: Theme.of(context).colorScheme.secondary),
                      menuItem(Assets.accountMenu, AT1Strings.menuContactUs.tr,
                          () {
                        Get.back();
                        Get.toNamed(ContactUsScreen.routeName);
                      }, iconColor: Theme.of(context).colorScheme.secondary),
                      // menuItem(Assets.ratingMenu, "Rate App", () {
                      //   Get.back();
                      // }, iconHeight: 25),
                      Obx(() => _authenticationController.user != null
                          ? menuItem(
                              Assets.logoutMenu,
                              AT1Strings.menuLogout.tr,
                              () async => await logoutAction(context),
                              iconHeight: 25,
                              iconColor: Colors.red)
                          : Container()),
                    ],
                  ),
                ),
              ],
            ),
            //App Version info
            Positioned(
                bottom: 100,
                child: Container(
                  width: context.width * 0.75,
                  child: Container(),
                ))
          ],
        ));
  }

  Widget menuItem(
    String svgAsset,
    String itemTitle,
    VoidCallback callback, {
    double iconHeight = 20,
    Color iconColor = Colors.black54,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: callback,
        behavior: HitTestBehavior.opaque,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              child: SvgPicture.asset(
                svgAsset,
                height: iconHeight,
                color: iconColor,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            FxText.bodySmall(
              itemTitle,
              fontSize: 18,
              fontWeight: 600,
              color: iconColor,
              style: TextStyle(
                fontFamily: Helpers.isRtl()
                    ? GoogleFonts.almarai().fontFamily
                    : AppTheme.fontVisbyCF,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Menu actions
  Future<void> logoutAction(BuildContext context) async {
    Debug.d('logoutAction clicked');
    Get.back();
    showAlertDialog(context, alertText: AT1Strings.menuLogoutConfirm.tr,
        okCallback: () async {
      if (_authenticationController.user != null) {
        Get.back();
        await _authenticationController.logout();
      }
    });
  }

  void addBottomSheet(context) {
    FocusScope.of(context).unfocus();
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            margin:
                const EdgeInsets.only(top: 15, bottom: 15, left: 16, right: 16),
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).dialogBackgroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(16.0))),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 120,
                      child: Column(
                        children: <Widget>[
                          Text(
                            AT1Strings.menuFollowYaaBaayApp.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: Helpers.isRtl()
                                  ? GoogleFonts.almarai().fontFamily
                                  : AppTheme.fontVisbyCF,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    // quickActionWidget(
                                    //   MdiIcons.textBoxOutline,
                                    //   'Document',
                                    // ),
                                    quickActionWidget(
                                        context,
                                        FeatherIcons.facebook,
                                        AT1Strings.facebook.tr, () async {
                                      await Helpers.launchURL(
                                          Settings.facebookURL);
                                    }),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    quickActionWidget(
                                        context,
                                        FeatherIcons.twitter,
                                        AT1Strings.twitter.tr, () async {
                                      await Helpers.launchURL(
                                          Settings.twitterURL);
                                    }),
                                    // quickActionWidget(
                                    //   MdiIcons.mapMarkerOutline,
                                    //   'Location',
                                    // ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    quickActionWidget(
                                        context,
                                        FeatherIcons.instagram,
                                        AT1Strings.instagram.tr, () async {
                                      await Helpers.launchURL(
                                          Settings.instagramURL);
                                    }),
                                    // quickActionWidget(
                                    //   MdiIcons.accountBoxOutline,
                                    //   'Contact',
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget quickActionWidget(BuildContext context, IconData iconData,
      String actionText, VoidCallback callback) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      child: Column(
        children: <Widget>[
          ClipOval(
            child: Material(
              color: Theme.of(context).primaryColor, // button color
              child: InkWell(
                splashColor: Colors.white,
                // inkwell color
                child: SizedBox(
                    width: 52,
                    height: 52,
                    child: Icon(
                      iconData,
                      color: Colors.white,
                      size: 25,
                    )),
                onTap: () {
                  callback();
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: FxText.labelMedium(
              style: TextStyle(
                fontFamily: Helpers.isRtl()
                    ? GoogleFonts.almarai().fontFamily
                    : AppTheme.fontVisbyCF,
              ),
              actionText,
              color: Theme.of(context).colorScheme.secondary,
            ),
          )
        ],
      ),
    );
  }
}
