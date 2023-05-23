class Message {
  static const _messageKey = 'message';

  final String message;

  Message({
    required this.message,
  });

  Message copyWith({String? message}) =>
      Message(
        message: message ?? this.message,
      );

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    message: json[_messageKey],
  );

  Map<String, dynamic> toJson() => {
    _messageKey: message,
  };
}
