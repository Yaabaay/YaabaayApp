import 'dart:convert';

import 'package:app/DTOs/Authentication/notification_token.dart';
import 'package:app/DTOs/Profile/requestRetrieveUserPassword.dart';
import 'package:app/Models/Profile/CustomerModel.dart';
import 'package:app/Models/Shared/messages.dart';
import 'package:app/Services/Authentication/authentication_repository.dart';
import 'package:app/Utilities/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../DTOs/Authentication/login.dart';
import '../DTOs/Authentication/signup.dart';
import '../DTOs/Profile/edit_profile.dart';
import '../Enums/Shared/storage_keys.dart';
import '../Models/Authentication/user.dart';

class AuthenticationController extends GetxController {
  late AuthenticationRepository _repository;
  late GetStorage _storage;

  // ignore: unnecessary_cast
  final Rx<User?> _user = (null as User?).obs;
  User? get user => _user.value;
  set setUser(User user) {
    _user.value = user;
  }

  String? get accessToken => _user.value?.token;

  final _message = "".obs;
  var customersCounter = '0'.obs;
  var customersCode = ''.obs;

  AuthenticationController() {
    _repository = AuthenticationRepository();
    _storage = GetStorage();
  }

  TextEditingController emailTE = TextEditingController(text: '');
  TextEditingController passwordTE = TextEditingController(text: '');

  var showPassword = false.obs;
  updateShowPassword() {
    showPassword.value = !showPassword.value;
  }

  //login
  Future<void> signIn(LoginDTO dto) async {
    try {
      Debug.d('signIn work ...');
      final user = await _repository.signIn(dto);
      await _saveUser(user);
      _user.value = user;
      Debug.d(_user.value!.toJson().toString());
    } catch (error) {
      Debug.e(error);
      _user.value = null;
      rethrow;
    }
  }

  //sign up
  Future<void> signUp(SignupDTO dto) async {
    try {
      final user = await _repository.signUp(dto);
      await _saveUser(user);
      _user.value = user;
      Debug.d(_user.value!.toJson().toString());
    } catch (error) {
      _user.value = null;
      rethrow;
    }
  }

  Future<User?> changeProfile(EditProfileDTO editProfileDTO) async {
    Debug.d('changeProfile work');
    try {
      var user = await _repository.changeProfile(editProfileDTO);
      user = user.copyWith(token: _user.value!.token);
      await _saveUser(user);
      _user.value = user;
    } catch (error) {
      rethrow;
    }
  }

  //Forget Password
  Future<void> requestRetrieveUserPassword(
      RequestRetrieveUserPasswordDTO dto) async {
    try {
      final message = await _repository.requestRetrieveUserPassword(dto);
      _message.value = message.message;
      Debug.d(_message.value);
    } catch (error) {
      Debug.d(error);
      _message.value = "";
      rethrow;
    }
  }

  Future<void> pushNotificationTokenRequest(NotificationTokenDTO dto) async {
    try {
      final message = await _repository.pushNotificationToken(dto);
      Debug.d(message);
    } catch (error) {
      Debug.e(error);
      rethrow;
    }
  }

  Future<void> refreshToken() async {
    try {
      final message = await _repository.refreshToken();
      Debug.d('refreshToken ${message.token}');
      final user = _user.value?.copyWith(token: message.token);
      if (user == null) return;
      await _saveUser(user);
      _user.value = user;
    } catch (error) {
      //_user.value = null;
      Debug.e('refreshToken ${error.toString()}');
      rethrow;
    }
  }

  Future<void> logout() async {
    await _removeUser();
    _user.value = null;
  }

  Future<void> _saveUser(User user) async {
    final obj = user.toJson();
    return _storage.write(StorageKeys.user, obj);
  }

  Future<User?> _getUser() async {
    final obj = await _storage.read(StorageKeys.user);
    if (obj == null) return null;
    return User.fromJson(obj);
  }

  Future<void> _removeUser() async {
    await _storage.remove(StorageKeys.user);
  }

  Future<bool> checkLoggedIn() async {
    try {
      final user = await _getUser();
      if (user == null) return false;
      _user.value = user;
      await refreshToken();
      return true;
    } catch (error) {
      await logout();
      return false;
    }
  }

  Future<CustomerModel> getAgentStatus() async {
    Debug.d('getAgentStatus work ...');
    try {
      return await _repository.getAgentStatus();
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> deleteUserAccount() async {
    Debug.d('deleteUserAccount work ...');
    try {
      await _repository.deleteAccount();
      return true;
    } catch (error) {
      rethrow;
    }
  }
}
