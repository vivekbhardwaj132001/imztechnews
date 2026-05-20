import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/news_providers.dart';
import '../widgets/news_card.dart';

class BookmarksScreen extends ConsumerWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarksAsync = ref.watch(bookmarkControllerProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Articles'),
      ),
      body: bookmarksAsync.when(
        data: (articles) {
          if (articles.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withOpacity(0.05),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.bookmark_border_rounded, size: 80, color: colorScheme.primary.withOpacity(0.2)),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'No saved articles',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Articles you bookmark will appear here for offline reading.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[500], height: 1.5),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () => context.go('/'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Go to Home'),
                    ),
                  ],
                ),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.only(top: 8, bottom: 20),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return Dismissible(
                key: Key('bookmark_${article.url}'),
                direction: DismissDirection.endToStart,
                background: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 24),
                  child: const Icon(Icons.delete_outline, color: Colors.white, size: 28),
                ),
                onDismissed: (_) {
                  ref
                      .read(bookmarkControllerProvider.notifier)
                      .toggleBookmark(article);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Article removed from bookmarks'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                child: NewsCard(
                  article: article,
                  heroPrefix: 'bookmark_',
                  onTap: () => context.push('/article', extra: {
                    'article': article,
                    'heroPrefix': 'bookmark_',
                  }),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              const Text('Failed to load bookmarks'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(bookmarkControllerProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
