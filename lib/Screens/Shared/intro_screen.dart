import 'package:app/Controllers/authentication_controller.dart';
import 'package:app/Resources/strings.dart';
import 'package:app/Utilities/assets.dart';
import 'package:app/Utilities/transform_direction.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:get/get.dart';

import '../../Controllers/app_controller.dart';
import '../../Theme/app_theme.dart';
import '../../Utilities/screens_bg.dart';
import '../Auth/login.dart';
import '../Main/home.dart';

class IntroScreen extends StatefulWidget {
  static const routeName = '/IntroScreen';
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  final _appController = Get.find<AppController>();
  final _authController = Get.find<AuthenticationController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Directionality(
            textDirection: getCurrentTextDirection(context),
            child: Container(
                height: Get.height,
                color: Theme.of(context).colorScheme.background,
                child: FxOnBoarding(
                  pages: <PageViewModel>[
                    PageViewModel(
                      backgroundBoxDecoration(Assets.bg, color: Theme.of(context).colorScheme.background),
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Center(
                                child: Image(
                                  image: AssetImage( Get.isDarkMode ?  Assets.introImagesDark1 : Assets.introImagesWhite1 ),
                                  width: 200,
                                  height: 320,
                                )),
                            const SizedBox(height: 30.0),
                            FxText.bodyLarge(AT1Strings.slideOneTitle.tr,
                              fontSize: 20,
                              fontWeight: 600,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            const SizedBox(height: 15.0),
                            FxText.bodyMedium(
                                AT1Strings.slideOneContent.tr,
                                color: Theme.of(context).hintColor,
                                fontSize: 18,
                                letterSpacing: 0.1,
                                fontWeight: 500,
                            ),
                          ],
                        ),
                      ),
                    ),
                    PageViewModel(
                      backgroundBoxDecoration(Assets.bgBlue, color: Theme.of(context).colorScheme.background),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Center(
                                child: Image(
                                  image: AssetImage( Get.isDarkMode ? Assets.introImagesDark2 : Assets.introImagesWhite2 ),
                                  width: 200,
                                  height: 320,
                                )),
                            const SizedBox(height: 30.0),
                            FxText.bodyLarge(AT1Strings.slideTwoTitle.tr,
                              fontSize: 20,
                              fontWeight: 600,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            const SizedBox(height: 15.0),
                            FxText.bodyMedium(
                                AT1Strings.slideTwoContent.tr,
                                color: Theme.of(context).hintColor,
                                fontSize: 18,
                                letterSpacing: 0.1,
                                fontWeight: 500),
                          ],
                        ),
                      ),
                    ),
                    PageViewModel(
                      backgroundBoxDecoration(Assets.bgRed, color: Theme.of(context).colorScheme.background),
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                                child: Image(
                                  image: AssetImage( Get.isDarkMode ? Assets.introImagesDark3 : Assets.introImagesWhite3 ),
                                  width: 200,
                                  height: 320,
                                )),
                            const SizedBox(height: 30),
                            FxText.bodyLarge(AT1Strings.slideThreeTitle.tr,
                              fontSize: 20,
                              fontWeight: 600,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            const SizedBox(height: 15.0),
                            FxText.bodyMedium(
                                AT1Strings.slideThreeContent.tr,
                                color: Theme.of(context).hintColor,
                                fontSize: 18,
                                letterSpacing: 0.1,
                                fontWeight: 500),
                          ],
                        ),
                      ),
                    ),
                  ],
                  unSelectedIndicatorColor: Theme.of(context).colorScheme.secondary,
                  selectedIndicatorColor: Theme.of(context).colorScheme.primary,
                  doneWidget: InkWell(
                    splashColor: Theme.of(context).colorScheme.secondary,
                    onTap: () async {
                      await goNext(true);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: FxText.titleSmall(AT1Strings.done.tr.toUpperCase(),
                          color: Theme.of(context).colorScheme.primary, fontWeight: 700),
                    ),
                  ),
                  skipWidget: InkWell(
                    splashColor: Theme.of(context).colorScheme.secondary,
                    onTap: () async {
                      await goNext(false);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: FxText.titleSmall(AT1Strings.skip.tr.toUpperCase(),
                          color: Theme.of(context).colorScheme.secondary, fontWeight: 700),
                    ),
                  ),
                )
            ),
          ),
        )
    );
  }

  bool isThemeLight() {
    return Theme.of(context) == AppTheme.lightTheme ? true : false;
  }

  Future<void> goNext(bool complete) async {
    if( complete ){
      // save user see all intros
      await _appController.saveIntro(complete);
    }
    if( _authController.user == null ){
      Get.offAllNamed(LoginScreen.routeName);
    }else{
      Get.offAllNamed(HomeScreen.routeName);
    }
  }

}
