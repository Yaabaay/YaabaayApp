import 'package:app/Controllers/authentication_controller.dart';
import 'package:app/DTOs/Service/service_order.dart';
import 'package:app/Resources/strings.dart';
import 'package:app/Screens/Service/service_request.dart';
import 'package:app/Screens/Service/service_request_sent.dart';
import 'package:app/Theme/app_theme.dart';
import 'package:app/Utilities/confim_dialog.dart';
import 'package:app/Utilities/helpers.dart';
import 'package:app/Utilities/logger.dart';
import 'package:app/Utilities/transform_direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutx/flutx.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controllers/app_controller.dart';
import '../../Enums/Backend/urls.dart';
import '../../Models/Service/ServicesData.dart';
import '../../Models/Shared/message_exception.dart';

import '../../Utilities/cached_image_widget.dart';
import '../../Utilities/progress_indicator.dart';
import '../../Utilities/snackbars.dart';

class ServiceSingleScreen extends StatefulWidget {
  static const routeName = '/ServiceSingleScreen';
  ServiceSingleScreen({Key? key}) : super(key: key);

  @override
  State<ServiceSingleScreen> createState() => _ServiceSingleScreenState();
}

class _ServiceSingleScreenState extends State<ServiceSingleScreen> {
  final _appController = Get.find<AppController>();
  final _authController = Get.find<AuthenticationController>();

  late ServicesData _servicesData;

  final double subServiceHeight = 120;

  @override
  void initState() {
    _servicesData = Get.arguments;
    Debug.d('data : ${_servicesData}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context, _authController),
      floatingActionButton: floatingButton(_authController, Get.arguments),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildBody(
      BuildContext context, AuthenticationController authenticationController) {
    return CustomScrollView(
      slivers: <Widget>[
        nestedToolbar(context),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Column(
                children: [
                  htmlContent(_servicesData.desc?.getTran()),
                  services(
                      context, authenticationController, _servicesData.subs!),
                  Container(
                    height: 60,
                  ),
                ],
              );
            },
            childCount: 1,
          ),
        ),
      ],
    );
  }

  Future<void> sendRequest(
    AuthenticationController authenticationController,
    ServicesData servicesData,
  ) async {
    showAlertDialog(context,
        title: AT1Strings.freeConsultation.tr,
        alertText: AT1Strings.ServiceAskConsultation.tr,
        confirmButtonText: AT1Strings.submit.tr, okCallback: () async {
      Get.back();
      if (authenticationController.user != null) {
        try {
          ProgressIndicators.loadingDialog();
          final dto = ServiceOrderDTO(
              categoryId: servicesData.id, notes: servicesData.name?.getTran());
          Debug.d(dto.toJson());
          await _appController.sendServiceUserOrder(dto);
          Snackbars.success(AT1Strings.ServiceThanksConsultation.tr);
          Get.offAllNamed(ServiceRequestSentScreen.routeName);
        } on MessageException catch (error) {
          Get.back();
          Snackbars.danger(error.message);
        }
      } else {
        Get.toNamed(ServiceRequestScreen.routeName, arguments: servicesData);
      }
    });
  }

  Widget nestedToolbar(BuildContext context) {
    return SliverAppBar(
      collapsedHeight: 90.0,
      expandedHeight: 300.0,
      floating: false,
      pinned: true,
      //backgroundColor: Theme.of(context).colorScheme.background,
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
            _servicesData.name?.getTran(),
            fontSize: 25.0,
            style: TextStyle(
              color: Colors.white,
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
          background: CachedImage(
            url: '${Urls.s3Url}${_servicesData.background}',
            color: Theme.of(context).primaryColor,
          )
          // Image(
          //   image: AssetImage("${Urls.s3Url}${_servicesData.logo!}"),
          //   fit: BoxFit.cover,
          //   alignment: Alignment.bottomCenter,
          // )
          ),
    );
  }

  //html content
  Widget htmlContent(String html) {
    return Html(
      data: """$html""",
      style: {
        "*": Style(
          fontFamily: Helpers.isRtl()
              ? GoogleFonts.almarai().fontFamily
              : AppTheme.fontVisbyCF,
          fontSize: FontSize.large,
          textAlign: TextAlign.justify,
        )
      },
    );
  }

  Widget floatingButton(AuthenticationController authenticationController,
      ServicesData servicesData) {
    return FloatingActionButton.extended(
      label: Row(children: [
        const Icon(
          Icons.message,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        Text(AT1Strings.freeConsultation.tr),
      ]),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () async => await sendRequest(
        authenticationController,
        servicesData,
      ),
    );
    /**
     * Old FloatingActionButton
     */
    // return FloatingActionButton(
    //   elevation: 3.0,
    //   backgroundColor: Theme.of(context).primaryColor,
    //   onPressed: () async =>
    //       await sendRequest(authenticationController, servicesData),
    //   child: Row(children: [
    //     const Icon(
    //       Icons.add,
    //       color: Colors.white,
    //     ),
    //     Text('free consultation')
    //   ]),
    // );
  }

  /// Services
  Widget services(
      BuildContext context,
      AuthenticationController authenticationController,
      List<ServicesData> services) {
    //@ignore:
    return Container(
      //color: Theme.of(context).colorScheme.background,
      margin: const EdgeInsets.only(right: 10, left: 10),
      width: Get.width,
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: services.length,
        itemBuilder: (context, index) {
          return serviceItem(authenticationController, services[index]);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: subServiceHeight,
        ),
      ),
    );
  }

  Widget serviceItem(AuthenticationController authenticationController,
      ServicesData servicesData) {
    return FxContainer(
      color: Theme.of(context).colorScheme.background,
      onTap: () {
        Get.to(
          () => ServiceSingleScreen(),
          arguments: servicesData,
          preventDuplicates: false,
        );
        //await sendRequest(authenticationController, servicesData);
      },
      margin: const EdgeInsets.all(5),
      height: 10,
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
            child: CachedImage(
              url: '${Urls.s3Url}${servicesData.logo}',
              color: Theme.of(context).primaryColor,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: subServiceHeight,
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
                  '${servicesData.name?.getTran()}',
                  fontWeight: 600,
                  letterSpacing: 0,
                  color: Colors.white,
                  style: TextStyle(
                    fontFamily: AppTheme.fontAVGARDD,
                    fontSize: 15,
                  ),
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
