class NotificationTokenDTO {
  static const _token = 'token';
  static const _type = 'type';
  static const _language = 'language';

  final String? token;
  final String? type;
  final String? language;

  NotificationTokenDTO({this.token, this.type, this.language,});

  Map<String, dynamic> toJson() => {
    _token: token,
    _type: type,
    _language: language,
  };
}
