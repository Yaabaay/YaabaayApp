import 'package:app/Screens/Auth/login.dart';
import 'package:app/Screens/Auth/signup.dart';
import 'package:app/Utilities/logger.dart';
import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart';
import 'dart:async';

abstract class DeepLinking {
  static const _agentPath = 'agent';

  static late StreamSubscription _linksStream;

  static Future<bool> initialize() async {
    final initialUri = await getInitialUri();
    if (initialUri != null) return _handleURI(initialUri);
    _linksStream = uriLinkStream.listen(_handleURI, onError: (error) {});
    return false;
  }

  static Future<void> dispose() async {
    await _linksStream.cancel();
  }

  static bool _handleURI(Uri? uri) {
    try {
      if (uri == null) return false;
      if (uri.pathSegments.contains(_agentPath)) {
        return _handleAgentLinks(uri);
      }
      return false;
    } catch (error) {
      return false;
    }
  }

  static bool _handleAgentLinks(Uri uri) {
    Debug.d(_agentPath);
    final pathIdx = uri.pathSegments.indexOf(_agentPath);
    Debug.d(pathIdx);
    final agentIdx = pathIdx + 1;
    Debug.d(uri.pathSegments[agentIdx]);
    Get.offAllNamed(
      SignupScreen.routeName,
      arguments: uri.pathSegments[agentIdx],
    );
    return true;
  }
}
