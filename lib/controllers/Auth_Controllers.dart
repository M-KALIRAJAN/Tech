import 'package:flutter/material.dart';
import 'package:tech_app/model/Auth_Model.dart';

class AuthControllers {
   final email = TextEditingController();
   final pasword = TextEditingController();

   //Email Validation
   String? validateEmail(String? value){
     if(value == null || value.isEmpty){
      return "Email is required";
     }
         final emailRegex =
        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        if(!emailRegex.hasMatch(value)){
          return "Enter valid email";
        }
        return null;
   }

   // password validation
   String? validatePassword(String? value){
    if(value == null || value.isEmpty){
      return"Password is required";
    }
    return null;
   }

   //Login 

   Future<bool> login()async{
    final authModel = AuthModel(
      email: email.text, 
      password: pasword.text);
   debugPrint("Email: ${authModel.email}");
     debugPrint("pasword: ${authModel.password}");
     return true;
   }

   // Dispose
   void dispose() {
     email.dispose();
     pasword.dispose();
   }
}