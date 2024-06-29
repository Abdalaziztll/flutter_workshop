// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:clean_arch/features/news/domain/entity/article_entity.dart';

class ArticleModel extends ArticleEntity {
  ArticleModel({
    super.title,
    super.description,
    super.urlToImage,
  });

  ArticleModel copyWith({
    String? title,
    String? description,
    String? urlToImage,
  }) {
    return ArticleModel(
      title: title ?? this.title,
      description: description ?? this.description,
      urlToImage: urlToImage ?? this.urlToImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'urlToImage': urlToImage,
    };
  }

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      urlToImage:
          map['urlToImage'] != null ? map['urlToImage'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleModel.fromJson(String source) =>
      ArticleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ArticleModel(title: $title, description: $description, urlToImage: $urlToImage)';

  @override
  bool operator ==(covariant ArticleModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.urlToImage == urlToImage;
  }

  @override
  int get hashCode =>
      title.hashCode ^ description.hashCode ^ urlToImage.hashCode;
}
