import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Helpers {
  /// open a web browser (URL)
  static Future<void> launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  static bool isRtl() {
    return Get.locale?.languageCode == 'ar' ? true : false;
  }
}
