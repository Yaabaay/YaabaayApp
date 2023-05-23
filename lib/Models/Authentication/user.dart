class User {
  static const _idKey = '_id';
  static const _nameKey = 'name';
  static const _emailKey = 'email';
  static const _mobileKey = 'phone';
  static const _tokenKey = 'token';
  static const _avatarKey = 'avatar';

  final String? id;
  final String? name;
  final String? email;
  final String? mobile;
  final String? token;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.mobile,
    this.token,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? mobile,
    String? token,
  }) =>
      User(
        id: id ?? this.id,
        token: token ?? this.token,
        name: name ?? this.name,
        email: email ?? this.email,
        mobile: email ?? this.mobile,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json[_idKey],
        name: json[_nameKey],
        email: json[_emailKey],
        mobile: json[_mobileKey],
        token: json[_tokenKey],
      );

  Map<String, dynamic> toJson() => {
        _idKey: id,
        _nameKey: name,
        _emailKey: email,
        _mobileKey: mobile,
        _tokenKey: token,
      };
}
