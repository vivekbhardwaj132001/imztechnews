import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/news_article_model.dart';
import 'dart:developer' as dev;

abstract class NewsLocalDataSource {
  Future<void> cacheArticles(List<NewsArticleModel> articles);
  Future<List<NewsArticleModel>> getCachedArticles();
  Future<void> bookmarkArticle(NewsArticleModel article);
  Future<void> removeBookmark(String url);
  Future<List<NewsArticleModel>> getBookmarkedArticles();
  Future<bool> isBookmarked(String url);
}

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  static const String _articlesBoxName = 'articles_box';
  static const String _bookmarksBoxName = 'bookmarks_box';

  Future<Box> _getArticlesBox() async => await Hive.openBox(_articlesBoxName);
  Future<Box> _getBookmarksBox() async => await Hive.openBox(_bookmarksBoxName);

  @override
  Future<void> cacheArticles(List<NewsArticleModel> articles) async {
    try {
      final box = await _getArticlesBox();
      await box.clear();
      for (var article in articles) {
        // Convert to JSON string to avoid Hive Adapter issues
        final jsonString = jsonEncode(article.toJson());
        await box.put(article.url, jsonString);
      }
    } catch (e) {
      dev.log('Error caching articles: $e');
    }
  }

  @override
  Future<List<NewsArticleModel>> getCachedArticles() async {
    try {
      final box = await _getArticlesBox();
      return box.values
          .map((value) {
            try {
              if (value is String) {
                return NewsArticleModel.fromJson(jsonDecode(value));
              }
              return null;
            } catch (e) {
              return null;
            }
          })
          .whereType<NewsArticleModel>()
          .toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> bookmarkArticle(NewsArticleModel article) async {
    try {
      final box = await _getBookmarksBox();
      // Use jsonEncode to ensure it's a simple string
      final jsonString = jsonEncode(article.toJson());
      await box.put(article.url, jsonString);
      dev.log('Bookmarked: ${article.title}');
    } catch (e) {
      dev.log('Error bookmarking: $e');
    }
  }

  @override
  Future<void> removeBookmark(String url) async {
    try {
      final box = await _getBookmarksBox();
      await box.delete(url);
      dev.log('Removed bookmark: $url');
    } catch (e) {
      dev.log('Error removing bookmark: $e');
    }
  }

  @override
  Future<List<NewsArticleModel>> getBookmarkedArticles() async {
    try {
      final box = await _getBookmarksBox();
      final items = <NewsArticleModel>[];
      for (var value in box.values) {
        try {
          if (value is String) {
            items.add(NewsArticleModel.fromJson(jsonDecode(value)));
          } else if (value is Map) {
            // Backward compatibility for old cache
            items.add(NewsArticleModel.fromJson(Map<String, dynamic>.from(value)));
          }
        } catch (e) {
          dev.log('Error parsing bookmarked item: $e');
        }
      }
      return items;
    } catch (e) {
      dev.log('Error getting bookmarks: $e');
      return [];
    }
  }

  @override
  Future<bool> isBookmarked(String url) async {
    try {
      final box = await _getBookmarksBox();
      return box.containsKey(url);
    } catch (e) {
      return false;
    }
  }
}
