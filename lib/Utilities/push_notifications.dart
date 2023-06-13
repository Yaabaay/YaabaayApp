// import 'dart:convert';
// import 'package:app/Enums/Shared/settings.dart';
// import 'package:app/Utilities/logger.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';
// import 'package:get/get.dart';

// import '../Enums/Shared/notification_type.dart';

// abstract class PushNotifications {
//   static const _typeKey = 'type';
//   static const _valueKey = 'value';

//   static Future<void> initialization() async {
//     OneSignal.shared.setAppId(Settings.oneSignalAppId);
//     OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
//     await OneSignal.shared.promptUserForPushNotificationPermission();
//     OneSignal.shared.setNotificationOpenedHandler(_handleNotifications);
//   }

//   static Future<String?> getToken() async {
//     final status = await OneSignal.shared.getDeviceState();
//     return status?.userId;
//   }

//   static Future<void> _handleNotifications(
//       OSNotificationOpenedResult msg) async {
//     final data = msg.notification.additionalData;
//     Debug.d('additionalData 1: $data');
//     if (data == null) return;
//     final info = jsonDecode(jsonEncode(data));
//     Debug.d('additionalData 2: $info');
//     if (info == null) return;
//   }

//   static Future<void> _handleNotificationType(String type, Map data) async {
//     Debug.d('_handleNotificationType type: $type data: $data');
//     if (type == NotificationType.message.name) {}
//   }
// }
