import 'dart:io';
import 'package:dio/dio.dart';

class EditProfileDTO {
  static const _nameKey = 'name';
  static const _genderKey = 'gender';
  static const _avatarKey = 'avatar';

  final String name;
  final String? gender;
  final File? avatar;

  EditProfileDTO({
    required this.name,
    this.gender,
    this.avatar,
  });

  Map<String, dynamic> toJson() => {
    _nameKey : name,
    _genderKey: gender == null ? 'hidden' : gender,
    _avatarKey: avatar == null ? "no file" : avatar?.path,
  };

  Future<FormData> data() async => FormData.fromMap({
    _nameKey: name,
    _genderKey: gender,
    _avatarKey: avatar != null ? await MultipartFile.fromFile(avatar!.path, filename: avatar!.path.split('/').last) : null,
  });

}
