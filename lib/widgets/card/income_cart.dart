import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tech_app/core/constants/app_colors.dart';
import 'package:tech_app/core/utils/Time_Date.dart';
import 'package:tech_app/model/ServiceList%20_Model.dart';
import 'package:tech_app/provider/service_timer_provider.dart';

class IncomeCard extends ConsumerWidget {
  final String name;
  final String service;
  final String? issue;
  final String? schedule;
  final String assignmentStatus;
  final VoidCallback onClick;
  final int? payment;
  final List<Assignment> assignments;
  const IncomeCard({
    super.key,
    required this.name,
    required this.service,
    this.issue,
    this.schedule,
    required this.assignmentStatus,
    required this.onClick,
    this.assignments = const [],
    this.payment,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(serviceTimerProvider);

    String format(Duration d) =>
        "${d.inHours.toString().padLeft(2, '0')}:"
        "${(d.inMinutes % 60).toString().padLeft(2, '0')}:"
        "${(d.inSeconds % 60).toString().padLeft(2, '0')}";
    final assignment = assignments.isNotEmpty ? assignments.first : null;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onClick,
            child: Container(
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
                  Expanded(
                    child: Text(
                      issue ?? "-",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _infoRow(
                        image: Image.asset("assets/images/person.png"),
                        text: name,
                      ),
                    ),

                    if (assignmentStatus.toLowerCase() == 'in-progress')
                      Row(
                        children: [
                          Icon(
                            Icons.timer,
                            size: 16,
                            color: AppColors.primary_clr,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            format(timer.elapsed),
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),

                _infoRow(
                  image: Image.asset("assets/images/expect.png"),
                  text: service,
                  iconBg: const Color.fromARGB(156, 169, 227, 212),
                ),
                const SizedBox(height: 5),
                if (payment != null) ...[
                  _infoRow(
                    image: Image.asset("assets/images/clock.png"),
                    text: "Payment: BHD ${payment.toString()}",
                  ),
                ],
                if (assignment == null) ...[
                  _infoRow(
                    image: Image.asset("assets/images/clock.png"),
                    text: schedule ?? "_",
                  ),
                ],
                if (assignment?.updatedAt != null) ...[
                  const SizedBox(height: 5),
                  _infoRow(
                    image: Image.asset("assets/images/clock.png"),
                    text: "Updated: ${(assignment!.updatedAt)}",
                    iconBg: const Color.fromARGB(156, 255, 224, 178),
                  ),
                ],
                const SizedBox(height: 8),
                Row(
                  children: [
                    if (assignment != null) ...[
                      _iconBox(
                        image: Image.asset("assets/images/distance.png"),
                        bgColor: const Color.fromARGB(156, 169, 227, 212),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          assignment.workDuration.toString(),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ] else ...[
                      _iconBox(
                        image: Image.asset("assets/images/distance.png"),
                        bgColor: const Color.fromARGB(156, 169, 227, 212),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text("—", style: TextStyle(fontSize: 14)),
                      ),
                    ],
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: assignmentStatus == "pending"
                            ? AppColors.new_clr
                            : assignmentStatus == "rejected"
                            ? Colors.red
                            : AppColors.primary_clr,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        assignmentStatus,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // -------- REUSABLE ROW --------
  static Widget _infoRow({
    required Image image,
    required String text,
    Color? iconBg,
  }) {
    return Row(
      children: [
        _iconBox(image: image, bgColor: iconBg),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  static Widget _iconBox({required Image image, Color? bgColor}) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: image,
    );
  }
}
