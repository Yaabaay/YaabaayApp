// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$AuthenticationService extends AuthenticationService {
  _$AuthenticationService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AuthenticationService;

  @override
  Future<Response<dynamic>> signIn(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('auth/signIn');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> signUp(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('auth/signUp');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> requestRetrieveUserPassword(
      Map<String, dynamic> body) {
    final Uri $url = Uri.parse('user/requestRetrieveUserPassword');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> refreshToken() {
    final Uri $url = Uri.parse('auth/refreshToken');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> changeProfile(
    String? name,
    String? gender,
    MultipartFile? avatar,
  ) {
    final Uri $url = Uri.parse('user/changeProfile');
    final List<PartValue> $parts = <PartValue>[
      PartValue<String?>(
        'name',
        name,
      ),
      PartValue<String?>(
        'gender',
        gender,
      ),
      PartValueFile<MultipartFile?>(
        'avatar',
        avatar,
      ),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> pushNotificationToken(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('user/pushNotificationToken');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
