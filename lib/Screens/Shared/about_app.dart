import 'package:app/Controllers/app_controller.dart';
import 'package:app/Resources/strings.dart';
import 'package:app/Theme/app_theme.dart';
import 'package:app/Utilities/assets.dart';
import 'package:app/Utilities/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutAppScreen extends StatelessWidget {
  static const routeName = '/AboutAppScreen';
  AboutAppScreen({Key? key, String? mail}) : super(key: key);

  String? mail;

  final _appController = Get.find<AppController>();

  OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(
      color: Colors.black54,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AT1Strings.aboutYaabaay.tr,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontFamily: Helpers.isRtl()
                ? GoogleFonts.almarai().fontFamily
                : AppTheme.fontVisbyCF,
          ),
        ),
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
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: _bodyUi(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodyUi(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Image.asset(
            Get.isDarkMode ? Assets.appWhiteLogo : Assets.appLogo,
            height: 80,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Html(
          data: """${_appController.settings.value?.about?.getTran()}""",
          style: {
            "*": Style(
              color: Get.isDarkMode
                  ? Colors.white
                  : Colors.black, // Set color based on mode
              fontFamily: Helpers.isRtl()
                  ? GoogleFonts.almarai().fontFamily
                  : AppTheme.fontVisbyCF,
              fontSize: FontSize.large,
              textAlign: TextAlign.justify,
            )
          },
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
