import 'package:get/get.dart';

class ServiceOrderDTO {
  static const _categoryId = 'categoryId';
  static const _name = 'name';
  static const _email = 'email';
  static const _password = 'password';
  static const _phone = 'phone';
  static const _notes = 'notes';
  static const _registerBy = 'registerBy';

  final String? categoryId;
  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final String? notes;
  final String? registerBy;

  ServiceOrderDTO({
    this.categoryId, this.name, this.email, this.password, this.phone, this.notes, this.registerBy,
  });

  Map<String, dynamic> toJson() => generateJsonObj();

  Map<String, dynamic> generateJsonObj() {
    final Map<String, dynamic> obj = <String, dynamic>{};
    if( categoryId != "" ) obj[_categoryId] = categoryId;
    if( name != null && name != "" ) obj[_name] = name;
    if( email != null && email != "" ) obj[_email] = email;
    if( password != null && password != "" ) obj[_password] = password;
    if( phone != null && phone != "" ) obj[_phone] = phone;
    if( notes != null && notes != "" ) obj[_notes] = notes;
    if( registerBy != null && registerBy != "" ) obj[_registerBy] = registerBy;
    return obj;
  }

}
