import 'package:flutter/material.dart';
import 'package:tech_app/view/home_view.dart';
import 'package:tech_app/view/livechat_view.dart';
import 'package:tech_app/view/my_request_view.dart';
import 'package:tech_app/view/profile_view.dart';
import 'package:tech_app/view/setting_view.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  late final List<Widget Function()> screens;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screens = [
    ()=>  HomeView(),
     ()=> MyRequestView(),
     ()=> LivechatView(),
      ()=>ProfileView(),
     ()=> SettingView(),
    ];
  }
    void changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex](),
      bottomNavigationBar: Container(
        height: 85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            backgroundColor: Colors.white,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/home.png"), size: 26),
                activeIcon: ImageIcon(
                  AssetImage("assets/icons/home.png"),
                  size: 26,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/icons/services.png"),
                  size: 27,
                ),
                activeIcon: ImageIcon(
                  AssetImage("assets/icons/services.png"),
                  size: 27,
                ),
                label: "My Request",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/chat.png"), size: 26),
                activeIcon: ImageIcon(
                  AssetImage("assets/icons/chat.png"),
                  size: 26,
                ),
                label: "Live chat",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/icons/profile.png"),
                  size: 26,
                ),
                activeIcon: ImageIcon(
                  AssetImage("assets/icons/profile.png"),
                  size: 26,
                ),
                label: "Profile",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/icons/setting.png"),
                  size: 26,
                ),
                activeIcon: ImageIcon(
                  AssetImage("assets/icons/setting.png"),
                  size: 26,
                ),
                label: "Setting",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
