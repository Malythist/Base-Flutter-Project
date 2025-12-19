import '../network/api_config.dart';

extension ApiConfigX on ApiConfig {
  String buildUrl(
      String method, {
        Map<String, dynamic>? query,
      }) {
    final base = baseUrl.endsWith('/') ? baseUrl.substring(0, baseUrl.length - 1) : baseUrl;

    final path = method.startsWith('/') ? method : '/$method';

    final url = base + path;

    if (query == null || query.isEmpty) return url;

    final uri = Uri.parse(url).replace(
      queryParameters: query.map((k, v) => MapEntry(k, v.toString())),
    );

    return uri.toString();
  }
}