import 'package:flutter/material.dart';
import 'package:tech_app/core/constants/app_colors.dart';
import 'package:tech_app/widgets/inputs/app_dropdown.dart';
import 'package:tech_app/widgets/inputs/app_text_field.dart';
import 'package:tech_app/widgets/inputs/primary_button.dart';

class BulkRequest extends StatefulWidget {
  const BulkRequest({super.key});

  @override
  State<BulkRequest> createState() => _BulkRequestState();
}

class _BulkRequestState extends State<BulkRequest> {
  List<int> materials = [0]; // Start with one material card

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              // Render all material cards dynamically
              ...materials.asMap().entries.map(
                (entry) => materialCard(entry.key),
              ),

              
              PrimaryButton(
                radius: 12,
                color: AppColors.scoundry_clr,
                height: 55,
                Width: double.infinity,
                onPressed: () {
                  setState(() {
                    materials.add(materials.length); 
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

  //  Material Card
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
                if (materials.length > 1)
                  IconButton(
                    icon: const Icon(Icons.cancel, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        materials.removeAt(index); 
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
                  label: "Select material",
                  items: const ["Name 1", "Name 2"],
                  value: null,
                  onChanged: (value) {},
                  validator: (value) {
                    if (value == null) return "Select material";
                    return null;
                  },
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
