import 'package:app/Controllers/app_controller.dart';
import 'package:app/Resources/strings.dart';
import 'package:app/Theme/app_theme.dart';
import 'package:app/Utilities/assets.dart';
import 'package:app/Utilities/helpers.dart';
import 'package:app/Utilities/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Models/Shared/faqs.dart';
import '../../Models/Shared/message_exception.dart';
import '../../Utilities/progress_indicator.dart';

class HelpCenterScreen extends StatefulWidget {
  static const routeName = '/HelpCenterScreen';

  @override
  _HelpCenterScreenState createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  final _appController = Get.find<AppController>();

  List<FaqsModel> content = [];

  OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(
      color: Colors.black54,
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (content.isEmpty) getFaqs();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AT1Strings.helpCenter.tr,
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
          height: 10.0,
        ),
        ExpansionPanelList(
          expandedHeaderPadding: const EdgeInsets.all(0),
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              content[index].isExpanded = !isExpanded;
            });
          },
          animationDuration: const Duration(milliseconds: 500),
          children: expansionPanelList(),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }

  List<ExpansionPanel> expansionPanelList() {
    Debug.d('expansionPanelList called');
    final widgets = <ExpansionPanel>[];
    if (content.isNotEmpty) {
      content.asMap().forEach((index, e) => {
            widgets.add(ExpansionPanel(
                canTapOnHeader: true,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: FxText.titleSmall(e.question?.getTran() ?? "",
                        color: isExpanded
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onBackground,
                        style: TextStyle(
                          fontFamily: Helpers.isRtl()
                              ? GoogleFonts.almarai().fontFamily
                              : AppTheme.fontVisbyCF,
                          fontSize: AppTheme.fontVisbyCFSize,
                        ),
                        textAlign:
                            Helpers.isRtl() ? TextAlign.right : TextAlign.left,
                        fontWeight: isExpanded ? 600 : 500),
                  );
                },
                body: Container(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  child: Center(
                    child: FxText.bodyMedium(
                      e.answer?.getTran() ?? "",
                      fontWeight: 500,
                      color: Theme.of(context).colorScheme.secondary,
                      style: TextStyle(
                        fontFamily: Helpers.isRtl()
                            ? GoogleFonts.almarai().fontFamily
                            : AppTheme.fontVisbyCF,
                        fontSize: AppTheme.fontVisbyCFSize,
                      ),
                    ),
                  ),
                ),
                isExpanded: content[index].isExpanded))
          });
    }
    return widgets;
  }

  Future<void> getFaqs() async {
    try {
      final response = await _appController.getFaqs();
      setState(() {
        content = response;
      });
    } on MessageException catch (error) {
      Get.back();
      Debug.e(error);
    }
  }
}
