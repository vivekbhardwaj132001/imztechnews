// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_article_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsArticleModel _$NewsArticleModelFromJson(Map<String, dynamic> json) {
  return _NewsArticleModel.fromJson(json);
}

/// @nodoc
mixin _$NewsArticleModel {
  @JsonKey(name: 'author')
  String? get author => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'urlToImage')
  String? get urlToImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'publishedAt')
  DateTime get publishedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'content')
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'source')
  SourceModel? get source => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsArticleModelCopyWith<NewsArticleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsArticleModelCopyWith<$Res> {
  factory $NewsArticleModelCopyWith(
          NewsArticleModel value, $Res Function(NewsArticleModel) then) =
      _$NewsArticleModelCopyWithImpl<$Res, NewsArticleModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'author') String? author,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'url') String url,
      @JsonKey(name: 'urlToImage') String? urlToImage,
      @JsonKey(name: 'publishedAt') DateTime publishedAt,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'source') SourceModel? source});

  $SourceModelCopyWith<$Res>? get source;
}

/// @nodoc
class _$NewsArticleModelCopyWithImpl<$Res, $Val extends NewsArticleModel>
    implements $NewsArticleModelCopyWith<$Res> {
  _$NewsArticleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = freezed,
    Object? title = null,
    Object? description = freezed,
    Object? url = null,
    Object? urlToImage = freezed,
    Object? publishedAt = null,
    Object? content = freezed,
    Object? source = freezed,
  }) {
    return _then(_value.copyWith(
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      urlToImage: freezed == urlToImage
          ? _value.urlToImage
          : urlToImage // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as SourceModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SourceModelCopyWith<$Res>? get source {
    if (_value.source == null) {
      return null;
    }

    return $SourceModelCopyWith<$Res>(_value.source!, (value) {
      return _then(_value.copyWith(source: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NewsArticleModelImplCopyWith<$Res>
    implements $NewsArticleModelCopyWith<$Res> {
  factory _$$NewsArticleModelImplCopyWith(_$NewsArticleModelImpl value,
          $Res Function(_$NewsArticleModelImpl) then) =
      __$$NewsArticleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'author') String? author,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'url') String url,
      @JsonKey(name: 'urlToImage') String? urlToImage,
      @JsonKey(name: 'publishedAt') DateTime publishedAt,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'source') SourceModel? source});

  @override
  $SourceModelCopyWith<$Res>? get source;
}

/// @nodoc
class __$$NewsArticleModelImplCopyWithImpl<$Res>
    extends _$NewsArticleModelCopyWithImpl<$Res, _$NewsArticleModelImpl>
    implements _$$NewsArticleModelImplCopyWith<$Res> {
  __$$NewsArticleModelImplCopyWithImpl(_$NewsArticleModelImpl _value,
      $Res Function(_$NewsArticleModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = freezed,
    Object? title = null,
    Object? description = freezed,
    Object? url = null,
    Object? urlToImage = freezed,
    Object? publishedAt = null,
    Object? content = freezed,
    Object? source = freezed,
  }) {
    return _then(_$NewsArticleModelImpl(
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      urlToImage: freezed == urlToImage
          ? _value.urlToImage
          : urlToImage // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as SourceModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsArticleModelImpl implements _NewsArticleModel {
  const _$NewsArticleModelImpl(
      {@JsonKey(name: 'author') this.author,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'url') required this.url,
      @JsonKey(name: 'urlToImage') this.urlToImage,
      @JsonKey(name: 'publishedAt') required this.publishedAt,
      @JsonKey(name: 'content') this.content,
      @JsonKey(name: 'source') this.source});

  factory _$NewsArticleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsArticleModelImplFromJson(json);

  @override
  @JsonKey(name: 'author')
  final String? author;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'url')
  final String url;
  @override
  @JsonKey(name: 'urlToImage')
  final String? urlToImage;
  @override
  @JsonKey(name: 'publishedAt')
  final DateTime publishedAt;
  @override
  @JsonKey(name: 'content')
  final String? content;
  @override
  @JsonKey(name: 'source')
  final SourceModel? source;

  @override
  String toString() {
    return 'NewsArticleModel(author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsArticleModelImpl &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.urlToImage, urlToImage) ||
                other.urlToImage == urlToImage) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, author, title, description, url,
      urlToImage, publishedAt, content, source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsArticleModelImplCopyWith<_$NewsArticleModelImpl> get copyWith =>
      __$$NewsArticleModelImplCopyWithImpl<_$NewsArticleModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsArticleModelImplToJson(
      this,
    );
  }
}

abstract class _NewsArticleModel implements NewsArticleModel {
  const factory _NewsArticleModel(
          {@JsonKey(name: 'author') final String? author,
          @JsonKey(name: 'title') required final String title,
          @JsonKey(name: 'description') final String? description,
          @JsonKey(name: 'url') required final String url,
          @JsonKey(name: 'urlToImage') final String? urlToImage,
          @JsonKey(name: 'publishedAt') required final DateTime publishedAt,
          @JsonKey(name: 'content') final String? content,
          @JsonKey(name: 'source') final SourceModel? source}) =
      _$NewsArticleModelImpl;

  factory _NewsArticleModel.fromJson(Map<String, dynamic> json) =
      _$NewsArticleModelImpl.fromJson;

  @override
  @JsonKey(name: 'author')
  String? get author;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'url')
  String get url;
  @override
  @JsonKey(name: 'urlToImage')
  String? get urlToImage;
  @override
  @JsonKey(name: 'publishedAt')
  DateTime get publishedAt;
  @override
  @JsonKey(name: 'content')
  String? get content;
  @override
  @JsonKey(name: 'source')
  SourceModel? get source;
  @override
  @JsonKey(ignore: true)
  _$$NewsArticleModelImplCopyWith<_$NewsArticleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SourceModel _$SourceModelFromJson(Map<String, dynamic> json) {
  return _SourceModel.fromJson(json);
}

/// @nodoc
mixin _$SourceModel {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SourceModelCopyWith<SourceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceModelCopyWith<$Res> {
  factory $SourceModelCopyWith(
          SourceModel value, $Res Function(SourceModel) then) =
      _$SourceModelCopyWithImpl<$Res, SourceModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id, @JsonKey(name: 'name') String name});
}

/// @nodoc
class _$SourceModelCopyWithImpl<$Res, $Val extends SourceModel>
    implements $SourceModelCopyWith<$Res> {
  _$SourceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SourceModelImplCopyWith<$Res>
    implements $SourceModelCopyWith<$Res> {
  factory _$$SourceModelImplCopyWith(
          _$SourceModelImpl value, $Res Function(_$SourceModelImpl) then) =
      __$$SourceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id, @JsonKey(name: 'name') String name});
}

/// @nodoc
class __$$SourceModelImplCopyWithImpl<$Res>
    extends _$SourceModelCopyWithImpl<$Res, _$SourceModelImpl>
    implements _$$SourceModelImplCopyWith<$Res> {
  __$$SourceModelImplCopyWithImpl(
      _$SourceModelImpl _value, $Res Function(_$SourceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
  }) {
    return _then(_$SourceModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SourceModelImpl implements _SourceModel {
  const _$SourceModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') required this.name});

  factory _$SourceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SourceModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'name')
  final String name;

  @override
  String toString() {
    return 'SourceModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SourceModelImplCopyWith<_$SourceModelImpl> get copyWith =>
      __$$SourceModelImplCopyWithImpl<_$SourceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SourceModelImplToJson(
      this,
    );
  }
}

abstract class _SourceModel implements SourceModel {
  const factory _SourceModel(
      {@JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'name') required final String name}) = _$SourceModelImpl;

  factory _SourceModel.fromJson(Map<String, dynamic> json) =
      _$SourceModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$SourceModelImplCopyWith<_$SourceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
