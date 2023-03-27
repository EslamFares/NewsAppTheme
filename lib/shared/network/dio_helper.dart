import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> get({
    required String url,
    required Map<String, dynamic> qurey,
  }) async {
    return await dio.get(url,
        queryParameters: qurey,
        options: Options(
            contentType: 'application/json',
            followRedirects: false,
            validateStatus: (state) {
              return state! < 500;
            }));
  }
}
