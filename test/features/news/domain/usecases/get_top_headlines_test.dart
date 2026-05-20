import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:imznews/features/news/domain/repositories/news_repository.dart';
import 'package:imznews/features/news/domain/usecases/get_top_headlines.dart';
import 'package:imznews/features/news/domain/entities/news_article.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

void main() {
  late GetTopHeadlines usecase;
  late MockNewsRepository mockRepository;

  setUp(() {
    mockRepository = MockNewsRepository();
    usecase = GetTopHeadlines(mockRepository);
  });

  final tArticles = [
    NewsArticle(
      author: 'Author',
      title: 'Title',
      description: 'Desc',
      url: 'url',
      urlToImage: 'image',
      publishedAt: DateTime.now(),
      content: 'Content',
      sourceName: 'Source',
    )
  ];

  test('should get top headlines from the repository', () async {
    // arrange
    when(() => mockRepository.getTopHeadlines(
          category: any(named: 'category'),
          page: any(named: 'page'),
          pageSize: any(named: 'pageSize'),
        )).thenAnswer((_) async => tArticles);

    // act
    final result = await usecase(category: 'general', page: 1);

    // assert
    expect(result, tArticles);
    verify(() => mockRepository.getTopHeadlines(
          category: 'general',
          page: 1,
          pageSize: 20,
        )).called(1);
  });
}
