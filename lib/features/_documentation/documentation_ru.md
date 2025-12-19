# Руководство по созданию фичи

Каждая фича в проекте строится по принципам Clean Architecture
и должна строго соответствовать описанным ниже правилам.

Фича — это независимый и изолированный функциональный блок
(экран, пользовательский сценарий или бизнес-возможность).

---

## Структура фичи

Каждая фича должна располагаться в собственной директории:

feature_name/
├── data/
├── domain/
└── presentation/

Название фичи:
- только в нижнем регистре
- должно отражать назначение фичи  
  (например: auth, profile, example)

---

# Data слой

Data слой отвечает за:
- Получение данных из сети или других источников
- Работу с API
- Преобразование DTO в доменные модели

---

## 1. RemoteDataSource

### Назначение
Прямая работа с бекенд API.

### Расположение файла
data/datasource/feature_remote_data_source.dart

### Обязательная структура

1. Создать интерфейс в domain слое:

```
abstract class FeatureRemoteDataSource {
  Future<ReturnType> methodName();
}
```

2. Создать реализацию.

Требования:
- Класс должен наследоваться от BaseRemoteDataSource
- Класс должен имплементировать интерфейс
- Класс должен быть зарегистрирован через Dependency Injection

Пример:

```
@LazySingleton(as: FeatureRemoteDataSource)
class FeatureRemoteDataSourceImpl extends BaseRemoteDataSource
  implements FeatureRemoteDataSource {

  static const String API_METHOD = '/endpoint';

  FeatureRemoteDataSourceImpl(
    Dio dio,
    ApiConfig apiConfig,
  ) : super(dio, apiConfig);

  @override
  Future<ReturnType> methodName() async {
    final json = await getObjectJson(API_METHOD);
    return ReturnType.fromJson(json);
  }
}
```

### Правила
- Никогда не конкатенировать baseUrl вручную
- Всегда использовать API_METHOD
- Предпочитать JSON-хелперы вместо сырых HTTP-запросов

---

## 2. Repository (реализация)

### Назначение
Связывает Data и Domain слои.

### Расположение файла
data/repository/feature_repository_impl.dart

### Обязательная структура

```
@LazySingleton(as: FeatureRepository)
class FeatureRepositoryImpl implements FeatureRepository {
  final FeatureRemoteDataSource remoteDataSource;

  FeatureRepositoryImpl(this.remoteDataSource);

  @override
  Future<DomainEntity> getData() async {
    final dto = await remoteDataSource.methodName();
    return dto.toDomain();
  }
}
```

### Правила
- Должен имплементировать интерфейс репозитория из Domain слоя
- Не должен содержать UI-логики
- Отвечает только за преобразование данных

---

# Domain слой

Domain слой содержит бизнес-логику и не зависит от Flutter и фреймворков.

---

## 3. Repository interface

### Назначение
Контракт между Domain и Data слоями.

### Расположение файла
domain/repository/feature_repository.dart

Пример:

```
abstract class FeatureRepository {
  Future<DomainEntity> getData();
}
```

---

## 4. UseCase

### Назначение
Одна бизнес-операция или пользовательское действие.

### Расположение файла
domain/usecase/get_feature_data_use_case.dart

### Обязательная структура

```
@LazySingleton()
class GetFeatureDataUseCase {
  final FeatureRepository repository;

  GetFeatureDataUseCase(this.repository);

  Future<DomainEntity> call() {
    return repository.getData();
  }
}
```

### Правила
- Один use case — одно действие
- Никаких UI или Flutter зависимостей

---

# Presentation слой

Presentation слой отвечает за состояние UI и отображение.

---

## 5. Controller

### Назначение
Управляет состоянием экрана.

### Расположение файла
presentation/controller/feature_controller.dart

### Обязательная структура

```
final featureControllerProvider = AsyncNotifierProvider<FeatureController, FeatureState>(
  FeatureController.new,
);

class FeatureController extends AsyncNotifier<FeatureState> {

  @override
  Future<FeatureState> build() async {
    return _load();
  }

  Future<FeatureState> _load() async {
    final result = await ref.read(getFeatureDataUseCaseProvider).call();
    return FeatureState(data: result);
  }

  void retry() {
    state = const AsyncLoading();
    state = AsyncValue.guard(_load);
  }
}
```

### Правила
- Использовать AsyncValue
- Не обращаться напрямую к Data слою
- Предоставлять метод повторной загрузки

---

## 6. Screen

### Назначение
Отрисовка UI.

### Расположение файла
presentation/ui/feature_screen.dart

### Обязательная структура

```
class FeatureScreen extends ConsumerWidget {
    const FeatureScreen({super.key});

    @override
    Widget build(BuildContext context, WidgetRef ref) {
        final async = ref.watch(featureControllerProvider);
            return AppScaffold(
                title: 'Feature',
                body: async.whenWidget(
                loading: const LoadingView(),
                error: (e) => ErrorView(...),
                data: (state) => FeatureContent(state)
            )
        );
    }
}
```

---

## Итог

Для корректной работы фичи необходимо реализовать:
1. RemoteDataSource
2. Repository (реализация)
3. Repository interface
4. UseCase
5. Controller
6. State
7. Screen

Пропуск любого шага нарушает архитектурный контракт.
