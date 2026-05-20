import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_article.freezed.dart';

@freezed
class NewsArticle with _$NewsArticle {
  const factory NewsArticle({
    required String? author,
    required String title,
    required String? description,
    required String url,
    required String? urlToImage,
    required DateTime publishedAt,
    required String? content,
    required String sourceName,
    @Default(false) bool isBookmarked,
  }) = _NewsArticle;
}
