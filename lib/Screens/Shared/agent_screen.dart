import 'dart:io';

import 'package:app/Controllers/app_controller.dart';
import 'package:app/Controllers/authentication_controller.dart';
import 'package:app/Enums/Backend/urls.dart';
import 'package:app/Models/Profile/AgentModel.dart';
import 'package:app/Models/Profile/CustomerModel.dart';
import 'package:app/Resources/strings.dart';
import 'package:app/Screens/Main/home.dart';
import 'package:app/Theme/app_theme.dart';
import 'package:app/Utilities/assets.dart';
import 'package:app/Utilities/helpers.dart';
import 'package:app/Utilities/logger.dart';
import 'package:app/Utilities/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class AgentScreen extends StatefulWidget {
  static const routeName = '/AgentScreen';
  AgentScreen({Key? key}) : super(key: key);
  @override
  _AgentScreenState createState() => _AgentScreenState();
}

class _AgentScreenState extends State<AgentScreen> {
  final _appCtl = Get.find<AppController>();
  final _authCtl = Get.find<AuthenticationController>();

  late CustomerModel _customers;
  final OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(
      color: Colors.black54,
    ),
  );

  Future<void> _loadAgentStatus() async {
    try {
      _customers = await _authCtl.getAgentStatus();
      _authCtl.customersCounter.value = _customers.customers ?? '0';
      _authCtl.customersCode.value = _customers.resellerCode ?? '0';
    } catch (error) {
      Debug.d(error);
    }
  }

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: '${_authCtl.customersCode.value}'));
  }

  @override
  void initState() {
    _loadAgentStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AT1Strings.agentTitle.tr,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontFamily: Helpers.isRtl()
                  ? GoogleFonts.almarai().fontFamily
                  : AppTheme.fontVisbyCF,
            )),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Theme.of(context).colorScheme.secondary),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Center(
                child: _bodyUi(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodyUi(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100.0,
        ),
        FxText.displaySmall(
          AT1Strings.customersTitle.tr,
          fontWeight: 600,
          textAlign: TextAlign.center,
          color: Theme.of(context).colorScheme.secondary,
          style: TextStyle(
            fontSize: AppTheme.fontAVGARDDSize,
            fontFamily: Helpers.isRtl()
                ? GoogleFonts.almarai().fontFamily
                : AppTheme.fontAVGARDD,
          ),
        ),
        FxSpacing.height(30),
        Obx(
          () => FxText.displaySmall(
            '${_authCtl.customersCounter.value}',
            fontWeight: 600,
            textAlign: TextAlign.center,
            color: Theme.of(context).colorScheme.secondary,
            style: TextStyle(
              fontSize: AppTheme.fontAVGARDDSize,
              fontFamily: Helpers.isRtl()
                  ? GoogleFonts.almarai().fontFamily
                  : AppTheme.fontAVGARDD,
            ),
          ),
        ),
        FxSpacing.height(30),
        FxText.bodySmall(
          AT1Strings.customersTitleDesc.tr,
          textAlign: TextAlign.center,
          fontSize: 20,
          color: Theme.of(context).colorScheme.secondary,
          style: TextStyle(
            fontFamily: Helpers.isRtl()
                ? GoogleFonts.almarai().fontFamily
                : AppTheme.fontVisbyCF,
            fontSize: AppTheme.fontVisbyCFSize,
          ),
        ),
        FxSpacing.height(30),
        FxText.bodySmall(
          AT1Strings.agentCopy.tr,
          textAlign: TextAlign.center,
          fontSize: 20,
          color: Theme.of(context).colorScheme.secondary,
          style: TextStyle(
            fontFamily: Helpers.isRtl()
                ? GoogleFonts.almarai().fontFamily
                : AppTheme.fontVisbyCF,
            fontSize: AppTheme.fontVisbyCFSize,
          ),
        ),
        FxSpacing.height(30),
        GestureDetector(
          onTap: () => _copyToClipboard(context),
          child: Obx(
            () => Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 2.0,
                ),
              ),
              child: Text(
                '${_authCtl.customersCode.value}',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        FxSpacing.height(30),
      ],
    );
  }

  Widget backBtn(BuildContext context) {
    return FxButton.block(
      backgroundColor: Theme.of(context).primaryColor,
      padding: FxSpacing.y(12),
      onPressed: () async {
        Get.offAllNamed(HomeScreen.routeName);
      },
      elevation: 0,
      borderRadiusAll: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FxText.bodySmall(AT1Strings.Continue.tr.toUpperCase(),
              color: Colors.white, fontWeight: 700, letterSpacing: 0.5),
          FxSpacing.width(8),
          const Icon(
            FeatherIcons.chevronRight,
            size: 18,
          )
        ],
      ),
    );
  }
}
