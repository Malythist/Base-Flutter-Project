import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/network/api_config.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  ApiConfig apiConfig() => const ApiConfig(
    baseUrl: 'https://jsonplaceholder.typicode.com',
  );

  @lazySingleton
  Dio dio(ApiConfig config) {
    return Dio(
      BaseOptions(
        // Можно и не задавать baseUrl, если ты хочешь собирать URL руками в datasource.
        // Но я оставлю, потому что это полезно для относительных путей.
        baseUrl: config.baseUrl,

        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),

        headers: const {
          'Accept': 'application/json',
        },
      ),
    );
  }
}