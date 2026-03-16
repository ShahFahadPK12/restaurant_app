class OnboardingData {
  final String? gender;
  final DateTime? dateOfBirth;
  final int? height;
  final String? heightUnit;
  final int? weight;
  final String? weightUnit;
  final String? activityLevel;
  final String? sleepQuality;
  final String? primaryGoal;
  final String? sportType;
  final String? bodyCompositionGoal;
  final String? wellbeingPriority;
  final String? stressLevel;
  final String? riskCondition;
  final String? dietaryRestriction;
  final String? mealsConsumed;
  final String? alcoholFrequency;
  final String? eatingTime;
  final String? mealPrepTime;
  final String? eatOutFrequency;
  final String? sugaryDrinksFrequency;
  final String? supplements;

  const OnboardingData({
    required this.gender,
    required this.dateOfBirth,
    required this.height,
    required this.heightUnit,
    required this.weight,
    required this.weightUnit,
    required this.activityLevel,
    required this.sleepQuality,
    required this.primaryGoal,
    required this.sportType,
    required this.bodyCompositionGoal,
    required this.wellbeingPriority,
    required this.stressLevel,
    required this.riskCondition,
    required this.dietaryRestriction,
    required this.mealsConsumed,
    required this.alcoholFrequency,
    required this.eatingTime,
    required this.mealPrepTime,
    required this.eatOutFrequency,
    required this.sugaryDrinksFrequency,
    required this.supplements,
  });

  Map<String, dynamic> toJson() {
    return {
      "gender": gender,
      "dateOfBirth": dateOfBirth?.toIso8601String(),
      "height": height,
      "heightUnit": heightUnit,
      "weight": weight,
      "weightUnit": weightUnit,
      "activityLevel": activityLevel,
      "sleepQuality": sleepQuality,
      "primaryGoal": primaryGoal,
      "sportType": sportType,
      "bodyCompositionGoal": bodyCompositionGoal,
      "wellbeingPriority": wellbeingPriority,
      "stressLevel": stressLevel,
      "riskCondition": riskCondition,
      "dietaryRestriction": dietaryRestriction,
      "mealsConsumed": mealsConsumed,
      "alcoholFrequency": alcoholFrequency,
      "eatingTime": eatingTime,
      "mealPrepTime": mealPrepTime,
      "eatOutFrequency": eatOutFrequency,
      // Roman Urdu: Strapi me field name "sugarDrinksFrequency" hai.
      "sugarDrinksFrequency": sugaryDrinksFrequency,
      "supplements": supplements,
    };
  }

  factory OnboardingData.fromJson(Map<String, dynamic> json) {
    DateTime? parseDate(String? raw) {
      if (raw == null || raw.isEmpty) {
        return null;
      }
      return DateTime.tryParse(raw);
    }

    return OnboardingData(
      gender: json["gender"] as String?,
      dateOfBirth: parseDate(json["dateOfBirth"] as String?),
      height: json["height"] as int?,
      heightUnit: json["heightUnit"] as String?,
      weight: json["weight"] as int?,
      weightUnit: json["weightUnit"] as String?,
      activityLevel: json["activityLevel"] as String?,
      sleepQuality: json["sleepQuality"] as String?,
      primaryGoal: json["primaryGoal"] as String?,
      sportType: json["sportType"] as String?,
      bodyCompositionGoal: json["bodyCompositionGoal"] as String?,
      wellbeingPriority: json["wellbeingPriority"] as String?,
      stressLevel: json["stressLevel"] as String?,
      riskCondition: json["riskCondition"] as String?,
      dietaryRestriction: json["dietaryRestriction"] as String?,
      mealsConsumed: json["mealsConsumed"] as String?,
      alcoholFrequency: json["alcoholFrequency"] as String?,
      eatingTime: json["eatingTime"] as String?,
      mealPrepTime: json["mealPrepTime"] as String?,
      eatOutFrequency: json["eatOutFrequency"] as String?,
      sugaryDrinksFrequency: json["sugarDrinksFrequency"] as String?,
      supplements: json["supplements"] as String?,
    );
  }
}
