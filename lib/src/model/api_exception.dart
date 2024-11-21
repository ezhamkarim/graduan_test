// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ApiException {
  final String code;
  final String message;
  ApiException({
    required this.code,
    required this.message,
  });

  ApiException copyWith({
    String? code,
    String? message,
  }) {
    return ApiException(
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'message': message,
    };
  }

  factory ApiException.fromMap(Map<String, dynamic> map) {
    return ApiException(
      code: map['code'] as String,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiException.fromJson(String source) =>
      ApiException.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ApiException(code: $code, message: $message)';

  @override
  bool operator ==(covariant ApiException other) {
    if (identical(this, other)) return true;

    return other.code == code && other.message == message;
  }

  @override
  int get hashCode => code.hashCode ^ message.hashCode;
}
