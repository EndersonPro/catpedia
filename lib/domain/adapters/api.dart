import 'dart:async';

class HttpResponse<T> {
  int? statusCode;
  T? body;

  HttpResponse({this.statusCode, this.body});
}

abstract class HttpClientInterface {
  Future<HttpResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  });
}
