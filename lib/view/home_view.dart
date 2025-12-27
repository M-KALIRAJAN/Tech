import 'package:flutter/material.dart';
import 'package:tech_app/core/constants/app_colors.dart';
import 'package:tech_app/widgets/card/material_cart.dart';
import 'package:tech_app/widgets/card/request_cart.dart';
import 'package:tech_app/widgets/header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_clr,
      body: SafeArea(
        child: Column(
          children: [
            Header(title: "Request Information",),

             MaterialCart()
          ],
        ),
      ),
    );
  }
}
