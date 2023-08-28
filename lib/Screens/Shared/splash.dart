import 'dart:async';
import 'package:app/Controllers/app_controller.dart';
import 'package:app/Screens/Auth/login.dart';
import 'package:app/Screens/Main/home.dart';
import 'package:app/Screens/Shared/intro_screen.dart';
import 'package:app/Utilities/assets.dart';
import 'package:app/Utilities/deep_linking.dart';
import 'package:app/Utilities/logger.dart';
import 'package:app/Utilities/screens_bg.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart';
import 'package:video_player/video_player.dart';

import '../../Controllers/authentication_controller.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/';
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  final _appController = Get.find<AppController>();
  final _authController = Get.find<AuthenticationController>();
  //late AnimationController _animationController;

  late bool userCompleteIntro;
  late VideoPlayerController _vdController;

  late Timer _timer;
  final seekDuration = 5000; //milliseconds

  @override
  void initState() {
    super.initState();
    _vdController = VideoPlayerController.asset(Assets.splashDark)
      ..initialize().then((_) {
        setState(() {
          _vdController.play();
        });
      });

    _timer = new Timer(Duration(milliseconds: seekDuration), () {
      goNext();
    });

    // _animationController = AnimationController(vsync: this);
    // _animationController.addListener(() {
    //   if (_animationController.value == 1.0) {
    //     //goNext();
    //   }
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _vdController.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []); //enter full screen
    return GetBuilder<AuthenticationController>(
      init: _authController,
      initState: (_) => _loadData(),
      builder: (_) => Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Container(
          width: Get.width,
          height: Get.height,
          decoration: backgroundBoxDecoration(Assets.bg,
              color: Theme.of(context).colorScheme.background),
          child: Center(
            child: _vdController.value.isInitialized
                ? VideoPlayer(_vdController)
                : Container(),
          ),
          // Center(
          //   child: Container(
          //     child: Lottie.asset(
          //       Assets.appLogoLottie,
          //       width: 750,
          //       height: 342,
          //       fit: BoxFit.fitWidth,
          //       controller: _animationController,
          //       repeat: false,
          //       onLoaded: (comp) {
          //         _animationController
          //           ..duration = comp.duration
          //           ..forward();
          //       },
          //     ),
          //   ),
          // ),
        ));
  }

  Future<void> init() async {
    _vdController = VideoPlayerController.asset(Assets.splashDark);
    _vdController.addListener(() {
      setState(() {});
    });
    await _vdController.initialize();
    _vdController.play();
  }

  Future<bool> _loadUser() async {
    final isLoggedIn = await _authController.checkLoggedIn();
    return isLoggedIn;
  }

  Future<void> _loadData() async {
    final hasInitialUrl = await DeepLinking.initialize();
    if (hasInitialUrl) {
      _vdController.pause();
      return;
    }
    ;
    userCompleteIntro = await _appController.getIntro();
    await _appController.setLanguage();
    await _appController.getSettings();
    Debug.d('loadData userCompleteIntro $userCompleteIntro');
    final isLoggedIn = await _loadUser();
    Debug.d('user is logged: ${isLoggedIn.toString()}');
    //await PushNotifications.initialization();
    if (isLoggedIn) {
      _timer.cancel();
      //await _updateNotificationsToken();
      await goNext();
    }
  }

  Future<void> _updateNotificationsToken() async {
    //Debug.d('updateNotificationsToken');
    // final deviceType = await getDevicePlatform();
    // final token = await PushNotifications.getToken();
    // final dto = NotificationTokenDTO(
    //     type: deviceType,
    //     token: token,
    //     language: Get.deviceLocale?.languageCode ?? "en",
    // );
    // //Debug.d(dto.toJson().toString());
    // await _authController.pushNotificationTokenRequest(dto);
  }

  Future<void> goNext() async {
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    if (!userCompleteIntro) {
      Get.offAllNamed(IntroScreen.routeName);
    } else {
      if (_authController.user == null) {
        Get.offAllNamed(LoginScreen.routeName);
      } else {
        Get.offAllNamed(HomeScreen.routeName);
      }
    }
  }
}
