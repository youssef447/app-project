import 'package:dio/dio.dart';

class DioHelper {
  static late final Dio dio;
  DioHelper._();
  static init({required String baseUrl}) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    );
  }

  static Future<Response> getData({
    required String method,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? userToken,
    bool? authBearer,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      if (authBearer ?? false) 'Authorization': 'Bearer $userToken',
    };
    return await dio.get(method, queryParameters: query);
  }

  static Future<Response> postData({
    required String method,
    required dynamic data,
    String lang = 'en',
    String? userToken,
    bool? authBearer,
  }) async {
    dio.options.headers = {
    /*   'Content-Type':
          data is FormData ? 'multipart/form-data' : 'application/json', */
      'lang': lang,
      if (authBearer ?? false) 'Authorization': 'Bearer $userToken',
    };
    return await dio.post(
      method,
      data: data,
    );
  }
}