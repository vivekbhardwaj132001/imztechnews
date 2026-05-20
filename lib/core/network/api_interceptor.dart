import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final apiKey = dotenv.env['NEWS_API_KEY'];
    options.queryParameters['apiKey'] = apiKey;
    super.onRequest(options, handler);
  }
}
