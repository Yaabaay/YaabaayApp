class ContactUsDTO {
  static const _nameKey = 'name';
  static const _emailKey = 'email';
  static const _phoneKey = 'phone';
  static const _messageKey = 'message';

  final String name;
  final String email;
  final String phone;
  final String message;

  ContactUsDTO({
    required this.name,
    required this.email,
    required this.phone,
    required this.message,
  });

  Map<String, dynamic> toJson() => {
    _nameKey: name,
    _emailKey: email,
    _phoneKey: phone,
    _messageKey: message,
  };
}
