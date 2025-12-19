import 'package:dio/dio.dart';
import 'failure.dart';

Failure mapDioToFailure(DioException e) {
  final status = e.response?.statusCode;

  if (e.type == DioExceptionType.connectionTimeout ||
      e.type == DioExceptionType.sendTimeout ||
      e.type == DioExceptionType.receiveTimeout ||
      e.type == DioExceptionType.connectionError) {
    return const Failure.network(message: 'Проблемы с сетью');
  }

  if (status == 401) {
    return const Failure.unauthorized(message: 'Неавторизован');
  }

  if (status == 403) {
    return const Failure.unauthorized(message: 'Доступ запрещён');
  }

  if (status == 404) {
    return const Failure.server(message: 'Метод не найден', code: 404);
  }

  if (status != null && status >= 500) {
    return Failure.server(message: 'Ошибка сервера', code: status);
  }

  if (status != null) {
    return Failure.server(message: 'Ошибка запроса', code: status);
  }

  return Failure.unknown(message: e.message ?? 'Неизвестная ошибка');
}
