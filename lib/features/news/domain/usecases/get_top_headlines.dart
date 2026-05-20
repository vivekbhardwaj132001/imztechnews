import '../entities/news_article.dart';
import '../repositories/news_repository.dart';

class GetTopHeadlines {
  final NewsRepository repository;

  GetTopHeadlines(this.repository);

  Future<List<NewsArticle>> call({
    required String category,
    required int page,
    int pageSize = 20,
  }) {
    return repository.getTopHeadlines(
      category: category,
      page: page,
      pageSize: pageSize,
    );
  }
}
