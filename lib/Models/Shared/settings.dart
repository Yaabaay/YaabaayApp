class SettingsModel {

  static const _emailOrPhoneKey = 'emailOrPhone';
  static const _managementEmailKey = 'managementEmail';
  static const _supportEmailKey = 'supportEmail';
  static const _supportNumberKey = 'supportNumber';
  static const _aboutKey = 'about';
  static const _privacyKey = 'privacy';
  static const _termsKey = 'terms';

  String? emailOrPhone;
  String? managementEmail;
  String? supportEmail;
  String? supportNumber;
  String? about;
  String? privacy;
  String? terms;

  SettingsModel(
      {this.emailOrPhone,
        this.managementEmail,
        this.supportEmail,
        this.supportNumber,
        this.about,
        this.privacy,
        this.terms,
      });

  SettingsModel.fromJson(Map<String, dynamic> json) {
    emailOrPhone = json[_emailOrPhoneKey];
    managementEmail = json[_managementEmailKey];
    supportEmail = json[_supportEmailKey];
    supportNumber = json[_supportNumberKey];
    about = json[_aboutKey];
    privacy = json[_privacyKey];
    terms = json[_termsKey];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[_emailOrPhoneKey] = emailOrPhone;
    data[_managementEmailKey] = managementEmail;
    data[_supportEmailKey] = supportEmail;
    data[_supportNumberKey] = supportNumber;
    data[_aboutKey] = about;
    data[_privacyKey] = privacy;
    data[_termsKey] = terms;
    return data;
  }
}