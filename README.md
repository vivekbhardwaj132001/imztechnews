# IMZ News Reader

A production-grade Flutter News Reader App following Clean Architecture and enterprise best practices.

## Features
- **Splash Screen**: Animated logo and initialization.
- **Home Screen**: Categorized news, infinite scroll, pull-to-refresh.
- **Article Detail**: Rich content view with Hero transitions.
- **Bookmarks**: Offline reading support with Hive.
- **Search**: Debounced live search.
- **Settings**: Dark/Light mode and cache management.

## Tech Stack
- **State Management**: Riverpod
- **Navigation**: GoRouter
- **Networking**: Dio
- **Local DB**: Hive
- **Code Gen**: Freezed, JsonSerializable, Riverpod Generator
- **UI**: Material 3, Shimmer, CachedNetworkImage

## Architecture
This project follows **Clean Architecture**:
- `core/`: Shared utilities, themes, and network logic.
- `features/news/domain/`: Business logic, entities, and repository interfaces.
- `features/news/data/`: API models, data sources, and repository implementations.
- `features/news/presentation/`: UI screens, widgets, and providers.

## Setup
1. Clone the repository.
2. Run `flutter pub get`.
3. Create a `.env` file in the root directory (see `.env.example`).
4. Add your API key from [newsapi.org](https://newsapi.org/).
5. Run code generation:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
6. Run the app:
   ```bash
   flutter run
   ```

## Optimization
- `RepaintBoundary` for efficient list rendering.
- `CustomImageCacheManager` for disk cache control.
- `AsyncValue` for robust state handling.
- Repository pattern for data abstraction.
