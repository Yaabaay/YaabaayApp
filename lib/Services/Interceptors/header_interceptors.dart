import 'dart:async';
import 'package:chopper/chopper.dart' hide Get;
import 'package:get/get.dart' hide Response;

class HeaderInterceptor implements RequestInterceptor {

  static const _acceptLanguage = 'Accept-Language';

  @override
  FutureOr<Request> onRequest(Request request) async {

    final deviceLocale = Get.locale?.languageCode ?? "en";

    return applyHeader(
      request,
      _acceptLanguage,
      deviceLocale,
      override: false,
    );
  }

}