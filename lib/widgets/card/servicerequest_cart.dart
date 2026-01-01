import 'package:flutter/material.dart';
import 'package:tech_app/core/constants/app_colors.dart';

class ServicerequestCart extends StatelessWidget {
  const ServicerequestCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(color: Colors.black38, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 55,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.scoundry_clr,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: 34,
                  width: 34,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(Icons.person, color: AppColors.scoundry_clr),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Service Details",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _infoRow("Name", "MohammadSiraj"),
                const Divider(),
                _infoRow("Email", "MohammadSiraj@gmail.in"),
                const Divider(),
                _infoRow("Phone", "+973 78787887"),
                const Divider(),
                _infoRow("Address", "Building 12 Appartment1,floor2,Muharg"),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Loation",
                      style: TextStyle(
                        color: AppColors.lightgray_clr,
                        fontSize: 12,
                      ),
                    ),

                    Container(
                      height: 90,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(196, 189, 185, 185),
                      ),
                    ),
                  ],
                ),

                const Divider(),
                _infoRow("Distane:", "7km"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: AppColors.lightgray_clr, fontSize: 12),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
