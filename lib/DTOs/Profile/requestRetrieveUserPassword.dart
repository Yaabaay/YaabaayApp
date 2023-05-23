class RequestRetrieveUserPasswordDTO {
  static const _usernameKey = 'username';

  final String username;

  RequestRetrieveUserPasswordDTO({
    required this.username,
  });

  Map<String, dynamic> toJson() => {
    _usernameKey: username,
  };
}
