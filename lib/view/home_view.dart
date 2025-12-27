import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(183, 213, 205, 1),
                  ),
                  child: Icon(Icons.arrow_back_rounded, color: Colors.white),
                ),
                Text(
                  "Request Information",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Stack(
                  children: [
                    Container(
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(183, 213, 205, 1),
                      ),
                      child: Icon(
                        Icons.notifications_none_outlined,
                        color: Colors.white,
                        size: 27,
                      ),
                    ),
                    Positioned(
                      top: 5,
                      left: 17,
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                        child: Text("0", style: TextStyle(fontSize: 12)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
