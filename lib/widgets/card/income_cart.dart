import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_app/core/constants/app_colors.dart';
import 'package:tech_app/routes/route_name.dart';

class IncomeCard extends StatelessWidget {
  const IncomeCard({super.key});

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
            onTap: () {
              context.push(RouteName.service_card);
            },
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
                children: const [
                  Expanded(
                    child: Text(
                      'Leaky Faucet Repair',
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
                _infoRow(icon: Icons.person, text: 'Irshad'),
                const SizedBox(height: 8),

                _infoRow(
                  icon: Icons.pages,
                  text: 'Plumbing',
                  iconBg: const Color.fromARGB(156, 169, 227, 212),
                ),
                const SizedBox(height: 8),

                _infoRow(
                  icon: Icons.local_activity,
                  text: 'March 15, 2024 at 10:00 AM',
                ),

                const SizedBox(height: 12),
                Row(
                  children: [
                    _iconBox(
                      icon: Icons.pages,
                      bgColor: const Color.fromARGB(156, 169, 227, 212),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text('Plumbing', style: TextStyle(fontSize: 14)),
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
                      child: const Text(
                        'New',
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
