import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:imznews/features/news/domain/entities/news_article.dart';
import 'package:imznews/features/news/presentation/widgets/news_card.dart';
import 'package:imznews/core/theme/app_theme.dart';

void main() {
  final tArticle = NewsArticle(
    author: 'Author',
    title: 'Test Title',
    description: 'Test Desc',
    url: 'https://test.com',
    urlToImage: null,
    publishedAt: DateTime.now(),
    content: 'Test Content',
    sourceName: 'Test Source',
  );

  testWidgets('NewsCard should render title and source', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        home: Scaffold(
          body: NewsCard(
            article: tArticle,
            onTap: () {},
          ),
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Source'), findsOneWidget);
  });
}
