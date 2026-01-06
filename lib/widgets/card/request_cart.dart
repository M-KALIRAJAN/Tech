import 'package:flutter/material.dart';
import 'package:tech_app/core/constants/app_colors.dart';

class RequestCart extends StatelessWidget {
  const RequestCart({super.key, required String service});

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
          Text(
            value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _infospareRow(String lable, String value, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(lable),
              Row(
                children: [Text("Qty:"), const SizedBox(width: 5), Text(value)],
              ),
            ],
          ),
          Text(amount),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                      child: Icon(
                        Icons.receipt_long,
                        size: 18,
                        color: AppColors.primary_clr,
                      ),
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
        ),
        const SizedBox(height: 20),

        //spare Parts Used
        Container(
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
                      child: Icon(
                        Icons.receipt_long,
                        size: 18,
                        color: AppColors.primary_clr,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        "Spare Parts Used",
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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                      _infospareRow("Waher Gesket:", "2", "BHD 5.OO"),
                     const Divider(),
                    _infospareRow("Waher Gesket:", "2", "BHD 5.OO"),
                     const Divider(),
                    _infospareRow("Waher Gesket:", "2", "BHD 5.OO"),
                                     
                      ],
                    ),
                  ),
                
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 223, 221, 221),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Pipe Thread Sealent:"),
                          Text("BHD 17.89")
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),

        // Total Service Cost
         Container(
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
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        "Total Service Cost",
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)
                  ),
                  color: Colors.grey.shade300
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Amount:"),
                      Text("BHD 97.90")
                    ],
                  ),
                ),
              )
            ]
          )
          )
      ],
    );
  }
}
