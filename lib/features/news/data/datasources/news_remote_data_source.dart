import 'package:dio/dio.dart';
import '../models/news_article_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsArticleModel>> getTopHeadlines({
    required String category,
    required int page,
    required int pageSize,
  });

  Future<List<NewsArticleModel>> searchNews({
    required String query,
    required int page,
    required int pageSize,
  });
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final Dio dio;

  NewsRemoteDataSourceImpl(this.dio);

  @override
  Future<List<NewsArticleModel>> getTopHeadlines({
    required String category,
    required int page,
    required int pageSize,
  }) async {
    try {
      final response = await dio.get('/top-headlines', queryParameters: {
        'category': category == 'general' ? null : category,
        'page': page,
        'pageSize': pageSize,
        'country': 'us',
      });

      final List<dynamic>? articlesJson = response.data['articles'];
      if (articlesJson == null) return [];

      return articlesJson
          .map((json) {
            try {
              final model = NewsArticleModel.fromJson(json);
              if (model.title == '[Removed]' || model.url.contains('removed.com')) {
                return null;
              }
              return model;
            } catch (e) {
              return null;
            }
          })
          .whereType<NewsArticleModel>()
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<NewsArticleModel>> searchNews({
    required String query,
    required int page,
    required int pageSize,
  }) async {
    try {
      final response = await dio.get('/everything', queryParameters: {
        'q': query,
        'page': page,
        'pageSize': pageSize,
      });

      final List<dynamic>? articlesJson = response.data['articles'];
      if (articlesJson == null) return [];

      return articlesJson
          .map((json) {
            try {
              final model = NewsArticleModel.fromJson(json);
              if (model.title == '[Removed]') return null;
              return model;
            } catch (e) {
              return null;
            }
          })
          .whereType<NewsArticleModel>()
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
