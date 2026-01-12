import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tech_app/core/constants/app_colors.dart';
import 'package:tech_app/model/ServiceList%20_Model.dart';

class RequestCart extends StatelessWidget {
  final String clientname;
  final String servicetype;
  final String assignmentStatus;
  final String scheduleService;
  final String createdAt;
  final String feedback;
  final String serviceRequestID;
  final int payment;
  final List<Assignment> assignments;
  const RequestCart({
    super.key,
    required this.clientname,
    required this.servicetype,
    required this.assignmentStatus,
    required this.scheduleService,
    required this.createdAt,
    required this.feedback,
    required this.serviceRequestID,
    required this.assignments,
    required this.payment,
  });

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

  String formatDate(String isoDate) {
    final dateTime = DateTime.parse(isoDate);
    return DateFormat('MMMM d, yyyy').format(dateTime);
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
                    _infoRow("Request ID", serviceRequestID),
                    const Divider(),
                    _infoRow("Service Type", servicetype),
                    const Divider(),
                    _infoRow("Status", assignmentStatus),
                    const Divider(),
                    _infoRow("Client Name", clientname),
                    const Divider(),
                    _infoRow("Scheduled For", formatDate(scheduleService)),
                    const Divider(),
                    _infoRow("Created On", formatDate(createdAt)),
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(feedback, style: TextStyle(fontSize: 14)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        ListView.builder(
          shrinkWrap: true,
          itemCount: assignments.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final assignment = assignments[index];
            return
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
                          children: assignment.usedParts.map((part) {
                            return _infospareRow(
                              part.productName,
                              part.count.toString(),
                              " BHD ${part.price}",
                            );
                          }).toList(),
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 223, 221, 221),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Pipe Thread Sealent:"),
                              Text("BHD 17.89"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
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
                    bottomRight: Radius.circular(15),
                  ),
                  color: Colors.grey.shade300,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Amount:"),
                      Text("BHD ${payment.toString()}"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
