import 'package:get/get.dart';

/// Beginner-friendly controller to hold onboarding answers needed for validation.
class OnboardingValidationController extends GetxController {
  /// Step 0 (Screen 4): Gender
  final RxnString gender = RxnString();

  /// Step 1 (Screen 5): Date of birth
  final Rxn<DateTime> dateOfBirth = Rxn<DateTime>();

  /// Step 2 (Screen 6): Height (default set to current UI default)
  final RxInt height = 168.obs;

  /// Step 3 (Screen 7): Weight (default set to current UI default)
  final RxInt weight = 60.obs;

  /// Validate current step and return an error message if invalid.
  /// Return null when the step is valid.
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
        if (height.value <= 0) {
          return "Please enter a valid height.";
        }
        return null;
      case 3:
        if (weight.value <= 0) {
          return "Please enter a valid weight.";
        }
        return null;
      default:
        // Other screens already have a default selection in the UI.
        return null;
    }
  }
}
