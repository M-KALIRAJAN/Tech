import 'package:flutter/material.dart';
import 'package:tech_app/core/constants/app_colors.dart';
import 'package:tech_app/model/Inventory_Material_Model.dart';
import 'package:tech_app/services/ProductList.dart';
import 'package:tech_app/widgets/inputs/app_dropdown.dart';
import 'package:tech_app/widgets/inputs/app_text_field.dart';
import 'package:tech_app/widgets/inputs/primary_button.dart';

class BulkRequest extends StatefulWidget {
  const BulkRequest({super.key});

  @override
  State<BulkRequest> createState() => _BulkRequestState();
}

class _BulkRequestState extends State<BulkRequest> {
  final Productlist _productlist = Productlist();

  List<Product> products = []; // master product list
  List<Product?> materialSelections = [null]; // cards list

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    final result = await _productlist.fetchproductlist();
    setState(() {
      products = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              ...materialSelections.asMap().entries.map(
                (entry) => materialCard(entry.key),
              ),

              PrimaryButton(
                radius: 12,
                color: AppColors.scoundry_clr,
                height: 55,
                Width: double.infinity,
                onPressed: () {
                  setState(() {
                    materialSelections.add(null); //  add new card
                  });
                },
                text: "Add New Material",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget materialCard(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.primary_clr,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Material ${index + 1}",
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                if (materialSelections.length > 1)
                  IconButton(
                    icon: const Icon(Icons.cancel, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        materialSelections.removeAt(index); // ✅ remove card
                      });
                    },
                  ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Material Name"),
                const SizedBox(height: 8),

                AppDropdown(
                  label: "Select Product",
                  items: products.map((e) => e.productName).toList(),
                  value: materialSelections[index]?.productName,
                  onChanged: (value) {
                    final product = products.firstWhere(
                      (e) => e.productName == value,
                    );
                    setState(() {
                      materialSelections[index] = product;
                    });
                    debugPrint(
                      "materialSelections ${materialSelections[index]?.productName}",
                    );
                    debugPrint(
                      "materialSelections  id${materialSelections[index]?.id}",
                    );
                  },
                  validator: (value) =>
                      value == null ? "Please select product" : null,
                ),

                const SizedBox(height: 16),
                const Text("Quantity Needed"),
                const SizedBox(height: 8),

                AppTextField(
                  label: "e.g 25",
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter quantity";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
