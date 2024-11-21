// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Post {
  final int id;
  final String title;
  final String created_at;
  final String updated_at;
  Post({
    required this.id,
    required this.title,
    required this.created_at,
    required this.updated_at,
  });

  Post copyWith({
    int? id,
    String? title,
    String? created_at,
    String? updated_at,
  }) {
    return Post(
      id: id ?? this.id,
      title: title ?? this.title,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, String> toMap() {
    return <String, String>{
      // 'id': id,
      'title': title,
      // 'created_at': created_at,
      // 'updated_at': updated_at,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] as int,
      title: map['title'] as String,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Post(id: $id, title: $title, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
