import 'package:dio/dio.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://nadi-buhrain-render-site.onrender.com/api/",
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30)
    )
  );
}