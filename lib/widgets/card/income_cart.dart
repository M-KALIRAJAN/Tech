import 'package:flutter/material.dart';

import 'package:tech_app/core/constants/app_colors.dart';


class IncomeCard extends StatelessWidget {
    final String name;
  final String service;
  final String issue;
  final String schedule;
  final String assignmentStatus;
  final VoidCallback onClick;
  const IncomeCard({super.key, 
  required this.name,
   required this.service, 
   required this.issue,
    required this.schedule, 
    required this.assignmentStatus, 
    required this.onClick});

  @override
  Widget build(BuildContext context) {
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
            onTap:onClick,
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
                children:  [
                  Expanded(
                    child: Text(
                      issue,
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
                _infoRow(icon: Icons.person, text: name),
                const SizedBox(height: 8),

                _infoRow(
                  icon: Icons.pages,
                  text: service,
                  iconBg: const Color.fromARGB(156, 169, 227, 212),
                ),
                const SizedBox(height: 8),

                _infoRow(
                  icon: Icons.local_activity,
                  text: schedule,
                ),

                const SizedBox(height: 12),
                Row(
                  children: [
                    _iconBox(
                      icon: Icons.pages,
                      bgColor: const Color.fromARGB(156, 169, 227, 212),
                    ),
                    const SizedBox(width: 10),
                     Expanded(
                      child: Text("8km", style: TextStyle(fontSize: 14)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.new_clr,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child:  Text(
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

  // ---------- REUSABLE ROW ----------
  static Widget _infoRow({
    required IconData icon,
    required String text,
    Color? iconBg,
  }) {
    return Row(
      children: [
        _iconBox(icon: icon, bgColor: iconBg),
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

  static Widget _iconBox({required IconData icon, Color? bgColor}) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(icon, size: 18),
    );
  }
}






