import 'package:flutter/material.dart';
import 'package:tech_app/core/constants/app_colors.dart';
import 'package:tech_app/widgets/header.dart';
import 'package:tech_app/widgets/inputs/app_text_field.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(title: "Profile Management"),
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 10),
            Stack(
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, size: 90),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary_clr,
                    ),
                    child: Icon(Icons.person_pin_circle),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "Babar Azam",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            const SizedBox(height: 5),
            Text("Senior Service Tehnician"),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(15),
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Personal informarion",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Full Name",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 15),
                        AppTextField(label: "Babar"),
                        const SizedBox(height: 10),

                        Text(
                          "Last Name",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 15),
                        AppTextField(label: "Babar"),
                        const SizedBox(height: 10),

                        Text(
                          "Email",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 15),
                        AppTextField(label: "Babar"),
                        const SizedBox(height: 10),

                        Text(
                          "Mobile Number",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 15),
                        AppTextField(label: "Babar"),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
