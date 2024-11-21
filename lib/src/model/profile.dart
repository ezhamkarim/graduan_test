// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Profile {
  final int id;
  final String name;
  final String email;
  final String email_verified_at;
  final String created_at;
  final String updated_at;
  Profile({
    required this.id,
    required this.name,
    required this.email,
    required this.email_verified_at,
    required this.created_at,
    required this.updated_at,
  });

  Profile copyWith({
    int? id,
    String? name,
    String? email,
    String? email_verified_at,
    String? created_at,
    String? updated_at,
  }) {
    return Profile(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      email_verified_at: email_verified_at ?? this.email_verified_at,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': email_verified_at,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      email_verified_at: map['email_verified_at'] as String,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Profile(id: $id, name: $name, email: $email, email_verified_at: $email_verified_at, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.email_verified_at == email_verified_at &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        email_verified_at.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
