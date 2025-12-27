import 'package:dio/dio.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "",
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30)
    )
  );
}