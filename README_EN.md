# Base Flutter Multiplatform Project

## Description

This is a template Flutter project built on **Clean Architecture** principles with modern development practices. The project provides a ready-to-use architectural foundation for building scalable mobile applications.

### Key Features

- ✅ **Clean Architecture** with clear layer separation (Data, Domain, Presentation)
- ✅ **Type-safe navigation** using Go Router with code generation
- ✅ **Centralized error handling** through Result/Failure pattern
- ✅ **Design system** with themes, color palette, and typography
- ✅ **Implementation example** of a feature with HTTP requests and state management
- ✅ **Code generation** for models, DI, routing, and serialization

### What's Included

- **Base architecture**: all necessary abstractions and base classes
- **Example feature**: complete cycle from UI to network requests
- **Design system**: OpenSans fonts, color schemes, spacing
- **CI/CD setup**: ready-to-use build configurations
- **Error handling**: unified approach to network and application errors

## Project Structure

All Flutter code is located in the `lib` directory. The structure is organized by feature-based and Clean Architecture principles:

```
lib/
├── app/                    # Entry point and global configuration
│   ├── main.dart          # Application startup
│   ├── app.dart           # Root widget with theme settings
│   ├── di/                # Dependency Injection configuration
│   └── navigation/        # Navigation setup (Go Router)
├── core/                   # Core functionality and utilities
│   ├── data/              # Base classes for data handling
│   │   ├── base_remote_data_source.dart  # HTTP client abstraction
│   │   └── base_repository.dart           # Base repository
│   ├── error/             # Error handling system
│   │   ├── failure.dart   # Error models (Freezed)
│   │   ├── result.dart    # Result<T> pattern
│   │   └── dio_failure_mapper.dart  # Dio error mapper
│   ├── network/           # Network configuration
│   ├── extensions/        # Dart/Flutter extensions
│   └── presentation/      # Base presentation classes
├── features/              # Application business features
│   └── _example/         # Feature implementation example
│       ├── data/          # Data layer (DTO, datasources, repositories)
│       ├── domain/        # Domain layer (entities, use cases)
│       └── presentation/  # Presentation layer (UI, controllers)
└── shared/                # Reusable components
    ├── design/            # Design system
    │   ├── app_theme.dart   # App themes
    │   ├── app_colors.dart  # Color palette
    │   ├── app_typography.dart # Typography
    │   └── app_spacing.dart  # Spacing
    └── view/              # Base UI components
        ├── app_scaffold.dart    # Custom Scaffold
        ├── error_view.dart     # Error screen
        └── loading_view.dart   # Loading indicator
```

### Organization Principles

- **Feature-first**: each feature in its own directory with full isolation
- **Clean Architecture**: clear separation of responsibilities between layers
- **DRY**: reusable components in `shared/`
- **Single Source of Truth**: configuration in `app/`, base logic in `core/`

## Tech Stack

### State Management
- **[Riverpod](https://riverpod.dev/)** - modern state management with AsyncNotifier
- DevTools support for state debugging
- Type-safe dependencies and automatic .dispose

### Dependency Injection
- **[GetIt](https://pub.dev/packages/get_it) + [Injectable](https://pub.dev/packages/injectable)** - DI container with code generation
- Automatic dependency registration via annotations
- Scope support (singleton, factory, lazySingleton)

### Navigation
- **[Go Router](https://pub.dev/packages/go_router)** - declarative navigation
- **[go_router_builder](https://pub.dev/packages/go_router_builder)** - type-safe routes with code generation
- Nested navigation, guards, deep linking

### Network and Data
- **[Dio](https://pub.dev/packages/dio)** - powerful HTTP client
- **[Floor](https://pub.dev/packages/floor)** - ORM for SQLite
- **[Cached Network Image](https://pub.dev/packages/cached_network_image)** - image caching

### Models and Serialization
- **[Freezed](https://pub.dev/packages/freezed)** - immutable classes with code generation
- **[JSON Annotation](https://pub.dev/packages/json_annotation)** - JSON serialization
- **[Build Runner](https://pub.dev/packages/build_runner)** - automatic code generation

### Architecture
- **Clean Architecture** - separation into Data, Domain, Presentation layers
- **Repository Pattern** - data source abstraction
- **Use Case Pattern** - business logic encapsulation
- **Result/Failure Pattern** - error handling

### UI and Design
- **Material 3** - modern design from Google
- **Custom design system** - colors, typography, spacing
- **Dark/Light themes** - automatic switching
- **Adaptive UI** - adaptation to different screen sizes

## Requirements and Build

### System Requirements
- **Flutter SDK**: stable channel (recommended version from project)
- **Dart SDK**: comes with Flutter
- **Android Studio** or **IntelliJ IDEA** with Flutter & Dart plugins
- **Android SDK**: minimum API level 21, recommended and tested on API level 34

### Initial Setup

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd base_multiplatform_project
   ```

2. **Ensure** the project path contains only ASCII characters (no Cyrillic)

3. **Install dependencies** and generate code:
   ```bash
   flutter pub get
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the application**:
   ```bash
   flutter run
   ```

### Code Generation

The project actively uses code generation. After changes in:
- Models (Freezed/JSON) - run `flutter pub run build_runner build`
- DI (Injectable) - run `flutter pub run build_runner build`
- Routes (Go Router) - run `flutter pub run build_runner build`

For development use watch mode:
```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

### Troubleshooting

If you encounter build issues:
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Important Notes for Windows Users

The project must be located in a path without non-ASCII characters (Cyrillic is not allowed, spaces are fine). Avoid placing the project inside Documents, especially if it is managed by OneDrive or Windows Controlled Folder Access. These restrictions are important for Flutter code generation, asset processing, and shader compilation.

## How to Add a New Feature

1. **Create directory structure** in `lib/features/your_feature/`:
   ```
   your_feature/
   ├── data/
   │   ├── datasources/
   │   ├── models/
   │   └── repositories/
   ├── domain/
   │   ├── entities/
   │   ├── repositories/
   │   └── usecases/
   └── presentation/
       ├── ui/
       └── controllers/
   ```

2. **Define Entity** in `domain/entities/`
3. **Create Repository interface** in `domain/repositories/`
4. **Implement Repository** in `data/repositories/`
5. **Create Use Cases** in `domain/usecases/`
6. **Implement UI** in `presentation/ui/`
7. **Add route** in `app/navigation/router.dart`
8. **Register dependencies** via `@Injectable` annotations

## Usage Examples

### HTTP Request with Error Handling
```dart
class ExampleRepository extends BaseRepository {
  final ExampleRemoteDataSource _dataSource;

  ExampleRepository(this._dataSource);

  Future<Result<List<ExampleEntity>>> getExamples() async {
    return safeMap(
      () => _dataSource.getListJson('/examples'),
      mapper: (json) => json.map((e) => ExampleModel.fromJson(e).toEntity()).toList(),
    );
  }
}
```

### State Management with Riverpod
```dart
final exampleControllerProvider = AsyncNotifierProvider<ExampleController, List<ExampleEntity>>(
  () => ExampleController(),
);

class ExampleController extends AsyncNotifier<List<ExampleEntity>> {
  late final GetExamplesUseCase _getExamples;

  @override
  Future<List<ExampleEntity>> build() async {
    _getExamples = ref.watch(getExamplesUseCaseProvider);
    return [];
  }

  Future<void> loadExamples() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _getExamples());
  }
}
```

### Type-safe Navigation
```dart
@TypedGoRoute<ExampleRoute>(path: '/example')
class ExampleRoute extends GoRouteData {
  const ExampleRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ExampleScreen();
}

// Navigation:
context.go(const ExampleRoute().location);
```

## Development Guidelines

### Principles
- **SOLID**: follow single responsibility, open/closed principles
- **DRY**: avoid code duplication
- **KISS**: write simple and understandable code
- **TDD**: write tests before implementation

### Code Style
- Use `dart format` for formatting
- Follow `effective_dart` recommendations
- Add documentation to public APIs
- Use strict typing

### Testing
- Write unit tests for Use Cases
- Write widget tests for UI components
- Use mock classes for dependencies

## License

This project is a template and can be used as a basis for commercial and non-commercial projects.
