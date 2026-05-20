// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsArticleModelImpl _$$NewsArticleModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NewsArticleModelImpl(
      author: json['author'] as String?,
      title: json['title'] as String,
      description: json['description'] as String?,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      content: json['content'] as String?,
      source: json['source'] == null
          ? null
          : SourceModel.fromJson(json['source'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NewsArticleModelImplToJson(
        _$NewsArticleModelImpl instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'content': instance.content,
      'source': instance.source,
    };

_$SourceModelImpl _$$SourceModelImplFromJson(Map<String, dynamic> json) =>
    _$SourceModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$SourceModelImplToJson(_$SourceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
