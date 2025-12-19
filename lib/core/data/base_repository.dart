import 'package:dio/dio.dart';

import '../error/dio_failure_mapper.dart';
import '../error/failure.dart';
import '../error/result.dart';

abstract class BaseRepository {
  const BaseRepository();

  Future<Result<T>> safeCall<T>(Future<T> Function() block) async {
    try {
      final data = await block();
      return Result.success(data);
    } on DioException catch (e) {
      return Result.failure(mapDioToFailure(e));
    } catch (e) {
      return Result.failure(Failure.unknown(message: e.toString()));
    }
  }

  Future<Result<T>> safeMap<T>(
      Future<dynamic> Function() block, {
        required T Function(dynamic raw) mapper,
      }) async {
    try {
      final raw = await block();
      return Result.success(mapper(raw));
    } on DioException catch (e) {
      return Result.failure(mapDioToFailure(e));
    } catch (e) {
      return Result.failure(Failure.unknown(message: e.toString()));
    }
  }
}
