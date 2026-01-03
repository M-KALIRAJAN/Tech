import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_app/core/constants/app_colors.dart';
import 'package:tech_app/routes/route_name.dart';
import 'package:tech_app/widgets/card/material_cart.dart';
import 'package:tech_app/widgets/header.dart';
import 'package:tech_app/widgets/inputs/primary_button.dart';

class MaterialInventoryView extends StatefulWidget {
  const MaterialInventoryView({super.key});

  @override
  State<MaterialInventoryView> createState() => _MaterialInventoryViewState();
}

class _MaterialInventoryViewState extends State<MaterialInventoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Header(title: "Material Inventory", showRefreshIcon: true),
            ),
           
            const Divider(),
            const SizedBox(height: 10),
            MaterialCart(),

            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PrimaryButton(
                radius: 10,
                color: AppColors.scoundry_clr,
                onPressed: () {
                  context.push(RouteName.material_request);
                },
                Width: double.infinity,
                height: 50,
                text: "Request Material",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
