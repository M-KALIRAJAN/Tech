import 'package:flutter/material.dart';
import 'package:tech_app/core/constants/app_colors.dart';
import 'package:tech_app/widgets/card/income_cart.dart';
import 'package:tech_app/widgets/card/request_cart.dart';
import 'package:tech_app/widgets/header.dart';

// 🔹 TEMP MODELS (remove when API ready)
class IncomeModel {}
class RequestModel {}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  // sATIC LIST DATA (replace with API later)
  List<IncomeModel> incomeList =
      List.generate(7, (index) => IncomeModel());

  List<RequestModel> completedList =
      List.generate(1, (index) => RequestModel());

  //  FILTER TITLES
final List<String> filters = [
  'All',
  'New',
  'Accepted',
  'Pending',
  'Completed',
  'Cancelled',
];


  //  FILTER CHECK
  bool get isCompletedSelected =>
      filters[selectedIndex] == 'Completed';

  //  STATIC COUNTS
  String getFilterCount(String title) {
    switch (title) {
      case 'All':
        return (incomeList.length + completedList.length).toString();
      case 'New':
        return '2';
      case 'Accepted':
        return '4';
      case 'Pending':
        return '4';
      case 'Completed':
        return completedList.length.toString();
      case 'Cancelled':
        return '3';
      default:
        return '0';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_clr,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Header(title: "Income Request"),
            ),

            const Divider(),
            const SizedBox(height: 10),

            //  FILTER LIST
            SizedBox(
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  final isSelected = selectedIndex == index;

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
                        border: Border.all(
                          color: AppColors.scoundry_clr,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            filter,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            height: 20,
                            width: 20,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSelected
                                  ? Colors.white
                                  : AppColors.primary_clr,
                            ),
                            child: Text(
                              getFilterCount(filter),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: isSelected
                                    ? AppColors.scoundry_clr
                                    : Colors.white,
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

            const SizedBox(height: 20),

            //  LIST VIEW SWITCH
            Expanded(
              child: isCompletedSelected
                  ? _buildCompletedList()
                  : _buildIncomeList(),
            ),
          ],
        ),
      ),
    );
  }

  //  INCOME LIST
  Widget _buildIncomeList() {
    if (incomeList.isEmpty) {
      return const Center(child: Text("No Income Requests"));
    }

    return ListView.builder(
      itemCount: incomeList.length,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: IncomeCard(),
        );
      },
    );
  }

  //  COMPLETED LIST
  Widget _buildCompletedList() {
    if (completedList.isEmpty) {
      return const Center(child: Text("No Completed Requests"));
    }

    return ListView.builder(
      itemCount: completedList.length,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: RequestCart(),
        );
      },
    );
  }
}
