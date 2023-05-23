import 'package:app/Enums/Backend/endpoints.dart';
import 'package:app/Services/Interceptors/header_interceptors.dart';
import 'package:app/Services/Interceptors/token_refresh_interceptors.dart';
import 'package:chopper/chopper.dart';

import '../../Enums/Backend/urls.dart';

part 'content_service.chopper.dart';

@ChopperApi()
abstract class ContentService extends ChopperService {

  @Get(path: Endpoints.settings)
  Future<Response> getSettings();

  @Get(path: Endpoints.getAllServices)
  Future<Response> getAllServices();

  @Get(path: Endpoints.sliders)
  Future<Response> getSliders();

  @Post(path: Endpoints.serviceOrderCreateGuest)
  Future<Response> serviceOrderCreateGuest(@Body() Map<String, dynamic> body);

  @Post(path: Endpoints.serviceOrderCreateUser)
  Future<Response> serviceOrderCreateUser(@Body() Map<String, dynamic> body);

  @Post(path: Endpoints.sendContactUs)
  Future<Response> sendContactUs(@Body() Map<String, dynamic> body);

  @Get(path: Endpoints.faqs)
  Future<Response> getFaqs();

  static ContentService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(Urls.base),
      interceptors: [
        HttpLoggingInterceptor(),
        TokenRefreshInterceptor(),
        HeaderInterceptor(),
      ],
      services: [
        _$ContentService(),
      ],
      converter: const JsonConverter(),
    );
    return _$ContentService(client);
  }

}