import 'package:dio/dio.dart';

class ApiClient {
  ApiClient({required this.baseUrl}) {
    dio = Dio()
      ..options.baseUrl = baseUrl
      ..interceptors.add(QueuedInterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers = <String, dynamic>{
            Headers.acceptHeader: Headers.jsonContentType,
            Headers.contentTypeHeader: Headers.jsonContentType,
          };
          handler.next(options);
        },
        onError: (error, handler) => handler.reject(error),
      ));
  }

  final String baseUrl;

  late Dio dio;
}
