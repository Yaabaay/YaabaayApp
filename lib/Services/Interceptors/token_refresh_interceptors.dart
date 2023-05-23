import 'dart:io';
import 'dart:async';
import 'package:chopper/chopper.dart' hide Get;
import 'package:get/get.dart' hide Response;

import '../../Controllers/authentication_controller.dart';
import '../../Screens/Auth/login.dart';

class TokenRefreshInterceptor implements RequestInterceptor, ResponseInterceptor {

  static const _authorizationHeader = 'Authorization';
  static const _tokenType = 'Bearer';

  static final _authController = Get.find<AuthenticationController>();

  @override
  FutureOr<Request> onRequest(Request request) async {

    //Debug.d('Interceptor onRequest: $request');
    final accessToken = _getAccessToken();
    //Debug.d('Interceptor user token : $_authorizationHeader $accessToken');

    return applyHeader(
      request,
      _authorizationHeader,
      accessToken,
      override: false,
    );
  }

  @override
  FutureOr<Response> onResponse(Response response) {
    //Debug.d('Interceptor onResponse: $response');
    if (response.statusCode == HttpStatus.unauthorized) _navigate();
    return response;
  }

  static String _getAccessToken() {
    final accessToken = _authController.accessToken;
    if (accessToken == null) return '';
    return '$_tokenType $accessToken';
  }

  static String getAuthorization() {
    final accessToken = _authController.accessToken;
    if (accessToken == null) return '';
    return '$_tokenType $accessToken';
  }

  static void _navigate() {
    Get.offAllNamed(LoginScreen.routeName);
  }

}