import 'package:flutter/material.dart';
import 'package:tech_app/core/constants/app_colors.dart';
import 'package:tech_app/widgets/card/income_cart.dart';
import 'package:tech_app/widgets/card/material_cart.dart';
import 'package:tech_app/widgets/card/request_cart.dart';
import 'package:tech_app/widgets/header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  final List<Map<String, dynamic>> filters = [
    {'title': 'All', 'count': "7"},
    {'title': 'New', 'count': "2"},
    {'title': 'Pending', 'count': "4"},
    {'title': 'Completed', 'count': "1"},
    {'title': 'Cancelled', 'count': "3"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_clr,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),

              child: Header(title: "Inome Request"),
            ),
            Divider(),
            SizedBox(height: 10),
            SizedBox(
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  final bool isSelected = selectedIndex == index;
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary_clr
                            : Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: AppColors.scoundry_clr),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            filter['title'],
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.white
                                  : AppColors.primary_clr,

                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              filter['count'],
                              style: TextStyle(
                                color: isSelected
                                    ? AppColors.scoundry_clr
                                    : Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: IncomeCard(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
