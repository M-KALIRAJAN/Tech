import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tech_app/core/network/dio_client.dart';

class UpdateService {
  final _dio = DioClient.dio;

  Future<Map<String, dynamic>> fetchupdatedservice({
    required List<File> images,
    required String userServiceId,
    required String serviceStatus,
  }) async {
    try {
      final formData = FormData();

      formData.fields.addAll([
        MapEntry("userServiceId", userServiceId),
        MapEntry("serviceStatus", serviceStatus),
      ]);

      //  Images (multiple)
      for (var image in images) {
        formData.files.add(
          MapEntry(
            "media",
            await MultipartFile.fromFile(
              image.path,
              filename: image.path.split('/').last,
            ),
          ),
        );
      }

      final response = await _dio.post(
        "techie/update-service",
        data: formData,
        options: Options(contentType: "multipart/form-data"),
      );
      return response.data;
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
