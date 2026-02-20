import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:restaurant_app/presentation/home/widgets/nutritions_box.dart';
import 'package:restaurant_app/presentation/home/widgets/today_nutrition_sheet.dart';
import 'package:restaurant_app/presentation/settings/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedDay = "Today";
  int expandedIndex = -1;
  int currentIndex = 0;
  DateTime? selectedDate;
  final TextEditingController _controller = TextEditingController();

  Future<void> _pickDate() async {
    DateTime now = DateTime.now();

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 18),
      firstDate: DateTime(1900),
      lastDate: DateTime(now.year),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _controller.text = DateFormat('MM/dd/yyyy').format(picked);
      });
    }
  }

  final List<Widget> screens = [
    HomeScreen(),
    // PantryScreen(),
    // GroceriesScreen(),
    // FoodPrefScreen(),
    SettingsScreen(), // 👈 yahan add karo
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 235, 235, 1),
      extendBodyBehindAppBar: true,

      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     color: const Color.fromARGB(255, 24, 24, 24),

      //     // 👇 Bottom corners radius
      //     borderRadius: const BorderRadius.only(
      //       bottomLeft: Radius.circular(24),
      //       bottomRight: Radius.circular(24),
      //     ),

      //     // 👇 Box Shadow
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.black.withOpacity(0.15),
      //         blurRadius: 10,
      //         spreadRadius: 2,
      //         offset: const Offset(0, -3), // shadow upar ki taraf
      //       ),
      //     ],
      //   ),
      //   child: ClipRRect(
      //     borderRadius: const BorderRadius.only(
      //       bottomLeft: Radius.circular(24),
      //       bottomRight: Radius.circular(24),
      //     ),
      //     child: BottomNavigationBar(
      //       backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      //       //currentIndex: 0,
      //       type: BottomNavigationBarType.fixed,
      //       selectedItemColor: Colors.black,
      //       unselectedItemColor: Colors.grey,
      //       selectedLabelStyle: TextStyle(
      //         fontSize: 12,
      //         fontWeight: FontWeight.w500,
      //       ),
      //       currentIndex: currentIndex,
      //       onTap: (index) {
      //         setState(() {
      //           currentIndex = index;
      //         });
      //       },
      //       items: [
      //         BottomNavigationBarItem(
      //           icon: Image.asset(
      //             "assets/home/home.png",
      //             width: 20,
      //             height: 20,
      //           ),
      //           label: "Home",
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Image.asset(
      //             "assets/home/panttery.png",
      //             width: 20,
      //             height: 20,
      //           ),
      //           label: "Pantry",
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Image.asset(
      //             "assets/home/grociry.png",
      //             width: 20,
      //             height: 20,
      //           ),
      //           label: "Groceries",
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Image.asset(
      //             "assets/home/food-pref.png",
      //             width: 20,
      //             height: 20,
      //           ),
      //           label: "Food Pref",
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Image.asset(
      //             "assets/home/setting.png",
      //             width: 20,
      //             height: 20,
      //           ),
      //           label: "Settings",
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 4.6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔹 Top Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                          "assets/home/profile-img.png",
                        ),
                      ),
                      SizedBox(width: 4.6.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome\nback!",
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            "Junaid",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // const Icon(Icons.notifications_none, size: 28),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Image.asset(
                        "assets/home/bell-icon.png",
                        width: 25,
                        height: 25,
                      ),

                      Positioned(
                        right: -1,
                        top: -1,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 3.1.h),

              Container(
                padding: EdgeInsets.only(
                  top: 1.8.h,
                  bottom: 2.2.h,
                  left: 1.2.h,
                  right: 1.2.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Complete your profile",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.25,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),

                          child: Text(
                            "70% Complete",
                            style: TextStyle(
                              color: Color.fromRGBO(31, 31, 31, 1),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              height: 1,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 1.h),
                    LinearProgressIndicator(
                      value: 0.7,
                      color: Color.fromRGBO(112, 112, 112, 1),
                      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    SizedBox(height: 1.8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Complete Profile",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            height: 1.2,
                          ),
                        ),
                        Text(
                          "3 steps remaining",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            height: 1.2,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 3.0.h),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.5.w,
                  vertical: 1.9.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(64, 75, 82, 1),
                      Color.fromRGBO(151, 151, 151, 1),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Let's cook your\nbreakfast/lunch/\ndinner",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  height: 1.2,
                                  fontSize: 20.sp,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "AI-generated recipes\ncustomized to your taste\nand diet.",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 0.8.h),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromRGBO(
                                    31,
                                    31,
                                    31,
                                    1,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 6.w,
                                    vertical: 0.8.h,
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Create Now",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    height: 1.4,
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Image.asset(
                            "assets/home/delicious-food-background 1.png",

                            height: 23.1.h,
                            width: 50.1.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 3.h),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.1.w,
                  vertical: 1.9.h,
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Meal Summary",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            height: 1.25,
                          ),
                        ),

                        Row(
                          children: [
                            Image.asset(
                              "assets/onboarding/onboarding_calendar.png",
                              width: 18,
                              height: 18,
                            ),
                            SizedBox(width: 1.62.w),
                            Container(
                              //padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(235, 235, 235, 1),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                children: [
                                  _toggleButton("Yesterday"),
                                  _toggleButton("Today"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 1.0.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.7.w,
                        vertical: 2.14.h,
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        //borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color.fromRGBO(229, 229, 229, 1),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          _mealSection(
                            index: 0,
                            title: "Breakfast",
                            status: "Completed",
                            time: "08:30 AM",
                            isCompleted: true,
                            foods: const [
                              {
                                "name": "Oatmeal with berries",
                                "kcal": "320 kcal",
                              },
                              {"name": "Greek yogurt", "kcal": "100 kcal"},
                            ],
                          ),
                          const SizedBox(height: 15),

                          _mealSection(
                            index: 1,
                            title: "Lunch",
                            status: "Completed",
                            time: "12:45",
                            isCompleted: true,
                          ),
                          const SizedBox(height: 15),

                          _mealSection(
                            index: 2,
                            title: "Dinner",
                            status: "Upcoming",
                            time: "07:00",
                            isCompleted: false,
                          ),
                        ],
                      ),
                    ),
                    // ListTile(
                    //   leading: Icon(Icons.breakfast_dining),
                    //   title: Text("Breakfast"),
                    //   subtitle: Text("Completed - 430 cal"),
                    // ),
                    // ListTile(
                    //   leading: Icon(Icons.lunch_dining),
                    //   title: Text("Lunch"),
                    //   subtitle: Text("Completed - 650 cal"),
                    // ),
                    // ListTile(
                    //   leading: Icon(Icons.dinner_dining),
                    //   title: Text("Dinner"),
                    //   subtitle: Text("Upcoming"),
                    // ),
                  ],
                ),
              ),

              SizedBox(height: 2.8.h),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 1.9.h,
                  vertical: 2.7.w,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Today's Nutrition",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            height: 1.2,
                            color: Color.fromRGBO(31, 31, 31, 1),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2.5.h,
                            vertical: 0.8.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Color.fromRGBO(10, 6, 21, 1),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(
                                      20,
                                    ), // 👈 bottom radius
                                    bottomRight: Radius.circular(
                                      20,
                                    ), // 👈 bottom radius
                                  ),
                                ),
                                builder: (context) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      bottom: 10.7.h,
                                      left: 4.6.w,
                                      right: 4.6.w,
                                    ),
                                    child: const TodayNutritionSheet(),
                                  );
                                },
                              );
                            },
                            child: Text(
                              "View Details",
                              style: TextStyle(
                                fontSize: 14.sp,
                                height: 1,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 2.1.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Calories",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            height: 1.2,
                            color: Color.fromRGBO(31, 31, 31, 1),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2.5.h,
                            vertical: 0.8.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Color.fromRGBO(10, 6, 21, 1),
                          ),
                          child: Text(
                            "1450 / 2000 kcal",
                            style: TextStyle(
                              fontSize: 14.sp,
                              height: 1,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.3.h),

                    LinearProgressIndicator(
                      value: 0.45,
                      backgroundColor: Color.fromRGBO(220, 220, 220, 1),
                      color: Color.fromRGBO(112, 112, 112, 1),
                      borderRadius: BorderRadius.circular(8),
                      minHeight: 1.h,
                    ),
                    const SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        NutritionBox(
                          title: "Protein",
                          percentage: 48,
                          unit: "56g",
                        ),

                        NutritionBox(
                          title: "Carbs",
                          percentage: 80,
                          unit: "250g",
                        ),
                        NutritionBox(
                          title: "Lipids",
                          percentage: 40,
                          unit: "50g",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3.5.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _toggleButton(String text) {
    bool isSelected = selectedDay == text;

    return GestureDetector(
      onTap: () {
        _pickDate();
        setState(() {
          selectedDay = text;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Color.fromRGBO(112, 112, 112, 1),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _mealSection({
    required int index,
    required String title,
    required String status,
    required String time,
    required bool isCompleted,
    List<Map<String, String>>? foods,
  }) {
    bool isExpanded = expandedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isExpanded) {
            expandedIndex = -1;
          } else {
            expandedIndex = index;
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: 1.0.h, vertical: 2.3.w),
        decoration: BoxDecoration(
          color: Color.fromRGBO(249, 250, 251, 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.black,
                    ),
                    SizedBox(width: 1.1.w),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.3.w,
                        vertical: 0.4.h,
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            isCompleted
                                ? "assets/home/food-icon.png"
                                : "assets/home/clock.png",
                            width: 12,
                            height: 12,
                          ),
                          SizedBox(width: 1.16.w),
                          Text(
                            status,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              height: 1,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 2.3.w),
                    Text(
                      time,
                      style: TextStyle(
                        color: Color.fromRGBO(31, 31, 31, 1),
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(width: 2.5.w),
                    Image.asset(
                      isExpanded
                          ? "assets/home/upward-arrow.png"
                          : "assets/home/downward-arrow.png",
                      width: 16,
                      height: 16,
                    ),
                    // Icon(
                    //   isExpanded
                    //       ? Icons.keyboard_arrow_up
                    //       : Icons.keyboard_arrow_down,
                    // ),
                  ],
                ),
              ],
            ),

            /// 🔹 Show Food Details Only If Expanded
            if (isExpanded) ...[
              SizedBox(height: 1.2.h),
              const Divider(
                thickness: 1,
                color: Color.fromRGBO(220, 220, 220, 1),
              ),

              SizedBox(height: 1.2.h),
              if (foods != null)
                for (var food in foods)
                  Padding(
                    padding: EdgeInsets.only(bottom: 1.2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          food["name"] ?? "",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(31, 31, 31, 1),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2.3.w,
                            vertical: 0.3.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            food["kcal"] ?? "",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            ],
          ],
        ),
      ),
    );
  }

  // Widget _mealSection({
  //   required int index,
  //   required String title,
  //   required String status,
  //   required String time,
  //   required bool isCompleted,
  //   List<Map<String, String>>? foods,
  // }) {
  //   bool isExpanded = expandedIndex == index;
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         if (isExpanded) {
  //           expandedIndex = -1; // close
  //         } else {
  //           expandedIndex = index; // open selected
  //         }
  //       });
  //     },
  //     child: AnimatedContainer(
  //       duration: const Duration(milliseconds: 300),
  //       padding: const EdgeInsets.all(15),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(16),
  //       ),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           /// Top Row
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Row(
  //                 children: [
  //                   const CircleAvatar(
  //                     radius: 6,
  //                     backgroundColor: Colors.black,
  //                   ),
  //                   const SizedBox(width: 8),
  //                   Text(
  //                     title,
  //                     style: const TextStyle(
  //                       fontSize: 16,
  //                       fontWeight: FontWeight.w600,
  //                     ),
  //                   ),
  //                 ],
  //               ),

  //               Row(
  //                 children: [
  //                   _statusBadge(status, isCompleted),
  //                   const SizedBox(width: 8),
  //                   Text(time),
  //                 ],
  //               ),
  //             ],
  //           ),

  //           /// Food Items
  //           if (foods != null) ...[
  //             const SizedBox(height: 12),
  //             ...foods.map(
  //               (food) => Padding(
  //                 padding: const EdgeInsets.only(bottom: 8),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [Text(food["name"]!), _kcalBadge(food["kcal"]!)],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ],
  //       ),
  //     ),
  //   );
  // }

  /// 🔹 Status Badge
  Widget _statusBadge(String text, bool isCompleted) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  /// 🔹 Kcal Badge
  Widget _kcalBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
