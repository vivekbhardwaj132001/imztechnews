// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newsRepositoryHash() => r'd13f0b1a845fba2c01aabea5e150c1c90fab4f4c';

/// See also [newsRepository].
@ProviderFor(newsRepository)
final newsRepositoryProvider = AutoDisposeProvider<NewsRepository>.internal(
  newsRepository,
  name: r'newsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$newsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NewsRepositoryRef = AutoDisposeProviderRef<NewsRepository>;
String _$newsListHash() => r'7e6e80e9ffcb2feb62a37b3d3e173e1af51cc659';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$NewsList
    extends BuildlessAutoDisposeAsyncNotifier<List<NewsArticle>> {
  late final String category;

  FutureOr<List<NewsArticle>> build(
    String category,
  );
}

/// See also [NewsList].
@ProviderFor(NewsList)
const newsListProvider = NewsListFamily();

/// See also [NewsList].
class NewsListFamily extends Family<AsyncValue<List<NewsArticle>>> {
  /// See also [NewsList].
  const NewsListFamily();

  /// See also [NewsList].
  NewsListProvider call(
    String category,
  ) {
    return NewsListProvider(
      category,
    );
  }

  @override
  NewsListProvider getProviderOverride(
    covariant NewsListProvider provider,
  ) {
    return call(
      provider.category,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'newsListProvider';
}

/// See also [NewsList].
class NewsListProvider
    extends AutoDisposeAsyncNotifierProviderImpl<NewsList, List<NewsArticle>> {
  /// See also [NewsList].
  NewsListProvider(
    String category,
  ) : this._internal(
          () => NewsList()..category = category,
          from: newsListProvider,
          name: r'newsListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$newsListHash,
          dependencies: NewsListFamily._dependencies,
          allTransitiveDependencies: NewsListFamily._allTransitiveDependencies,
          category: category,
        );

  NewsListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final String category;

  @override
  FutureOr<List<NewsArticle>> runNotifierBuild(
    covariant NewsList notifier,
  ) {
    return notifier.build(
      category,
    );
  }

  @override
  Override overrideWith(NewsList Function() create) {
    return ProviderOverride(
      origin: this,
      override: NewsListProvider._internal(
        () => create()..category = category,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<NewsList, List<NewsArticle>>
      createElement() {
    return _NewsListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NewsListProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NewsListRef on AutoDisposeAsyncNotifierProviderRef<List<NewsArticle>> {
  /// The parameter `category` of this provider.
  String get category;
}

class _NewsListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<NewsList, List<NewsArticle>>
    with NewsListRef {
  _NewsListProviderElement(super.provider);

  @override
  String get category => (origin as NewsListProvider).category;
}

String _$bookmarkControllerHash() =>
    r'3089424c97c8d8fe9e06b69f2932080a16ae8f72';

/// See also [BookmarkController].
@ProviderFor(BookmarkController)
final bookmarkControllerProvider = AutoDisposeAsyncNotifierProvider<
    BookmarkController, List<NewsArticle>>.internal(
  BookmarkController.new,
  name: r'bookmarkControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$bookmarkControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BookmarkController = AutoDisposeAsyncNotifier<List<NewsArticle>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
