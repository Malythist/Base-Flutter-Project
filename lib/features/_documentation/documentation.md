# Feature creation guide

Each feature in this project follows Clean Architecture principles and must strictly adhere
to the structure and responsibilities described below.

A feature represents a single, independent unit of functionality
(screen, flow, or business capability).

---

## Feature directory structure

Each feature must be placed in its own directory:

feature_name/
├── data/
├── domain/
└── presentation/

The feature name must be lowercase and descriptive
(e.g. auth, profile, example).

---

# Data layer

The data layer is responsible for:
- Fetching data from remote or local sources
- Working with API endpoints
- Mapping DTOs to domain models

---

## 1. RemoteDataSource

### Purpose
Handles direct communication with the backend API.

### File location
data/datasource/feature_remote_data_source.dart

### Required structure

1. Create an abstract interface:

abstract class FeatureRemoteDataSource {
Future<ReturnType> methodName();
}

2. Create an implementation class.

Requirements:
- Must extend BaseRemoteDataSource
- Must implement the interface
- Must be registered via Dependency Injection

Example:

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

### Rules
- Never concatenate baseUrl manually
- Always use API_METHOD
- Prefer high-level JSON helpers over raw requests

---

## 2. Repository implementation

### Purpose
Connects the data layer with the domain layer.

### File location
data/repository/feature_repository_impl.dart

### Required structure

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

### Rules
- Must implement the domain repository interface
- Must contain no UI logic
- Must only perform data-to-domain mapping

---

# Domain layer

The domain layer contains business logic and must be pure Dart.

---

## 3. Repository interface

### Purpose
Defines the contract expected by the domain layer.

### File location
domain/repository/feature_repository.dart

Example:

```
abstract class FeatureRepository {
    Future<DomainEntity> getData();
}
```

---

## 4. UseCase

### Purpose
Encapsulates a single business action.

### File location
domain/usecase/get_feature_data_use_case.dart

### Required structure

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

### Rules
- One use case per action
- No UI, Flutter, or framework dependencies

---

# Presentation layer

The presentation layer manages UI state and rendering.

---

## 5. Controller

### Purpose
Manages screen state using Riverpod.

### File location
presentation/controller/feature_controller.dart

### Required structure

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

### Rules
- Must use AsyncValue
- Must not access data sources directly
- Must expose retry or reload logic

---

## 6. Screen

### Purpose
Renders UI based on controller state.

### File location
presentation/ui/feature_screen.dart

### Required structure

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

## Summary

To create a working feature, you must implement:
1. RemoteDataSource
2. Repository implementation
3. Repository interface
4. UseCase
5. Controller
6. State
7. Screen

Skipping any step breaks the feature contract.