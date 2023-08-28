import 'package:app/Models/Profile/AgentModel.dart';
import 'package:app/Models/Profile/CustomerModel.dart';
import 'package:http/http.dart' as http;
import 'package:app/DTOs/Authentication/notification_token.dart';
import 'package:app/DTOs/Authentication/signup.dart';
import 'package:app/DTOs/Profile/requestRetrieveUserPassword.dart';
import 'package:app/Models/Authentication/user_token.dart';
import 'package:app/Models/Shared/messages.dart';
import 'package:app/Utilities/logger.dart';

import '../../DTOs/Profile/edit_profile.dart';
import '../../Enums/Shared/keys.dart';
import 'authentication_service.dart';

import '/DTOs/Authentication/login.dart';
import '/Models/Authentication/user.dart';
import '/Models/Shared/message_exception.dart';

class AuthenticationRepository {
  late AuthenticationService _authenticationService;

  AuthenticationRepository() {
    _authenticationService = AuthenticationService.create();
  }

  Future<User> signIn(LoginDTO dto) async {
    final body = dto.toJson();
    final response = await _authenticationService.signIn(body);
    try {
      final user = User.fromJson(response.body[Keys.userKey]);
      return user;
    } catch (error) {
      throw MessageException(response.error.toString());
    }
  }

  Future<User> signUp(SignupDTO dto) async {
    final body = dto.toJson();
    final response = await _authenticationService.signUp(body);
    try {
      final user = User.fromJson(response.body[Keys.userKey]);
      return user;
    } catch (error) {
      throw MessageException(response.error.toString());
    }
  }

  Future<Message> requestRetrieveUserPassword(
      RequestRetrieveUserPasswordDTO dto) async {
    final body = dto.toJson();
    final response =
        await _authenticationService.requestRetrieveUserPassword(body);
    try {
      final message = Message.fromJson(response.body);
      return message;
    } catch (error) {
      throw MessageException(response.error.toString());
    }
  }

  Future<UserToken> refreshToken() async {
    final response = await _authenticationService.refreshToken();
    Debug.d('refreshToken response ${response.body}');
    try {
      final token = UserToken.fromJson(response.body);
      return token;
    } catch (error) {
      Debug.e('refreshToken error ${response.error}');
      throw MessageException(response.error.toString());
    }
  }

  Future<User> changeProfile(EditProfileDTO dto) async {
    dynamic file;
    if (dto.avatar != null) {
      file = await http.MultipartFile.fromPath(
        'avatar',
        dto.avatar!.path,
      );
    }
    final response = await _authenticationService.changeProfile(
      dto.name,
      dto.gender,
      file,
    );
    try {
      final result = User.fromJson(response.body[Keys.userKey]);
      return result;
    } catch (error) {
      throw MessageException(response.error.toString());
    }
  }

  Future<dynamic> pushNotificationToken(NotificationTokenDTO dto) async {
    final body = dto.toJson();
    Debug.d(body);
    final response = await _authenticationService.pushNotificationToken(body);
    Debug.d('pushNotificationToken response ${response.body}');
    try {
      return response.body;
    } catch (error) {
      Debug.e(error);
      throw MessageException(response.error.toString());
    }
  }

  Future<CustomerModel> getAgentStatus() async {
    final response = await _authenticationService.getAgentStatus();
    Debug.d('getAgentStatus ${response.base.request?.url.toString()}');
    Debug.d('getAgentStatus ${response.bodyString}');
    Debug.d('getAgentStatus ${response.statusCode}');
    Debug.d('getAgentStatus ${response.body}');
    try {
      final customer = CustomerModel.fromJson(response.body);
      return customer;
    } catch (error) {
      Debug.d(error);
      throw MessageException(response.error.toString());
    }
  }
}
