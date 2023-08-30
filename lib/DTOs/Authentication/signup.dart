class SignupDTO {
  static const _nameKey = 'name';
  static const _emailKey = 'email';
  static const _phoneKey = 'phone';
  static const _passwordKey = 'password';
  static const _registerByKey = 'registerBy';

  final String name;
  final String email;
  final String phone;
  final String password;
  final String? registerBy;

  SignupDTO({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    this.registerBy,
  });

  Map<String, dynamic> toJson() => {
        _nameKey: name,
        _emailKey: email,
        _phoneKey: phone,
        _passwordKey: password,
        _registerByKey: registerBy ?? null,
      };
}
