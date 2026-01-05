import 'package:dio/dio.dart';
import 'package:tech_app/core/network/dio_client.dart';
import 'package:tech_app/model/Inventory_Material_Model.dart';

class InventorymaterialListService {
   final Dio _dio = DioClient.dio;

   Future<InventoryMaterial?> InventoryList (InventoryMaterial inventoryMaterial) async{
     try{
        final  response = await _dio.post('techie/inventory');
     }on DioException catch(e){
       final message = e.response?.data['message']?.toString() ??  "No Inventory List";
     }
   }
       
}