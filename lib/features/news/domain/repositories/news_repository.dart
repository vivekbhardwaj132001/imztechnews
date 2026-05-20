import '../entities/news_article.dart';

abstract class NewsRepository {
  Future<List<NewsArticle>> getTopHeadlines({
    required String category,
    required int page,
    required int pageSize,
  });

  Future<List<NewsArticle>> searchNews({
    required String query,
    required int page,
    required int pageSize,
  });

  Future<void> bookmarkArticle(NewsArticle article);
  Future<void> removeBookmark(String url);
  Future<List<NewsArticle>> getBookmarkedArticles();
  Future<bool> isBookmarked(String url);
}
