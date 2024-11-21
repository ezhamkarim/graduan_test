// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginCredential {
  final String email;
  final String password;
  LoginCredential({
    required this.email,
    required this.password,
  });

  LoginCredential copyWith({
    String? email,
    String? password,
  }) {
    return LoginCredential(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, String> toMap() {
    return <String, String>{
      'email': email,
      'password': password,
    };
  }

  factory LoginCredential.fromMap(Map<String, dynamic> map) {
    return LoginCredential(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginCredential.fromJson(String source) =>
      LoginCredential.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginCredential(email: $email, password: $password)';

  @override
  bool operator ==(covariant LoginCredential other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
