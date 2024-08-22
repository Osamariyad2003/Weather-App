import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;



class DioHelper {
  static late Dio dio;
  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.openweathermap.org/data/2.5/',
        receiveDataWhenStatusError: true,
      ),
    );
  }
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
  }) async
  {
    dio.options.headers =
    {
      'lang':lang,
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }}

