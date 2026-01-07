import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:tech_app/core/network/dio_client.dart';

class MaterialrequestService {
  final _dio = DioClient.dio;
  Future<void> fetchmaterialrequest({
  required Map<String, dynamic> payload

  }) async {
    try {
    
      final response = await _dio.post(
        'material/bulk-request',
        data: payload,
      );

      debugPrint("✅ RESPONSE: ${response.data}");
    } on DioException catch (e) {
      debugPrint("❌ DIO ERROR: ${e.response?.data}");
      debugPrint("❌ STATUS CODE: ${e.response?.statusCode}");

      final errorData = e.response?.data;
      final message = errorData is Map<String, dynamic>
          ? errorData['message'] ?? 'Something went wrong'
          : errorData.toString();

      throw message;
    }
  }
}
