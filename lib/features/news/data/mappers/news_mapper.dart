import '../../domain/entities/news_article.dart';
import '../models/news_article_model.dart';

extension NewsArticleModelX on NewsArticleModel {
  NewsArticle toEntity({bool isBookmarked = false}) {
    return NewsArticle(
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content,
      sourceName: source?.name ?? 'Unknown',
      isBookmarked: isBookmarked,
    );
  }
}

extension NewsArticleX on NewsArticle {
  NewsArticleModel toModel() {
    return NewsArticleModel(
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content,
      source: SourceModel(name: sourceName),
    );
  }
}
