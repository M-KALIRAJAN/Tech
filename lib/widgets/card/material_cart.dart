import 'package:flutter/material.dart';
import 'package:tech_app/core/constants/app_colors.dart';

class MaterialCart extends StatelessWidget {
  const MaterialCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      padding: const EdgeInsets.all(12),
      height: 87,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(217, 217, 217, 1),
      ),
      child: Row(
        children: [
          Container(
            height: 47,
            width: 47,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(
              Icons.inventory_2_outlined,
              color: AppColors.primary_clr,
            ),
          ),

          const SizedBox(width: 12),

        
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Hydraulic Fluid",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "(HV-46)",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 4),
                Text.rich(
  TextSpan(
    children: [
      TextSpan(
        text: "Quantity: ",
        style: TextStyle(
          fontSize: 12,
          color: Colors.black54,
        ),
      ),
      TextSpan(
        text: "25",
        style: TextStyle(
          fontSize: 14,
          color: AppColors.primary_clr,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  ),
),

                
              ],
            ),
          ),

       
          const Icon(
            Icons.chevron_right,
            color: Colors.black45,
          ),
        ],
      ),
    );
  }
}
