// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:base_multiplatform_project/app/di/modules.dart' as _i816;
import 'package:base_multiplatform_project/core/network/api_config.dart'
    as _i130;
import 'package:base_multiplatform_project/features/_example/data/datasource/example_remote_ds.dart'
    as _i650;
import 'package:base_multiplatform_project/features/_example/data/repository/example_repository_impl.dart'
    as _i69;
import 'package:base_multiplatform_project/features/_example/domain/repository/example_repository.dart'
    as _i157;
import 'package:base_multiplatform_project/features/_example/domain/usecase/get_example_items_usecase.dart'
    as _i318;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i130.ApiConfig>(() => networkModule.apiConfig());
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio(gh<_i130.ApiConfig>()));
    gh.lazySingleton<_i650.ExampleRemoteDataSource>(
        () => _i650.ExampleRemoteDataSourceImpl(
              gh<_i361.Dio>(),
              gh<_i130.ApiConfig>(),
            ));
    gh.lazySingleton<_i157.ExampleRepository>(
        () => _i69.ExampleRepositoryImpl(gh<_i650.ExampleRemoteDataSource>()));
    gh.lazySingleton<_i318.GetExampleItemsUseCase>(
        () => _i318.GetExampleItemsUseCase(gh<_i157.ExampleRepository>()));
    return this;
  }
}

class _$NetworkModule extends _i816.NetworkModule {}
