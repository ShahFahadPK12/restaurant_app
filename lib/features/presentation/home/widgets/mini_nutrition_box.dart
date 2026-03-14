  import 'package:flutter/material.dart';
  class NutritionMiniBox extends StatelessWidget {
  final String title;
  final double percent;
  final String unit;

  const NutritionMiniBox({
    super.key,
    required this.title,
    required this.percent,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 12),
          ),
          const SizedBox(height: 8),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                  value: percent / 100,
                  strokeWidth: 4,
                  backgroundColor: Colors.grey,
                  color: Colors.white,
                ),
              ),
              Text(
                "$percent%\n$unit",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white, fontSize: 10),
              )
            ],
          )
        ],
      ),
    );
  }
}




