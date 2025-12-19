import 'package:dio/dio.dart';
import 'failure.dart';

Failure mapDioToFailure(DioException e) {
  final status = e.response?.statusCode;

  if (e.type == DioExceptionType.connectionTimeout ||
      e.type == DioExceptionType.sendTimeout ||
      e.type == DioExceptionType.receiveTimeout ||
      e.type == DioExceptionType.connectionError) {
    return Failure.network(message: 'Проблемы с сетью');
  }

  if (status == 401 || status == 403) {
    return Failure.unauthorized(message: 'Нет доступа');
  }

  if (status != null && status >= 500) {
    return Failure.server(message: 'Ошибка сервера', code: status);
  }

  return Failure.unknown(message: e.message ?? 'Неизвестная ошибка');
}
