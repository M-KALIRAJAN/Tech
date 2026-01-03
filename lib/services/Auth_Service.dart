import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:tech_app/core/network/dio_client.dart';
import 'package:tech_app/model/Auth_Model.dart';

class AuthService {
  final Dio _dio = DioClient.dio;

  Future<Map<String, dynamic>> techLogin(AuthModel authmodel) async {
    try {
      final response = await _dio.post(
        "technician/login",
        data: authmodel.toJson(),
      );
      debugPrint("Login API Response: ${response.data}");
      return response.data;
    } on DioException catch (e) {
      final message =
          e.response?.data['message']?.toString() ?? "Login failed";
      throw message; // will be caught in controller
    }
  }
}
