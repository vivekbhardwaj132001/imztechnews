import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import '../providers/news_providers.dart';
import '../widgets/news_card.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchResultsProvider = FutureProvider((ref) async {
  final query = ref.watch(searchQueryProvider);
  if (query.length < 3) return [];
  
  return ref.read(newsRepositoryProvider).searchNews(
    query: query,
    page: 1,
    pageSize: 20,
  );
});

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _controller = TextEditingController();
  Timer? _debounce;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      ref.read(searchQueryProvider.notifier).state = query;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchResults = ref.watch(searchResultsProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Container(
          height: 44,
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: _controller,
            autofocus: true,
            onChanged: _onSearchChanged,
            decoration: InputDecoration(
              hintText: 'Search for news...',
              hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
              prefixIcon: const Icon(Icons.search, size: 20, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              suffixIcon: _controller.text.isNotEmpty 
                ? IconButton(
                    icon: const Icon(Icons.clear, size: 18),
                    onPressed: () {
                      _controller.clear();
                      _onSearchChanged('');
                    },
                  ) 
                : null,
            ),
          ),
        ),
      ),
      body: searchResults.when(
        data: (articles) {
          if (_controller.text.isEmpty) {
            return _buildEmptyState(
              icon: Icons.search_rounded,
              title: 'Discover News',
              subtitle: 'Start typing to find articles about technology, business, or anything else.',
            );
          }
          if (_controller.text.length < 3) {
            return _buildEmptyState(
              icon: Icons.text_fields_rounded,
              title: 'Keep typing...',
              subtitle: 'Search requires at least 3 characters.',
            );
          }
          if (articles.isEmpty) {
            return _buildEmptyState(
              icon: Icons.sentiment_dissatisfied_rounded,
              title: 'No results found',
              subtitle: 'We couldn\'t find any articles matching "${_controller.text}".',
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.only(top: 8, bottom: 20),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return NewsCard(
                article: article,
                heroPrefix: 'search_',
                onTap: () => context.push('/article', extra: {
                  'article': article,
                  'heroPrefix': 'search_',
                }),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 60, color: Colors.red),
              const SizedBox(height: 16),
              const Text('Search failed. Please try again.'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(searchResultsProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState({required IconData icon, required String title, required String subtitle}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: Colors.grey[300]),
            const SizedBox(height: 24),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
            ),
            const SizedBox(height: 12),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[500], height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
