import 'package:flutter/material.dart';
import 'package:tech_app/core/constants/app_colors.dart';

class SparePartUsed extends StatefulWidget {
  const SparePartUsed({super.key});

  @override
  State<SparePartUsed> createState() => _SparePartUsedState();
}

class _SparePartUsedState extends State<SparePartUsed> {
  bool isSparePartsUsed = false;

  final List<Map<String, dynamic>> spareParts = [
    {'name': 'Oil Filter', 'price': 75.88, 'checked': false},
    {'name': 'Air Plug Set', 'price': 45.88, 'checked': false},
    {'name': 'Cabin Air Filter', 'price': 15.30, 'checked': false},
    {'name': 'Spark Plug Set', 'price': 35.00, 'checked': false},
  ];
  final List<Map<String, dynamic>> paymentlist = [
    {"name": "spark", 'price': 35.00},
    {"name": "spark", 'price': 35.00},
    {"name": "spark", 'price': 35.00},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_clr,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ///  MAIN CHECKBOX
              Row(
                children: [
                  Checkbox(
                    value: isSparePartsUsed,
                    activeColor: AppColors.scoundry_clr,
                    onChanged: (value) {
                      setState(() {
                        isSparePartsUsed = value!;
                      });
                    },
                  ),
                  const Text(
                    "Spare Parts Used",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              ///  AVAILABLE PARTS
              _availablePartsCard(),

              const SizedBox(height: 20),

              ///  PAYMENT SUMMARY
              _paymentSummaryCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _availablePartsCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        children: [
          _cardHeader("Available Parts", AppColors.primary_clr),

          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: spareParts.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final item = spareParts[index];

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: item['checked'],
                      activeColor: AppColors.scoundry_clr,
                      onChanged: !isSparePartsUsed
                          ? null
                          : (value) {
                              setState(() {
                                item['checked'] = value!;
                              });
                            },
                    ),
                    Expanded(
                      child: Text(
                        item['name'],
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    Text(
                      'BHD ${item['price'].toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _paymentSummaryCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        children: [
          _cardHeader("Payment Summary", AppColors.lightgray_clr),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: paymentlist.length,
            itemBuilder: (context, index) {
              final payments = paymentlist[index];
              return Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(payments['name']),
                    Text(
                      "BHD ${payments['price']}",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

 

  Widget _cardHeader(String title, Color bgColor) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
