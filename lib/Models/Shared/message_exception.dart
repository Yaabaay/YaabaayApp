class MessageException implements Exception {
  final String _message;

  MessageException(this._message);

  String get message => _message;
}
