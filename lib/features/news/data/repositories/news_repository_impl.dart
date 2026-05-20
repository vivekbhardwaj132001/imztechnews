import '../../domain/entities/news_article.dart';
import '../../domain/repositories/news_repository.dart';
import '../datasources/news_local_data_source.dart';
import '../datasources/news_remote_data_source.dart';
import '../mappers/news_mapper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;
  final NewsLocalDataSource localDataSource;
  final Connectivity connectivity;

  NewsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.connectivity,
  });

  @override
  Future<List<NewsArticle>> getTopHeadlines({
    required String category,
    required int page,
    required int pageSize,
  }) async {
    final connectivityResult = await connectivity.checkConnectivity();
    if (!connectivityResult.contains(ConnectivityResult.none)) {
      try {
        final models = await remoteDataSource.getTopHeadlines(
          category: category,
          page: page,
          pageSize: pageSize,
        );
        if (page == 1 && category == 'general') {
          await localDataSource.cacheArticles(models);
        }
        
        return Future.wait(models.map((model) async {
          final bookmarked = await localDataSource.isBookmarked(model.url);
          return model.toEntity(isBookmarked: bookmarked);
        }));
      } catch (e) {
        // Fallback to cache if remote fails
        return _getCachedArticles();
      }
    } else {
      return _getCachedArticles();
    }
  }

  Future<List<NewsArticle>> _getCachedArticles() async {
    final cachedModels = await localDataSource.getCachedArticles();
    return Future.wait(cachedModels.map((model) async {
      final bookmarked = await localDataSource.isBookmarked(model.url);
      return model.toEntity(isBookmarked: bookmarked);
    }));
  }

  @override
  Future<List<NewsArticle>> searchNews({
    required String query,
    required int page,
    required int pageSize,
  }) async {
    final models = await remoteDataSource.searchNews(
      query: query,
      page: page,
      pageSize: pageSize,
    );
    return Future.wait(models.map((model) async {
      final bookmarked = await localDataSource.isBookmarked(model.url);
      return model.toEntity(isBookmarked: bookmarked);
    }));
  }

  @override
  Future<void> bookmarkArticle(NewsArticle article) async {
    await localDataSource.bookmarkArticle(article.toModel());
  }

  @override
  Future<void> removeBookmark(String url) async {
    await localDataSource.removeBookmark(url);
  }

  @override
  Future<List<NewsArticle>> getBookmarkedArticles() async {
    final models = await localDataSource.getBookmarkedArticles();
    return models.map((m) => m.toEntity(isBookmarked: true)).toList();
  }

  @override
  Future<bool> isBookmarked(String url) async {
    return localDataSource.isBookmarked(url);
  }
}
