import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../domain/entities/news_article.dart';
import '../../domain/repositories/news_repository.dart';
import '../../data/repositories/news_repository_impl.dart';
import '../../data/datasources/news_remote_data_source.dart';
import '../../data/datasources/news_local_data_source.dart';
import '../../../../core/network/dio_client.dart';

part 'news_providers.g.dart';

@riverpod
NewsRepository newsRepository(NewsRepositoryRef ref) {
  final dio = createDio();
  return NewsRepositoryImpl(
    remoteDataSource: NewsRemoteDataSourceImpl(dio),
    localDataSource: NewsLocalDataSourceImpl(),
    connectivity: Connectivity(),
  );
}

@riverpod
class NewsList extends _$NewsList {
  @override
  FutureOr<List<NewsArticle>> build(String category) async {
    return ref.read(newsRepositoryProvider).getTopHeadlines(
      category: category,
      page: 1,
      pageSize: 20,
    );
  }

  Future<void> loadMore() async {
    // Implementation for pagination
  }
}

@riverpod
class BookmarkController extends _$BookmarkController {
  @override
  FutureOr<List<NewsArticle>> build() async {
    return ref.read(newsRepositoryProvider).getBookmarkedArticles();
  }

  Future<void> toggleBookmark(NewsArticle article) async {
    final repository = ref.read(newsRepositoryProvider);
    final isCurrentlyBookmarked = await repository.isBookmarked(article.url);
    
    // Optimistic update
    final previousState = state.value ?? [];
    if (isCurrentlyBookmarked) {
      state = AsyncData(previousState.where((a) => a.url != article.url).toList());
      await repository.removeBookmark(article.url);
    } else {
      final updatedArticle = article.copyWith(isBookmarked: true);
      state = AsyncData([...previousState, updatedArticle]);
      await repository.bookmarkArticle(updatedArticle);
    }
    // Refresh to ensure sync
    ref.invalidateSelf();
  }
}
