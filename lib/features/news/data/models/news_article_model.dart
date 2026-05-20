// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_article_model.freezed.dart';
part 'news_article_model.g.dart';

@freezed
class NewsArticleModel with _$NewsArticleModel {
  const factory NewsArticleModel({
    @JsonKey(name: 'author') String? author,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'url') required String url,
    @JsonKey(name: 'urlToImage') String? urlToImage,
    @JsonKey(name: 'publishedAt') required DateTime publishedAt,
    @JsonKey(name: 'content') String? content,
    @JsonKey(name: 'source') SourceModel? source,
  }) = _NewsArticleModel;

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleModelFromJson(json);
}

@freezed
class SourceModel with _$SourceModel {
  const factory SourceModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') required String name,
  }) = _SourceModel;

  factory SourceModel.fromJson(Map<String, dynamic> json) =>
      _$SourceModelFromJson(json);
}
