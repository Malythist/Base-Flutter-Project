# Base Flutter Multiplatform Project

## Описание

Это шаблонный Flutter-проект, построенный на принципах **Clean Architecture** с использованием современных практик разработки. Проект предоставляет готовую архитектурную основу для создания масштабируемых мобильных приложений.

### Ключевые особенности

- ✅ **Clean Architecture** с четким разделением на слои (Data, Domain, Presentation)
- ✅ **Type-safe навигация** с использованием Go Router и кодогенерацией
- ✅ **Централизованная обработка ошибок** через Result/Failure паттерн
- ✅ **Дизайн-система** с темами, цветовой палитрой и типографикой
- ✅ **Пример реализации** фичи с HTTP-запросами и состоянием
- ✅ **Кодогенерация** для моделей, DI, роутинга и сериализации

### Что уже включено

- **Базовая архитектура**: все необходимые абстракции и базовые классы
- **Пример фичи**: полный цикл от UI до сетевого запроса
- **Дизайн-система**: шрифты OpenSans, цветовые схемы, отступы
- **Настройка CI/CD**: готовые конфигурации для сборки
- **Обработка ошибок**: унифицированный подход к ошибкам сети и приложения

## Структура проекта

Весь Flutter код находится в директории `lib`. Структура организована по принципу feature-based и Clean Architecture:

```
lib/
├── app/                    # Точка входа и глобальная конфигурация
│   ├── main.dart          # Запуск приложения
│   ├── app.dart           # Корневой виджет с настройками темы
│   ├── di/                # Конфигурация Dependency Injection
│   └── navigation/        # Настройка навигации (Go Router)
├── core/                   # Базовая функциональность и утилиты
│   ├── data/              # Базовые классы для работы с данными
│   │   ├── base_remote_data_source.dart  # Абстракция HTTP-клиента
│   │   └── base_repository.dart           # Базовый репозиторий
│   ├── error/             # Система обработки ошибок
│   │   ├── failure.dart   # Модели ошибок (Freezed)
│   │   ├── result.dart    # Result<T> паттерн
│   │   └── dio_failure_mapper.dart  # Маппер ошибок Dio
│   ├── network/           # Конфигурация сети
│   ├── extensions/        # Расширения для Dart/Flutter
│   └── presentation/      # Базовые презентационные классы
├── features/              # Бизнес-фичи приложения
│   └── _example/         # Пример реализации фичи
│       ├── data/          # Data layer (DTO, datasources, repositories)
│       ├── domain/        # Domain layer (entities, use cases)
│       └── presentation/  # Presentation layer (UI, controllers)
└── shared/                # Переиспользуемые компоненты
    ├── design/            # Дизайн-система
    │   ├── app_theme.dart   # Темы приложения
    │   ├── app_colors.dart  # Цветовая палитра
    │   ├── app_typography.dart # Типографика
    │   └── app_spacing.dart  # Отступы
    └── view/              # Базовые UI компоненты
        ├── app_scaffold.dart    # Каcтомный Scaffold
        ├── error_view.dart     # Экран ошибок
        └── loading_view.dart   # Индикатор загрузки
```

### Принципы организации

- **Feature-first**: каждая фича в своей директории с полной изоляцией
- **Clean Architecture**: четкое разделение ответственности между слоями
- **DRY**: переиспользуемые компоненты в `shared/`
- **Single Source of Truth**: конфигурация в `app/`, базовая логика в `core/`

## Технологический стек

### State Management
- **[Riverpod](https://riverpod.dev/)** - современное управление состоянием с AsyncNotifier
- Поддержка DevTools для отладки состояния
- Type-safe зависимости и автоматическая.dispose

### Dependency Injection
- **[GetIt](https://pub.dev/packages/get_it) + [Injectable](https://pub.dev/packages/injectable)** - DI контейнер с кодогенерацией
- Автоматическая регистрация зависимостей через аннотации
- Поддержка скоупов (singleton, factory, lazySingleton)

### Навигация
- **[Go Router](https://pub.dev/packages/go_router)** - декларативная навигация
- **[go_router_builder](https://pub.dev/packages/go_router_builder)** - type-safe роуты с кодогенерацией
- Вложенная навигация, guard'ы, deep linking

### Сеть и данные
- **[Dio](https://pub.dev/packages/dio)** - мощный HTTP клиент
- **[Floor](https://pub.dev/packages/floor)** - ORM для SQLite
- **[Cached Network Image](https://pub.dev/packages/cached_network_image)** - кэширование изображений

### Модели и сериализация
- **[Freezed](https://pub.dev/packages/freezed)** - immutable классы с кодогенерацией
- **[JSON Annotation](https://pub.dev/packages/json_annotation)** - сериализация JSON
- **[Build Runner](https://pub.dev/packages/build_runner)** - автоматическая кодогенерация

### Архитектура
- **Clean Architecture** - разделение на Data, Domain, Presentation слои
- **Repository Pattern** - абстракция источников данных
- **Use Case Pattern** - инкапсуляция бизнес-логики
- **Result/Failure Pattern** - обработка ошибок

### UI и дизайн
- **Material 3** - современный дизайн от Google
- **Кастомная дизайн-система** - цвета, типографика, отступы
- **Dark/Light темы** - автоматическое переключение
- **Adaptive UI** - адаптация под разные размеры экранов

## Требования и сборка

### Системные требования
- **Flutter SDK**: stable channel (рекомендуется версия из проекта)
- **Dart SDK**: поставляется вместе с Flutter
- **Android Studio** или **IntelliJ IDEA** с плагинами Flutter & Dart
- **Android SDK**: minimum API level 21, рекомендуется и тестируется на API level 34

### Первоначальная настройка

1. **Клонируйте репозиторий**:
   ```bash
   git clone <repository-url>
   cd base_multiplatform_project
   ```

2. **Убедитесь**, что путь к проекту содержит только ASCII символы (без кириллицы)

3. **Установите зависимости** и сгенерируйте код:
   ```bash
   flutter pub get
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Запустите приложение**:
   ```bash
   flutter run
   ```

### Кодогенерация

Проект активно использует кодогенерацию. После изменений в:
- Моделях (Freezed/JSON) - запустите `flutter pub run build_runner build`
- DI (Injectable) - запустите `flutter pub run build_runner build`
- Роутах (Go Router) - запустите `flutter pub run build_runner build`

Для разработки используйте watch режим:
```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

### Решение проблем

Если возникли проблемы со сборкой:
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Важные замечания для Windows пользователей

Проект должен находиться в пути без не-ASCII символов (кириллица не допускается, пробелы допустимы). Избегайте размещения проекта в папке Documents, особенно если она синхронизируется через OneDrive или защищена Controlled Folder Access Windows. Эти ограничения важны для корректной работы кодогенерации Flutter, обработки ассетов и компиляции шейдеров.

## Как добавить новую фичу

1. **Создайте структуру директорий** в `lib/features/your_feature/`:
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

2. **Определите Entity** в `domain/entities/`
3. **Создайте Repository interface** в `domain/repositories/`
4. **Реализуйте Repository** в `data/repositories/`
5. **Создайте Use Cases** в `domain/usecases/`
6. **Реализуйте UI** в `presentation/ui/`
7. **Добавьте роут** в `app/navigation/router.dart`
8. **Зарегистрируйте зависимости** через аннотации `@Injectable`

## Примеры использования

### HTTP запрос с обработкой ошибок
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

### State Management с Riverpod
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

### Type-safe навигация
```dart
@TypedGoRoute<ExampleRoute>(path: '/example')
class ExampleRoute extends GoRouteData {
  const ExampleRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ExampleScreen();
}

// Навигация:
context.go(const ExampleRoute().location);
```

## Рекомендации по разработке

### Принципы
- **SOLID**: следуйте принципам единственной ответственности, открытости/закрытости
- **DRY**: избегайте дублирования кода
- **KISS**: пишите простой и понятный код
- **TDD**: пишите тесты перед реализацией

### Кодстайл
- Используйте `dart format` для форматирования
- Следуйте `effective_dart` рекомендациям
- Добавляйте документацию к публичным API
- Используйте строгую типизацию

### Тестирование
- Пишите unit тесты для Use Cases
- Пишите widget тесты для UI компонентов
- Используйте mock классы для зависимостей

## Лицензия

Этот проект является шаблоном и может использоваться как основа для коммерческих и некоммерческих проектов.