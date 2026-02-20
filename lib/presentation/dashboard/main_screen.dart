import 'package:restaurant_app/presentation/food-pref/screens/food-pref.dart';
import 'package:restaurant_app/presentation/grocery/screen/grocery_screen.dart';
import 'package:restaurant_app/presentation/home/screens/home_screen.dart';
import 'package:restaurant_app/presentation/panttery/screens/panttery_screen.dart';
import 'package:restaurant_app/presentation/settings/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    PantteryScreen(),
    GroceryScreen(),
    FoodPrefScreen(),
    SettingsScreen(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 24, 24, 24),

          // 👇 Bottom corners radius
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),

          // 👇 Box Shadow
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, -3), // shadow upar ki taraf
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            onTap: onItemTapped,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/home/home.png",
                  color: selectedIndex == 0
                      ? Color.fromRGBO(31, 31, 31, 1)
                      : Color.fromRGBO(162, 162, 162, 1),
                  width: 20,
                  height: 20,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/home/panttery.png",
                  color: selectedIndex == 1
                      ? Color.fromRGBO(31, 31, 31, 1)
                      : Color.fromRGBO(162, 162, 162, 1),
                  width: 20,
                  height: 20,
                ),
                label: "Pantry",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/home/grociry.png",
                  color: selectedIndex == 2
                      ? Color.fromRGBO(31, 31, 31, 1)
                      : Color.fromRGBO(162, 162, 162, 1),
                  width: 20,
                  height: 20,
                ),
                label: "Groceries",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/home/food-pref.png",
                  color: selectedIndex == 3
                      ? Color.fromRGBO(31, 31, 31, 1)
                      : Color.fromRGBO(162, 162, 162, 1),
                  width: 20,
                  height: 20,
                ),
                label: "Food Pref",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/home/setting.png",
                  color: selectedIndex == 4
                      ? Color.fromRGBO(31, 31, 31, 1)
                      : Color.fromRGBO(162, 162, 162, 1),
                  width: 20,
                  height: 20,
                ),
                label: "Settings",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
