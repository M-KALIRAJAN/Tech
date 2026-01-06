import 'dart:convert'; 
import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:tech_app/core/network/dio_client.dart';
import 'package:tech_app/model/TechnicianProfile_Model.dart';

class TechnicianprofileService {
  final Dio _dio = DioClient.dio;
  Future<TechnicianProfile> tech_profile() async {
    try {
      final response = await _dio.post('technician/profile');
      debugPrint("RAW RESPONSE: ${response.data}");


      return TechnicianProfile.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint("❌ DIO ERROR: ${e.response?.data}");
      debugPrint("❌ STATUS CODE: ${e.response?.statusCode}");
      final errorData = e.response?.data;

      final message = errorData is Map<String, dynamic>
          ? errorData['message'] ?? 'Something went wrong'
          : errorData.toString();

      throw Exception(message);
    }
  }
}
