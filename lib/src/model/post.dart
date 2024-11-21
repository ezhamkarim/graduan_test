// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Post {
  final String id;
  final String title;
  Post({
    required this.id,
    required this.title,
  });

  Post copyWith({
    String? id,
    String? title,
  }) {
    return Post(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, String> toMap() {
    return <String, String>{
      // 'id': id,
      'title': title,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Post(id: $id, title: $title)';

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
