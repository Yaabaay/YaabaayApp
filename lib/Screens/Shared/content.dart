import 'package:app/Controllers/app_controller.dart';
import 'package:app/Screens/Main/home.dart';
import 'package:app/Utilities/assets.dart';
import 'package:app/Utilities/screens_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../Enums/Shared/keys.dart';

class ContentScreen extends StatelessWidget {
  static const routeName = '/ContentScreen';
  ContentScreen({Key? key,}) : super(key: key);

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
        title: Text(Get.arguments?[Keys.title] ?? "", style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.secondary),
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
        const SizedBox(height: 20.0,),
        Html(data: """${Get.arguments?[Keys.content] ?? ""}""", style: {
          "*" : Style(
            fontSize: FontSize.large,
            textAlign: TextAlign.justify,
          )
        }),
        const SizedBox(height: 20.0,),
      ],
    );
  }

}
