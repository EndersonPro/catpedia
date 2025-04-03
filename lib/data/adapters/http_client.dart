import 'package:catpedia/domain/adapters/api.dart';
import 'package:dio/dio.dart';

import '../../core/core.dart';

class HttpClientImpl implements HttpClientInterface {
  late final Dio _httpClient;

  HttpClientImpl({required EnvironmentConfigInterface environmentConfig}) {
    _httpClient = Dio(
      BaseOptions(
        baseUrl: environmentConfig.baseUrl,
        headers: {'x-api-key': environmentConfig.apiKey},
      ),
    );
  }

  @override
  Future<HttpResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _httpClient.get(
      path,
      queryParameters: queryParameters,
    );

    return HttpResponse(statusCode: response.statusCode, body: response.data);
  }
}
