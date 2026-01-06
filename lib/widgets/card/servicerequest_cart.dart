import 'package:flutter/material.dart';
import 'package:tech_app/core/constants/app_colors.dart';
import 'package:tech_app/widgets/inputs/primary_button.dart';
import 'package:tech_app/model/ServiceList _Model.dart';

class ServicerequestCart extends StatelessWidget {
final Datum data; // 👈 STRONG TYPE

  const ServicerequestCart({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(12),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
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
                            child: Icon(
                              Icons.person,
                              color: AppColors.scoundry_clr,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              "Coustomer Details",
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
                          _infoRow("Name", data.userId.basicInfo.fullName),
                          const Divider(),
                          _infoRow("Email", data.userId.basicInfo.email),
                          const Divider(),
                          _infoRow("Phone", "+973 ${data.userId.basicInfo.mobileNumber}"),
                          const Divider(),
                          _infoRow(
                            "Address",
                            "building ${data.address.building} , floor ${data.address.floor}, aptNo ${data.address.aptNo}",
                          ),
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
                                  color: const Color.fromARGB(
                                    196,
                                    189,
                                    185,
                                    185,
                                  ),
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
              ),

              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.all(12),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
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
                            child: Icon(
                              Icons.person,
                              color: AppColors.scoundry_clr,
                            ),
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
                          _infoRow("Service Type", data.serviceId.name),
                          const Divider(),
                          _infoRow(
                            "Description",
                            data.feedback ?? "",
                          ),
                          const Divider(),
                          _infoRow("Date Required", data.scheduleService.toIso8601String()),
                          const Divider(),
                          _infoRow("Time Window", "10:00AM - 12:00Am"),
                          const Divider(),
                          _infoRow("Date Created", data.createdAt.toIso8601String()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              if(data.assignmentStatus == "pending")...[
Padding(
                padding: const EdgeInsets.all(10.0),
                child: PrimaryButton(
                  radius: 13,
                  height: 50,
                  Width: double.infinity,
                  color: AppColors.scoundry_clr,
                  onPressed: () {},
                  text: "Accpect",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: PrimaryButton(
                  radius: 13,
                  height: 50,
                  Width: double.infinity,
                  color: Colors.red,
                  onPressed: () {
                    _showRejectReasonSheet(context);
                  },
                  text: "Rejected",
                ),
              ),
              ],
                
              const SizedBox(height: 10),
            ],
          ),
        ),
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
              maxLines: 5,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  //Reject
  void _showRejectReasonSheet(BuildContext context) {
    final TextEditingController reasonController = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Reject Reason",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),

              TextField(
                controller: reasonController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Why are you rejecting this request?",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.red, width: 1.5),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      radius: 13,
                      height: 50,
                      Width: double.infinity,
                      color: Colors.grey,
                      onPressed: () => Navigator.pop(context),
                      text: "Cancel",
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: PrimaryButton(
                      radius: 13,
                      height: 50,
                      Width: double.infinity,
                      color: Colors.red,
                      onPressed: () {
                        final reason = reasonController.text.trim();

                        if (reason.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please enter rejection reason"),
                            ),
                          );
                          return;
                        }

                        Navigator.pop(context);

                        // 🔥 CALL REJECT API HERE
                        debugPrint("Rejected Reason: $reason");
                      },
                      text: "Reject",
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
