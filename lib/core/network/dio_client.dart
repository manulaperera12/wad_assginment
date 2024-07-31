import 'package:dio/dio.dart';
import '../../util/api_endpoints.dart';

class DioClient {
  Dio public;
  Dio auth;

  DioClient({required this.public, required this.auth}) {
    public.options = BaseOptions(
      baseUrl: ApiEndpoints.baseURL,
      connectTimeout: const Duration(milliseconds: 15000),
      receiveTimeout: const Duration(milliseconds: 15000),
      responseType: ResponseType.plain,
    );
    auth.options = BaseOptions(
      baseUrl: ApiEndpoints.baseURL,
      connectTimeout: const Duration(milliseconds: 15000),
      receiveTimeout: const Duration(milliseconds: 15000),
      responseType: ResponseType.plain,
    );
  }
}
