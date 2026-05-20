import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/news_providers.dart';
import '../widgets/news_card.dart';
import '../widgets/news_shimmer.dart';
import '../widgets/animated_news_ticker.dart';

import '../widgets/small_news_card.dart';

import '../widgets/circle_news_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _categories = [
    'general',
    'business',
    'technology',
    'entertainment',
    'sports',
    'science',
    'health'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 140, // Increased to prevent vertical overflow
              floating: true,
              pinned: true,
              elevation: innerBoxIsScrolled ? 2 : 0,
              backgroundColor: innerBoxIsScrolled ? colorScheme.surface : colorScheme.background,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                titlePadding: const EdgeInsets.only(left: 16, bottom: 60),
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 24,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.newspaper_rounded,
                        size: 24,
                        color: Color(0xFF0056D2),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'NEWS IMZ',
                      style: TextStyle(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                _AppBarAction(
                  icon: Icons.search,
                  onPressed: () => context.push('/search'),
                ),
                _AppBarAction(
                  icon: Icons.bookmarks_outlined,
                  onPressed: () => context.push('/bookmarks'),
                ),
                _AppBarAction(
                  icon: Icons.settings_outlined,
                  onPressed: () => context.push('/settings'),
                ),
                const SizedBox(width: 4),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50), // Increased from 48
                child: Container(
                  width: double.infinity,
                  height: 50, // Explicit height
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.withOpacity(0.1)),
                    ),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    indicatorColor: colorScheme.primary,
                    labelColor: colorScheme.primary,
                    unselectedLabelColor: Colors.grey[500],
                    indicatorWeight: 2, // Slightly reduced indicator weight
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
                    padding: EdgeInsets.zero,
                    indicatorPadding: EdgeInsets.zero,
                    tabs: _categories
                        .map((c) => Tab(
                              height: 46, // Ensure tab height fits container
                              text: c.substring(0, 1).toUpperCase() + c.substring(1),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Consumer(
                builder: (context, ref, child) {
                  final newsAsync = ref.watch(newsListProvider('general'));
                  return newsAsync.when(
                    data: (articles) {
                      if (articles.isEmpty) return const SizedBox.shrink();
                      
                      final trendingArticles = articles.take(2).toList();
                      
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedNewsTicker(
                            headlines: articles.map((a) => a.title).toList(),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(16, 24, 16, 12),
                            child: Text(
                              'Top Trending',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF1E293B),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 140,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              itemCount: articles.length > 10 ? 10 : articles.length,
                              itemBuilder: (context, index) {
                                final article = articles[index];
                                return CircleNewsCard(
                                  article: article,
                                  onTap: () => context.push('/article', extra: {
                                    'article': article,
                                    'heroPrefix': 'trending_circle_',
                                  }),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      );
                    },
                    loading: () => const SizedBox.shrink(),
                    error: (_, __) => const SizedBox.shrink(),
                  );
                },
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: _categories.map((category) {
            return NewsListView(category: category);
          }).toList(),
        ),
      ),
    );
  }
}

class _AppBarAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _AppBarAction({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, size: 18), // Smaller icon
        onPressed: onPressed,
        constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
        padding: EdgeInsets.zero,
      ),
    );
  }
}

class NewsListView extends ConsumerWidget {
  final String category;

  const NewsListView({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsAsync = ref.watch(newsListProvider(category));

    return RefreshIndicator(
      onRefresh: () {
        ref.invalidate(newsListProvider(category));
        return ref.read(newsListProvider(category).future);
      },
      child: newsAsync.when(
        data: (articles) {
          if (articles.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.newspaper_outlined, size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No articles found at the moment'),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.only(top: 8, bottom: 20),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return NewsCard(
                article: article,
                heroPrefix: 'list_${category}_',
                onTap: () => context.push('/article', extra: {
                  'article': article,
                  'heroPrefix': 'list_${category}_',
                }),
              );
            },
          );
        },
        loading: () => const NewsShimmer(),
        error: (err, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.wifi_off_rounded, size: 80, color: Colors.blueGrey),
                const SizedBox(height: 16),
                Text(
                  'Unable to load news',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Please check your internet connection and try again.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => ref.invalidate(newsListProvider(category)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
