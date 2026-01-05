import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:tech_app/core/network/dio_client.dart';
import 'package:tech_app/model/Inventory_Material_Model.dart';

class InventorymaterialListService {
  final Dio _dio = DioClient.dio;

  Future<InventoryMaterial> InventoryList() async {
    try {
      final response = await _dio.post('techie/inventory');
      debugPrint("API STATUS: ${response.statusCode}");
      debugPrint("API DATA: ${response.data}");

      return InventoryMaterial.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint("❌ DIO ERROR: ${e.response?.data}");
      debugPrint("❌ STATUS CODE: ${e.response?.statusCode}");
      final message =
          e.response?.data['message']?.toString() ?? "No Inventory List";
      throw message;
    }
  }
}
