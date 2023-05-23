import 'package:app/Controllers/app_controller.dart';
import 'package:app/Enums/Backend/urls.dart';
import 'package:app/Models/Service/ServicesData.dart';
import 'package:app/Screens/Drawer/side_menu.dart';
import 'package:app/Screens/Service/service_single.dart';
import 'package:app/Screens/Shared/notifications.dart';
import 'package:app/Utilities/assets.dart';
import 'package:app/Utilities/cached_image_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:get/get.dart';

import '../../Models/Shared/message_exception.dart';
import '../../Utilities/logger.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _appController = Get.find<AppController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_appController.sliderItems.isEmpty) _appController.getSliders();
    if (_appController.servicesItems.isEmpty) _appController.getAllServices();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: SideMenu(),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {

    /// New Home screen
    return Stack(
        children: [
          Positioned(child: slider(context)),
          Positioned(child: Container(
            color: Theme.of(context).colorScheme.background,
            margin: const EdgeInsets.only(top: 270),
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    services(context),
                    const SizedBox(height: 30,),
                  ],
                )
            ),
          ),),
          Positioned(child: topBar(context)),
        ],
      );

    /// Old Home screen
    // return Column(
    //   children: [
    //     topBar(context),
    //     Expanded(
    //       child: SingleChildScrollView(
    //         physics: const AlwaysScrollableScrollPhysics(),
    //         child: Column(
    //           children: [
    //             slider(context),
    //             const SizedBox(height: 10,),
    //             services(context),
    //             const SizedBox(height: 30,),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }

  /// top Bar
  Widget topBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.only(right: 15, left: 15, bottom: 10),
      width: Get.width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () => _scaffoldKey.currentState?.openDrawer(),
                child: SvgPicture.asset(Assets.menu, height: 27,),
              )
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset(Assets.appLogo, height: 60,),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => Get.toNamed(NotificationsScreen.routeName),
              child: SvgPicture.asset(Assets.notification, height: 30,),
            ),
          )
        ],
      ),
    );
  }

  /// Slider
  Widget slider(BuildContext context) {
    return Obx(() {
      if( _appController.sliderItems.isNotEmpty ) {
        return CarouselSlider(
          options: CarouselOptions(
            height: 320.0,
            viewportFraction: 1,
            enableInfiniteScroll: _appController.sliderItems.length > 1 ? true : false,
            reverse: false,
            autoPlay: _appController.sliderItems.length > 1 ? true : false,
            autoPlayInterval: const Duration(seconds: 6),
          ),
          items: _appController.sliderItems.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: Get.width,
                  margin: const EdgeInsets.symmetric(horizontal: 0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: const BorderRadius.all(Radius.circular(0))),
                  child: GestureDetector(
                    onTap: () {
                      Debug.d("slider item clicked ${item.toJson()}");
                    },
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                      child: Image.network(
                        "${Urls.s3Url}${item.image}",
                        fit: BoxFit.fill,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        );
      }else{
        return Container(
          width: Get.width,
          height: 320.0,
          margin: const EdgeInsets.symmetric(horizontal: 0),
          child: Image.asset(
              Assets.homeBg,
              fit: BoxFit.fill,
              alignment: Alignment.topCenter,
          ),
        );
      }
      return Container();
    });
  }
  Future getSliderData(BuildContext context) async {
    try {
      await _appController.getSliders();
    } on MessageException catch (error) {
      Debug.d(error);
    }
  }

  /// Services
  Widget services(BuildContext context) {
    //@ignore:
    return Obx(() => Container(
      color: Theme.of(context).colorScheme.background,
      margin: const EdgeInsets.only(right: 10, left: 10),
      width: Get.width,
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _appController.servicesItems.length,
        itemBuilder: (context, index) {
          return serviceItem(_appController.servicesItems[index]);
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 200,
        ),
      ),
    ));
  }
  Widget serviceItem(ServicesData servicesData) {
    return FxContainer(
      color: Theme.of(context).colorScheme.background,
      onTap: () {
        Get.toNamed(ServiceSingleScreen.routeName, arguments: servicesData);
      },
      margin: const EdgeInsets.all(5),
      height: 20,
      paddingAll: 0,
      borderRadiusAll: 16,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            top: 0,
            right: 0,
            child: CachedImage(url: '${Urls.s3Url}${servicesData.logo}', color: Theme.of(context).primaryColor,),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              padding: FxSpacing.zero,
              decoration: const BoxDecoration(
                // gradient: LinearGradient(
                //     begin: Alignment.bottomCenter,
                //     end: Alignment.topCenter,
                //     colors: [
                //       Colors.black.withAlpha(200),
                //       Colors.black.withAlpha(160),
                //       Colors.black.withAlpha(120),
                //       Colors.black.withAlpha(80),
                //       Colors.transparent
                //     ],
                //     stops: const [0.1, 0.25, 0.5, 0.7, 1]
                // ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxSpacing.height(16),
                FxText.titleLarge(
                  '${servicesData.name}',
                  fontWeight: 600,
                  letterSpacing: 0,
                  color: Colors.white,
                ),
                FxSpacing.height(4),
                // FxText.bodyMedium('',
                //   color: Colors.white,
                //   xMuted: true,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
