class LoginDTO {
  static const _usernameKey = 'username';
  static const _passwordKey = 'password';

  final String username;
  final String password;

  LoginDTO({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
      _usernameKey: username,
      _passwordKey: password,
  };
}
