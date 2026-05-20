import 'package:go_router/go_router.dart';
import '../features/news/presentation/screens/splash_screen.dart';
import '../features/news/presentation/screens/home_screen.dart';
import '../features/news/presentation/screens/article_detail_screen.dart';
import '../features/news/presentation/screens/bookmarks_screen.dart';
import '../features/news/presentation/screens/search_screen.dart';
import '../features/news/presentation/screens/settings_screen.dart';
import '../features/news/domain/entities/news_article.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'article',
          builder: (context, state) {
            if (state.extra is Map<String, dynamic>) {
              final extra = state.extra as Map<String, dynamic>;
              return ArticleDetailScreen(
                article: extra['article'] as NewsArticle,
                heroPrefix: extra['heroPrefix'] as String?,
              );
            }
            final article = state.extra as NewsArticle;
            return ArticleDetailScreen(article: article);
          },
        ),
        GoRoute(
          path: 'bookmarks',
          builder: (context, state) => const BookmarksScreen(),
        ),
        GoRoute(
          path: 'search',
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: 'settings',
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    ),
  ],
);
