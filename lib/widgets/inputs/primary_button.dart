import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final double? height;
  final double? Width;
  final double radius;
  final Color color;
  final VoidCallback onPressed;
  final String text;

  const PrimaryButton({
    super.key,
     this.height, 
     this.Width, 
     required this.radius, 
     required this.color, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: Width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(radius)
          )
        ),
        onPressed: onPressed,
         child: Text(text)),
      
    );
  }
}