import 'package:flutter/material.dart';
import 'package:tech_app/view/bottom_nav.dart';
import 'package:tech_app/widgets/inputs/app_text_field.dart';
import 'package:tech_app/widgets/inputs/primary_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back.png"),
            fit: BoxFit.cover,
          ),
        ),

        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),

                Center(child: Image.asset("assets/images/logo.png")),

                SizedBox(height: 30),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Welcome!",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15),

                      AppTextField(
                        label: "Enter Email",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 15),

                      AppTextField(
                        label: "Enter Password",
                        keyboardType: TextInputType.visiblePassword,
                        surfixIcon: Icon(Icons.visibility_off),
                      ),

                      SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: (v) {
                                  setState(() {
                                    isChecked = v!;
                                  });
                                },
                              ),
                              Text("Remember me"),
                            ],
                          ),

                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => BottomNav()),
                              );
                            },
                            child: Text("Forgot Password?"),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),

                      PrimaryButton(
                        height: 48,
                        Width: double.infinity,
                        radius: 12,
                        color: Colors.green,
                        onPressed: () {},
                        text: "Login",
                      ),

                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
