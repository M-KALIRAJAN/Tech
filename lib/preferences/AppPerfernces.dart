   import 'package:shared_preferences/shared_preferences.dart';

class Appperfernces {
     static const String _tokenKey = "auth_token";

     // ==== TOKEN ====

     static Future<void> saveToken(String token) async{
       final prefs = await  SharedPreferences.getInstance();
       await prefs.setString(_tokenKey, token);
     }

     static Future<String?> getToken() async{
      final prefs = await SharedPreferences.getInstance();
      await prefs.getString(_tokenKey);
     }
   }