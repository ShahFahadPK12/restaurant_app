import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class MealTile extends StatelessWidget {
  final String title;
  final bool isExpanded;
  final VoidCallback onTap;

  const MealTile({
    super.key,
    required this.title,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(240, 240, 240, 1),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title),
                    Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// 🔹 Expanded Section
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [Text("Greek Yogurt"), Text("130 kcal")],
                  ),

                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Protein: 15g",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(162, 162, 162, 1),
                        ),
                      ),
                      Text(
                        "Calories: 8g",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(162, 162, 162, 1),
                        ),
                      ),
                      Text(
                        "Fats: 4g",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(162, 162, 162, 1),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Container(
                    height: 1,
                    color: const Color.fromRGBO(243, 244, 246, 1),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
    // return Container(
    //   decoration: BoxDecoration(
    //     color: const Color.fromARGB(255, 255, 0, 0),
    //     borderRadius: BorderRadius.circular(12),
    //   ),
    //   child: Column(
    //     children: [
    //       Container(
    //         decoration: BoxDecoration(
    //           color: const Color.fromRGBO(240, 240, 240, 1),
    //           borderRadius: BorderRadius.all(Radius.circular(12)),
    //         ),
    //         child: Column(
    //           children: [
    //             InkWell(
    //               onTap: onTap,
    //               child: Padding(
    //                 padding: const EdgeInsets.symmetric(
    //                   horizontal: 16,
    //                   vertical: 14,
    //                 ),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Text(
    //                       title,
    //                       style: const TextStyle(
    //                         fontWeight: FontWeight.w600,
    //                         fontSize: 16,
    //                       ),
    //                     ),
    //                     Icon(
    //                       isExpanded
    //                           ? Icons.keyboard_arrow_up
    //                           : Icons.keyboard_arrow_down,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),

    //             // if (isExpanded) ...[
    //             //   Container(
    //             //     width: double.infinity,
    //             //     height: 1,
    //             //     color: const Color.fromRGBO(243, 244, 246, 1),
    //             //   ),

    //             //   Padding(
    //             //     padding: const EdgeInsets.all(16),
    //             //     child: Column(
    //             //       children: [
    //             //         /// Food Row
    //             //         Row(
    //             //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             //           children: const [
    //             //             Text(
    //             //               "Greek Yogurt",
    //             //               style: TextStyle(fontWeight: FontWeight.w500),
    //             //             ),
    //             //             Text(
    //             //               "130 kcal",
    //             //               style: TextStyle(
    //             //                 fontWeight: FontWeight.w600,
    //             //                 color: Colors.black,
    //             //               ),
    //             //             ),
    //             //           ],
    //             //         ),

    //             //         const SizedBox(height: 8),

    //             //         /// Nutrition Row
    //             //         Row(
    //             //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             //           children: const [
    //             //             Text(
    //             //               "Protein: 15g",
    //             //               style: TextStyle(
    //             //                 fontSize: 12,
    //             //                 color: Color.fromRGBO(162, 162, 162, 1),
    //             //               ),
    //             //             ),
    //             //             Text(
    //             //               "Calories: 8g",
    //             //               style: TextStyle(
    //             //                 fontSize: 12,
    //             //                 color: Color.fromRGBO(162, 162, 162, 1),
    //             //               ),
    //             //             ),
    //             //             Text(
    //             //               "Fats: 4g",
    //             //               style: TextStyle(
    //             //                 fontSize: 12,
    //             //                 color: Color.fromRGBO(162, 162, 162, 1),
    //             //               ),
    //             //             ),
    //             //           ],
    //             //         ),
    //             //       ],
    //             //     ),
    //             //   ),
    //             // ],
    //             if (isExpanded)
    //               Container(
    //                 width: double.infinity,
    //                 decoration: const BoxDecoration(
    //                   color: Colors.white, // 👈 expanded bg white
    //                 ),
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(16),
    //                   child: Column(
    //                     children: [
    //                       /// 🔹 Food Row
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: const [
    //                           Text(
    //                             "Greek Yogurt",
    //                             style: TextStyle(
    //                               fontWeight: FontWeight.w500,
    //                               fontSize: 14,
    //                             ),
    //                           ),
    //                           Text(
    //                             "130 kcal",
    //                             style: TextStyle(
    //                               fontWeight: FontWeight.w600,
    //                               fontSize: 14,
    //                               color: Colors.black,
    //                             ),
    //                           ),
    //                         ],
    //                       ),

    //                       const SizedBox(height: 8),

    //                       /// 🔹 Nutrition Row
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: const [
    //                           Text(
    //                             "Protein: 15g",
    //                             style: TextStyle(
    //                               fontSize: 12,
    //                               color: Color.fromRGBO(162, 162, 162, 1),
    //                             ),
    //                           ),
    //                           Text(
    //                             "Calories: 8g",
    //                             style: TextStyle(
    //                               fontSize: 12,
    //                               color: Color.fromRGBO(162, 162, 162, 1),
    //                             ),
    //                           ),
    //                           Text(
    //                             "Fats: 4g",
    //                             style: TextStyle(
    //                               fontSize: 12,
    //                               color: Color.fromRGBO(162, 162, 162, 1),
    //                             ),
    //                           ),
    //                         ],
    //                       ),

    //                       const SizedBox(height: 12),

    //                       /// 🔥 ONLY ONE Divider (After Nutrition Row)
    //                       Container(
    //                         height: 1,
    //                         color: const Color.fromRGBO(243, 244, 246, 1),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
