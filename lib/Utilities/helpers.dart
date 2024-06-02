import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Helpers {
  /// open a web browser (URL)
  static Future<void> launchURL(String url, String schemaUrl) async {
    final uri = Uri.parse(url);
    final schemaUri = Uri.parse(schemaUrl);
    if (await canLaunchUrl(schemaUri)) {
      await launchUrl(schemaUri);
    } else if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  static bool isRtl() {
    return Get.locale?.languageCode == 'ar' ? true : false;
  }

  static Future<bool> isIpad() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    IosDeviceInfo info = await deviceInfo.iosInfo;
    if (info.model.toLowerCase().contains("ipad")) {
      return true;
    }
    return false;
  }
}
