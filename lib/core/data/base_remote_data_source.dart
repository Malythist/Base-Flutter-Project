import 'package:dio/dio.dart';

import '../extensions/api_config_extensions.dart';
import '../network/api_config.dart';

abstract class BaseRemoteDataSource {
  final Dio dio;
  final ApiConfig apiConfig;

  BaseRemoteDataSource(
      this.dio,
      this.apiConfig,
      );

  String buildUrl(String apiMethod) {
    return apiConfig.buildUrl(apiMethod);
  }

  Future<Response<dynamic>> getRequest(
      String apiMethod, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) {
    final url = buildUrl(apiMethod);

    return dio.get(
      url,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<dynamic>> postRequest(
      String apiMethod, {
        Object? body,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) {
    final url = buildUrl(apiMethod);

    return dio.post(
      url,
      data: body,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<dynamic>> putRequest(
      String apiMethod, {
        Object? body,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) {
    final url = buildUrl(apiMethod);

    return dio.put(
      url,
      data: body,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<dynamic>> patchRequest(
      String apiMethod, {
        Object? body,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) {
    final url = buildUrl(apiMethod);

    return dio.patch(
      url,
      data: body,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<dynamic>> deleteRequest(
      String apiMethod, {
        Object? body,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
      }) {
    final url = buildUrl(apiMethod);

    return dio.delete(
      url,
      data: body,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }
}