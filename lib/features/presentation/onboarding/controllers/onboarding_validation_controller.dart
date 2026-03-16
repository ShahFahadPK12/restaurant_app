import 'package:get/get.dart';
import 'package:restaurant_app/features/domain/onboarding_data/entities/onboarding_data.dart';

/// Beginner-friendly controller to hold onboarding answers needed for validation.
class OnboardingValidationController extends GetxController {
  /// Step 0 (Screen 4): Gender
  final RxnString gender = RxnString();

  /// Step 1 (Screen 5): Date of birth
  final Rxn<DateTime> dateOfBirth = Rxn<DateTime>();

  /// Step 2 (Screen 6): Height
  final RxnInt height = RxnInt();
  final RxnString heightUnit = RxnString();

  /// Step 3 (Screen 7): Weight
  final RxnInt weight = RxnInt();
  final RxnString weightUnit = RxnString();

  /// Step 4 (Screen 8): Activity level
  final RxnString activityLevel = RxnString();

  /// Step 5 (Screen 9): Lifestyle / sleep quality
  final RxnString sleepQuality = RxnString();

  /// Step 6 (Screen 10): Primary goal
  final RxnString primaryGoal = RxnString();

  /// Step 7 (Screen 11): Sport type
  final RxnString sportType = RxnString();

  /// Step 8 (Screen 12): Body composition goal
  final RxnString bodyCompositionGoal = RxnString();

  /// Step 9 (Screen 13): Well-being priority
  final RxnString wellbeingPriority = RxnString();

  /// Step 10 (Screen 14): Stress level
  final RxnString stressLevel = RxnString();

  /// Step 11 (Screen 15): Risk conditions
  final RxnString riskCondition = RxnString();

  /// Step 12 (Screen 16): Dietary restriction / allergy
  final RxnString dietaryRestriction = RxnString();

  /// Step 13 (Screen 17): Meals consumed
  final RxnString mealsConsumed = RxnString();

  /// Step 14 (Screen 18): Alcohol frequency
  final RxnString alcoholFrequency = RxnString();

  /// Step 15 (Screen 19): Eating time
  final RxnString eatingTime = RxnString();

  /// Step 16 (Screen 20): Meal prep time
  final RxnString mealPrepTime = RxnString();

  /// Step 17 (Screen 21): Eat out frequency
  final RxnString eatOutFrequency = RxnString();

  /// Step 18 (Screen 22): Sugary drinks frequency
  final RxnString sugaryDrinksFrequency = RxnString();

  /// Step 19 (Screen 23): Supplements
  final RxnString supplements = RxnString();

  // Roman Urdu: controller ki values ko domain entity me convert karte hain.
  OnboardingData toOnboardingData() {
    return OnboardingData(
      gender: gender.value,
      dateOfBirth: dateOfBirth.value,
      height: height.value,
      heightUnit: heightUnit.value,
      weight: weight.value,
      weightUnit: weightUnit.value,
      activityLevel: activityLevel.value,
      sleepQuality: sleepQuality.value,
      primaryGoal: primaryGoal.value,
      sportType: sportType.value,
      bodyCompositionGoal: bodyCompositionGoal.value,
      wellbeingPriority: wellbeingPriority.value,
      stressLevel: stressLevel.value,
      riskCondition: riskCondition.value,
      dietaryRestriction: dietaryRestriction.value,
      mealsConsumed: mealsConsumed.value,
      alcoholFrequency: alcoholFrequency.value,
      eatingTime: eatingTime.value,
      mealPrepTime: mealPrepTime.value,
      eatOutFrequency: eatOutFrequency.value,
      sugaryDrinksFrequency: sugaryDrinksFrequency.value,
      supplements: supplements.value,
    );
  }

  // Roman Urdu: local storage se data aayega to yahan set kar dein.
  void applyOnboardingData(OnboardingData data) {
    gender.value = data.gender;
    dateOfBirth.value = data.dateOfBirth;
    height.value = data.height;
    heightUnit.value = data.heightUnit;
    weight.value = data.weight;
    weightUnit.value = data.weightUnit;
    activityLevel.value = data.activityLevel;
    sleepQuality.value = data.sleepQuality;
    primaryGoal.value = data.primaryGoal;
    sportType.value = data.sportType;
    bodyCompositionGoal.value = data.bodyCompositionGoal;
    wellbeingPriority.value = data.wellbeingPriority;
    stressLevel.value = data.stressLevel;
    riskCondition.value = data.riskCondition;
    dietaryRestriction.value = data.dietaryRestriction;
    mealsConsumed.value = data.mealsConsumed;
    alcoholFrequency.value = data.alcoholFrequency;
    eatingTime.value = data.eatingTime;
    mealPrepTime.value = data.mealPrepTime;
    eatOutFrequency.value = data.eatOutFrequency;
    sugaryDrinksFrequency.value = data.sugaryDrinksFrequency;
    supplements.value = data.supplements;
  }

  /// Validate current step and return an error message if invalid.
  /// Return null when the step is valid.
  // Roman Urdu: har step ke liye check ho ga, agar data missing ho to error aaye.
  String? validateStep(int step) {
    switch (step) {
      case 0:
        if (gender.value == null || gender.value!.isEmpty) {
          return "Please select your gender.";
        }
        return null;
      case 1:
        if (dateOfBirth.value == null) {
          return "Please select your date of birth.";
        }
        return null;
      case 2:
        if (height.value == null || height.value! <= 0) {
          return "Please enter a valid height.";
        }
        if (heightUnit.value == null || heightUnit.value!.isEmpty) {
          return "Please select a height unit.";
        }
        return null;
      case 3:
        if (weight.value == null || weight.value! <= 0) {
          return "Please enter a valid weight.";
        }
        if (weightUnit.value == null || weightUnit.value!.isEmpty) {
          return "Please select a weight unit.";
        }
        return null;
      case 4:
        if (activityLevel.value == null || activityLevel.value!.isEmpty) {
          return "Please select your activity level.";
        }
        return null;
      case 5:
        if (sleepQuality.value == null || sleepQuality.value!.isEmpty) {
          return "Please select your lifestyle/sleep quality.";
        }
        return null;
      case 6:
        if (primaryGoal.value == null || primaryGoal.value!.isEmpty) {
          return "Please select your primary goal.";
        }
        return null;
      case 7:
        if (sportType.value == null || sportType.value!.isEmpty) {
          return "Please select your sport type.";
        }
        return null;
      case 8:
        if (bodyCompositionGoal.value == null ||
            bodyCompositionGoal.value!.isEmpty) {
          return "Please select your body composition goal.";
        }
        return null;
      case 9:
        if (wellbeingPriority.value == null ||
            wellbeingPriority.value!.isEmpty) {
          return "Please select your well-being priority.";
        }
        return null;
      case 10:
        if (stressLevel.value == null || stressLevel.value!.isEmpty) {
          return "Please select your daily stress level.";
        }
        return null;
      case 11:
        if (riskCondition.value == null || riskCondition.value!.isEmpty) {
          return "Please select a risk condition.";
        }
        return null;
      case 12:
        if (dietaryRestriction.value == null ||
            dietaryRestriction.value!.isEmpty) {
          return "Please select a dietary restriction.";
        }
        return null;
      case 13:
        if (mealsConsumed.value == null || mealsConsumed.value!.isEmpty) {
          return "Please select your daily meals.";
        }
        return null;
      case 14:
        if (alcoholFrequency.value == null ||
            alcoholFrequency.value!.isEmpty) {
          return "Please select alcohol frequency.";
        }
        return null;
      case 15:
        if (eatingTime.value == null || eatingTime.value!.isEmpty) {
          return "Please select your eating time.";
        }
        return null;
      case 16:
        if (mealPrepTime.value == null || mealPrepTime.value!.isEmpty) {
          return "Please select meal preparation time.";
        }
        return null;
      case 17:
        if (eatOutFrequency.value == null || eatOutFrequency.value!.isEmpty) {
          return "Please select how often you eat out.";
        }
        return null;
      case 18:
        if (sugaryDrinksFrequency.value == null ||
            sugaryDrinksFrequency.value!.isEmpty) {
          return "Please select sugary drinks frequency.";
        }
        return null;
      case 19:
        if (supplements.value == null || supplements.value!.isEmpty) {
          return "Please select your supplement option.";
        }
        return null;
      default:
        return null;
    }
  }
}
