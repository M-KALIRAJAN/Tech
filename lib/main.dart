import 'package:flutter/material.dart';
import 'package:tech_app/routes/app_route.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routerConfig: Approute,
     theme: ThemeData(
           fontFamily: "Poppins"
     ),
    
    );
  }
}

