import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final TextInputType? keyboardType;
  final Icon? surfixIcon;
  final bool isPassword;

  const AppTextField({
    super.key,
    required this.label,
    this.keyboardType,
    this.surfixIcon,
    this.isPassword = false
  });

  @override
  Widget build(BuildContext context) {
    bool _obscure = true;
    return TextField(
      keyboardType: keyboardType,
      obscureText: isPassword? _obscure :false,
      decoration: InputDecoration(
        labelText: label,

        labelStyle: TextStyle(fontSize: 14, color: Color(0xFF79747E)),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFF79747E)),
        ),
        suffixIcon: isPassword ? IconButton(
          icon: Icon( 
            _obscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
           onPressed: (){
           
          }, 

          ) : null
      )
  
    );
  }
}
