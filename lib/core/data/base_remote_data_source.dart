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

  // -------- JSON helpers (minimum boilerplate) --------

  Future<List<Map<String, dynamic>>> getListJson(
      String apiMethod, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    final response = await getRequest(
      apiMethod,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );

    return _requireJsonList(response.data, apiMethod);
  }

  Future<Map<String, dynamic>> getObjectJson(
      String apiMethod, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    final response = await getRequest(
      apiMethod,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );

    return _requireJsonObject(response.data, apiMethod);
  }

  Future<List<Map<String, dynamic>>> postListJson(
      String apiMethod, {
        Object? body,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    final response = await postRequest(
      apiMethod,
      body: body,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );

    return _requireJsonList(response.data, apiMethod);
  }

  Future<Map<String, dynamic>> postObjectJson(
      String apiMethod, {
        Object? body,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    final response = await postRequest(
      apiMethod,
      body: body,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );

    return _requireJsonObject(response.data, apiMethod);
  }

  Future<Map<String, dynamic>> putObjectJson(
      String apiMethod, {
        Object? body,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    final response = await putRequest(
      apiMethod,
      body: body,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );

    return _requireJsonObject(response.data, apiMethod);
  }

  Future<Map<String, dynamic>> patchObjectJson(
      String apiMethod, {
        Object? body,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    final response = await patchRequest(
      apiMethod,
      body: body,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );

    return _requireJsonObject(response.data, apiMethod);
  }

  // -------- private validators --------

  List<Map<String, dynamic>> _requireJsonList(dynamic data, String apiMethod) {
    if (data is! List) {
      throw StateError(
        'Expected a JSON array from "$apiMethod", but got ${data.runtimeType}.',
      );
    }

    return data.cast<Map<String, dynamic>>();
  }

  Map<String, dynamic> _requireJsonObject(dynamic data, String apiMethod) {
    if (data is! Map) {
      throw StateError(
        'Expected a JSON object from "$apiMethod", but got ${data.runtimeType}.',
      );
    }

    return Map<String, dynamic>.from(data as Map);
  }
}