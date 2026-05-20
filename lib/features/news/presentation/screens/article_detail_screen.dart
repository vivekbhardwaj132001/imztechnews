import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:share_plus/share_plus.dart';
import '../../domain/entities/news_article.dart';
import '../providers/news_providers.dart';
import '../../../../core/utils/read_time_estimator.dart';
import 'package:intl/intl.dart';

class ArticleDetailScreen extends ConsumerWidget {
  final NewsArticle article;
  final String? heroPrefix;

  const ArticleDetailScreen({super.key, required this.article, this.heroPrefix});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readTime = ReadTimeEstimator.estimate(article.content);
    final bookmarks = ref.watch(bookmarkControllerProvider);
    final isBookmarked = bookmarks.value?.any((a) => a.url == article.url) ?? false;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            stretch: true,
            backgroundColor: Colors.white,
            leading: _CircularButton(
              icon: Icons.arrow_back,
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              _CircularButton(
                icon: isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                iconColor: isBookmarked ? Colors.amber : null,
                onPressed: () => ref
                    .read(bookmarkControllerProvider.notifier)
                    .toggleBookmark(article),
              ),
              _CircularButton(
                icon: Icons.share_outlined,
                onPressed: () => Share.share('${article.title}\n\n${article.url}'),
              ),
              const SizedBox(width: 12),
            ],
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.zoomBackground],
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: '${heroPrefix ?? ''}${article.url}',
                    child: article.urlToImage != null
                        ? CachedNetworkImage(
                            imageUrl: article.urlToImage!,
                            fit: BoxFit.cover,
                          )
                        : Container(color: Colors.grey[200]),
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black26,
                          Colors.transparent,
                          Colors.black54,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(24.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          article.sourceName,
                          style: TextStyle(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(Icons.access_time, size: 14, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        '$readTime min read',
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    article.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                          height: 1.3,
                          color: const Color(0xFF1E293B),
                        ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: colorScheme.primary.withOpacity(0.1),
                        child: Icon(Icons.person, size: 14, color: colorScheme.primary),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          article.author ?? 'Unknown Author',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        DateFormat('MMMM dd, yyyy').format(article.publishedAt),
                        style: TextStyle(color: Colors.grey[500], fontSize: 12),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Divider(color: Color(0xFFF1F5F9)),
                  ),
                  if (article.description != null) ...[
                    Text(
                      article.description!,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.grey[700],
                            height: 1.5,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                    const SizedBox(height: 24),
                  ],
                  Text(
                    article.content ?? 'Full content not available.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFF334155),
                          height: 1.8,
                          fontSize: 16,
                        ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Open in browser
                      },
                      icon: const Icon(Icons.open_in_new),
                      label: const Text('Read Full Article'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CircularButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? iconColor;

  const _CircularButton({
    required this.icon,
    required this.onPressed,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: iconColor ?? const Color(0xFF1E293B), size: 20),
        onPressed: onPressed,
      ),
    );
  }
}
