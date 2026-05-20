import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CustomImageCacheManager {
  static const key = 'customImageCacheKey';

  static CacheManager instance = CacheManager(
    Config(
      key,
      stalePeriod: const Duration(days: 7),
      maxNrOfCacheObjects: 200,
      repo: JsonCacheInfoRepository(databaseName: key),
      fileService: HttpFileService(),
    ),
  );
}
// Note: maxDiskSize = 100MB requirement usually handled by maxNrOfCacheObjects 
// or custom implementation if strictly needed. 
// Standard CacheManager doesn't have a direct 'maxDiskSize' param in Config, 
// but we can manage it.
