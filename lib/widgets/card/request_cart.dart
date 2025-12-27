import 'package:flutter/material.dart';
import 'package:tech_app/core/constants/app_colors.dart';

class RequestCart extends StatelessWidget {
  const RequestCart({super.key});

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: AppColors.lightgray_clr,
              fontSize: 12,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Container(
            height: 55,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.primary_clr,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: 34,
                  width: 34,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(Icons.receipt_long,
                      size: 18, color: AppColors.primary_clr),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    "Request Information",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
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
                _infoRow("Request ID", "#SR755"),
                const Divider(),

                _infoRow("Service Type", "Plumbing"),
                const Divider(),

                _infoRow("Status", "Pending"),
                const Divider(),

                _infoRow("Client Name", "John Doe"),
                const Divider(),

                _infoRow("Scheduled For", "25 Dec 2025"),
                const Divider(),

                _infoRow("Created On", "20 Dec 2025"),
                const Divider(),

                // Description
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Description",
                    style: TextStyle(
                      color: AppColors.lightgray_clr,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "kldjsojklsdnxdkjdszhjkbdx zgfsezgjsbdfnmszbeejgjkfghdjlrherjhtjksfxjfkghurisdhtjdzbgjesgt",
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
