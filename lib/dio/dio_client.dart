import 'package:dio/dio.dart';
import 'package:nexever_flutter_task/utils/constants.dart';
import 'login_interceptor.dart';

class DioClient {
  Dio dio;
  final LoggingInterceptor loggingInterceptor;
  String? token;

  DioClient(this.dio, this.loggingInterceptor) {
    dio.options.baseUrl = Constants.BASE_URL;

    dio.options.headers = {
      "Accept": "application/json",
      'Content-Type': 'application/json; charset=UTF-8',
    };

    dio.interceptors.add(loggingInterceptor);
  }

  Future<Response> get(String path, Map<String, dynamic>? getData) async {
    if (getData == null) {
      return await dio.get(path);
    } else {
      return await dio.get(path, queryParameters: getData);
    }
  }

  Future<Response> post(String path, Map<String, dynamic> postData) async {
    return await dio.post(path,
        data: postData,
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }
}
