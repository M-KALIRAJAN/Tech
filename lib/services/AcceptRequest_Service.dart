import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:tech_app/core/network/dio_client.dart';

class AcceptrequestService {
  final _dio = DioClient.dio;

  Future<Map<String, dynamic>?> acceptrequest(
    String assignmentId,
   
  ) async {
    try {
      final action ="accept";
      final response = await _dio.post(
        'user-service-list/technician-respond',
        data: {
          "assignmentId":assignmentId,
          "action":action
        }
        );
      debugPrint("acceptrequest: ${response.data}");

      return response.data;
    } on DioException catch (e) {
      debugPrint("❌ DIO ERROR: ${e.response?.data}");
      debugPrint("❌ STATUS CODE: ${e.response?.statusCode}");
      final errorData = e.response?.data;
      final message = errorData is Map<String, dynamic>
          ? errorData['message'] ?? 'Failed to load service list'
          : errorData.toString();
      throw Exception(message);
    }
  }
}
