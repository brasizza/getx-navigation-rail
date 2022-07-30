// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Article {
  final int id;
  final String title;
  final String imageUrl;
  final String newsSite;
  final String summary;
  final String publishedAt;
  final String updatedAt;
  Article({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.newsSite,
    required this.summary,
    required this.publishedAt,
    required this.updatedAt,
  });

  Article copyWith({
    int? id,
    String? title,
    String? imageUrl,
    String? newsSite,
    String? summary,
    String? publishedAt,
    String? updatedAt,
  }) {
    return Article(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      newsSite: newsSite ?? this.newsSite,
      summary: summary ?? this.summary,
      publishedAt: publishedAt ?? this.publishedAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'newsSite': newsSite,
      'summary': summary,
      'publishedAt': publishedAt,
      'updatedAt': updatedAt,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      id: map['id'] as int,
      title: map['title'] as String,
      imageUrl: map['imageUrl'] as String,
      newsSite: map['newsSite'] as String,
      summary: map['summary'] as String,
      publishedAt: map['publishedAt'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) => Article.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Article(id: $id, title: $title, imageUrl: $imageUrl, newsSite: $newsSite, summary: $summary, publishedAt: $publishedAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant Article other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title && other.imageUrl == imageUrl && other.newsSite == newsSite && other.summary == summary && other.publishedAt == publishedAt && other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ imageUrl.hashCode ^ newsSite.hashCode ^ summary.hashCode ^ publishedAt.hashCode ^ updatedAt.hashCode;
  }
}
