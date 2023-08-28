import 'dart:async';

import 'package:app/Enums/Backend/endpoints.dart';
import 'package:app/Services/Interceptors/header_interceptors.dart';
import 'package:chopper/chopper.dart' hide Get;
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';

import '../../Enums/Backend/urls.dart';
import '../Interceptors/token_refresh_interceptors.dart';

part 'authentication_service.chopper.dart';

@ChopperApi()
abstract class AuthenticationService extends ChopperService {
  @Post(path: Endpoints.signIn)
  Future<Response> signIn(@Body() Map<String, dynamic> body);

  @Post(path: Endpoints.signUp)
  Future<Response> signUp(@Body() Map<String, dynamic> body);

  @Post(path: Endpoints.requestRetrieveUserPassword)
  Future<Response> requestRetrieveUserPassword(
      @Body() Map<String, dynamic> body);

  @Post(path: Endpoints.refreshToken)
  Future<Response> refreshToken();

  @multipart
  @Post(path: Endpoints.changeProfile)
  Future<Response> changeProfile(@Part() String? name, @Part() String? gender,
      @PartFile() MultipartFile? avatar);

  @Post(path: Endpoints.pushNotificationToken)
  Future<Response> pushNotificationToken(@Body() Map<String, dynamic> body);

  @Post(path: Endpoints.getAgentStatus)
  Future<Response> getAgentStatus();

  static AuthenticationService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(Urls.base),
      interceptors: [
        HttpLoggingInterceptor(),
        TokenRefreshInterceptor(),
        HeaderInterceptor(),
      ],
      services: [
        _$AuthenticationService(),
      ],
      converter: const JsonConverter(),
    );
    return _$AuthenticationService(client);
  }

  //
}
